import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:task_craft/core/config/env/env.dart';
import 'package:task_craft/core/config/get_it.dart';
import 'package:task_craft/core/service/local/app_state.dart';
import 'package:task_craft/core/widgets/snackbar.dart';

typedef _RequestTransformer = FutureOr<Request> Function(Request request);

class CustomAuthLink extends _AsyncReqTransformLink {
  CustomAuthLink({
    required this.getHeaders,
  }) : super(requestTransformer: transform(getHeaders));

  final FutureOr<Map<String, String>>? Function() getHeaders;

  static _RequestTransformer transform(
      FutureOr<Map<String, String>>? Function() getHeaders,
      ) =>
          (Request request) async {
        final Map<String, String>? headers = await getHeaders();
        return request.updateContextEntry<HttpLinkHeaders>(
              (_headers) => HttpLinkHeaders(
            headers: headers!,
          ),
        );
      };
}

class _AsyncReqTransformLink extends Link {
  final _RequestTransformer requestTransformer;

  _AsyncReqTransformLink({
    required this.requestTransformer,
  });

  @override
  Stream<Response> request(
      Request request, [
        NextLink? forward,
      ]) async* {
    final req = await requestTransformer(request);

    yield* forward!(req);
  }
}

final graphqlUrl = HttpLink(EnvProd.host);
const graphqlWsUrl = EnvProd.hostWs;
final policies = Policies(
  fetch: FetchPolicy.noCache,
);

class MyGraphQLClient {
  late final GraphQLClient client;

  _initClient({Map<String, String>? headers}) async {
    final storage = getIt<AppStateService>();
    final isLoggedIn = await storage.isLoggedIn();
    Link customAuthLink = graphqlUrl;
    final token = await storage.getUserAccessToken();
    customAuthLink = Link.concat(
      CustomAuthLink(
        getHeaders: () {
          final Map<String, String> authorization =
          isLoggedIn ? {"Authorization": token ?? ''} : {};
          return {...authorization, ...?headers};
        },
      ),
      graphqlUrl,
    );

    client = GraphQLClient(
      link: customAuthLink,
      cache: GraphQLCache(store: InMemoryStore()),
      defaultPolicies: DefaultPolicies(
        watchQuery: policies,
        query: policies,
        mutate: policies,
      ),
    );
  }

  _initWsClient({Map<String, String>? params}) async {
    Link customAuthLink = graphqlUrl;
    final storage = getIt<AppStateService>();
    final isLoggedIn = await storage.isLoggedIn();
    final token = await storage.getUserAccessToken();
    customAuthLink = Link.split(
          (request) => request.isSubscription,
      WebSocketLink(
        graphqlWsUrl,
        config: SocketClientConfig(
          inactivityTimeout: const Duration(minutes: 15),
          initialPayload: () {
            final Map<String, String> authorization =
            isLoggedIn ? {"accessToken": token ?? ''} : {};
            return {...authorization, ...?params};
          },
        ),
        /*subProtocol: GraphQLProtocol.graphqlTransportWs),*/
      ),
    );
    client = GraphQLClient(
      link: customAuthLink,
      cache: GraphQLCache(store: InMemoryStore()),
      defaultPolicies: DefaultPolicies(
        subscribe: Policies.safe(
          FetchPolicy.noCache,
          ErrorPolicy.none,
          CacheRereadPolicy.mergeOptimistic,
        ),
      ),
    );
  }

  MyGraphQLClient({Map<String, String>? headers}) {
    _initClient(headers: headers);
  }

  MyGraphQLClient.subscribe({Map<String, String>? params}) {
    _initWsClient(params: params);
  }

  static void handleGraphQlException(QueryResult<dynamic> graphQlRes) {
    if (graphQlRes.hasException &&
        graphQlRes.exception?.graphqlErrors != null) {
      for (final error in graphQlRes.exception!.graphqlErrors) {
        showSnackBar(
          type: SnackBarType.error,
          message: error.message,
          title: "ERROR",
          leadingIcon: Icons.error,
          tailingIcon: Icons.close,
        );
      }
    }
  }
}
