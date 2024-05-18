import 'dart:async';

import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:graphql/client.dart';
import 'package:task_craft/app/app_router.dart';
import 'package:task_craft/core/config/env/env.dart';
import 'package:task_craft/core/config/get_it.dart';
import 'package:task_craft/core/schema.graphql.dart';
import 'package:task_craft/core/service/local/app_state.dart';
import 'package:task_craft/core/widgets/snackbar.dart';
import 'package:task_craft/module/auth/data/repositories/auth_repository.dart';
import 'package:task_craft/module/auth/domain/usecase/refresh_token.dart';

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
          (headers) => HttpLinkHeaders(
            headers: headers! as Map<String, String>,
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

  MyGraphQLClient() {
    // initClient(headers: headers);
  }

/*  MyGraphQLClient.subscribe({Map<String, String>? params}) {
    _initWsClient(params: params);
  }*/

  Future<void> initClient({Map<String, String>? headers}) async {
    final storage = getIt<AppStateService>();
    final accessToken = await storage.getUserAccessToken();
    final freshLink = FreshLink.oAuth2(
      tokenHeader: (token) {
        return {
          'Authorization': 'bearer ${token?.accessToken}',
        };
      },
      tokenStorage: InMemoryTokenStorage(),
      refreshToken: (token, client) async {
        final authService = AuthRepository();
        final useCase = RefreshAccessToken(authService);
        final deviceUuid = await storage.getUserRefreshToken();
        final response = await useCase.call(
          refreshTokenInput: Input$RefreshTokenInput(
            deviceUuid: deviceUuid ?? '',
          ),
        );
        if (response == null) {
          await getIt<AppStateService>().clearAll();
          router.go('/auth/login');
          throw RevokeTokenException();
        }
        return OAuth2Token(accessToken: response.accessToken);
      },
      shouldRefresh: (response) {
        if (accessToken == null) {
          return false;
        }
        if(response.errors == null) {
          return false;
        }
        if (response.errors![0].message == 'Unauthorized') {
          return true;
        }
        if (response is RevokeTokenException) {
          return false;
        }
        return false;
      },
    )..authenticationStatus.listen(
        (event) {},
      );

    await freshLink.setToken(OAuth2Token(accessToken: accessToken ?? ''));

    client = GraphQLClient(
      link: Link.from([freshLink, graphqlUrl]),
      cache: GraphQLCache(store: InMemoryStore()),
      defaultPolicies: DefaultPolicies(
        watchQuery: policies,
        query: policies,
        mutate: policies,
      ),
    );
  }

/*  _initWsClient({Map<String, String>? params}) async {
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
        */ /*subProtocol: GraphQLProtocol.graphqlTransportWs),*/ /*
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
  }*/

  static void handleGraphQlException(QueryResult<dynamic> graphQlRes) {
    if (graphQlRes.hasException &&
        graphQlRes.exception?.graphqlErrors != null) {
      for (final error in graphQlRes.exception!.graphqlErrors) {
        showSnackBar(
          type: SnackBarType.error,
          message: error.message,
          withIcon: true,
        );
      }
    }
  }
}
