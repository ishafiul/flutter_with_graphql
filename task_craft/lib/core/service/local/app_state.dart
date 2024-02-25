

import 'package:isar/isar.dart';
import 'package:task_craft/bootstrap.dart';
import 'package:task_craft/core/service/local/i_app_state_service.dart';
import 'package:task_craft/core/utils/app_state_collection_isar.dart';
import 'package:task_craft/core/utils/isar_db.dart';

/// The `AppStateService` class implements the [IAppStateService] interface.
class AppStateService implements IAppStateService {
  /// Retrieves the user access token from the local storage.
  @override
  Future<String?> getUserAccessToken() async {
    final isar = DB();
    final db = await isar.local;
    final appStates = await db.appStates.where().findAll();
    final appState = appStates.firstOrNull;
    if (appState?.user?.accessToken == null) {
      return null;
    }
    return appState?.user?.accessToken;
  }

  /// Retrieves the user ID from the local storage.
  @override
  Future<String?> getUserID() async {
    final isar = DB();
    final db = await isar.local;
    final appStates = await db.appStates.where().findAll();
    final appState = appStates.firstOrNull;
    if (appState?.user?.id == null) {
      return null;
    }
    return appState?.user?.id;
  }

  /// Retrieves the user refresh token from the local storage.
  @override
  Future<String?> getUserRefreshToken() async {
    final isar = DB();
    final db = await isar.local;
    final appStates = await db.appStates.where().findAll();
    final appState = appStates.firstOrNull;
    if (appState?.user?.refreshToken == null) {
      return null;
    }
    return appState?.user?.refreshToken;
  }

  /// Clears all stored data in the local storage.
  @override
  Future<void> clearAll() async {
    final isar = DB();
    await isar.closeDB();
  }

  /// Updates the user access token in the local storage.
  @override
  Future<void> updateAccessToken(String accessToken) async {
    final isar = DB();
    final db = await isar.local;
    final appStates = await db.appStates.where().findAll();
    final appState = appStates.firstOrNull;
    if (appState?.user == null) {
      return;
    }
    await db.writeTxn(() async {
      appState?.user!.accessToken = accessToken;
      await db.appStates.put(appState!);
    });
  }

  /// Updates the user access token in the local storage.
  @override
  Future<void> updateRefreshToken(String refreshToken) async {
    final isar = DB();
    final db = await isar.local;
    final appStates = await db.appStates.where().findAll();
    final appState = appStates.firstOrNull;
    if (appState?.user == null) {
      return;
    }
    await db.writeTxn(() async {
      appState?.user!.refreshToken = refreshToken;
      await db.appStates.put(appState!);
    });
  }

  /// Initializes the local database with the provided [user] and returns the [AppState].
  @override
  Future<AppState?> initLocalDbUser(User user) async {
    final isar = DB();
    final db = await isar.local;
    int id = 0;
    await db.writeTxn(() async {
      id = await db.appStates.put(AppState()..user = user);
    });
    return await db.appStates.get(id);
  }

  @override
  Future<bool> isLoggedIn() async {
    final isar = DB();
    final db = await isar.local;
    final appStates = await db.appStates.where().findAll();
    final appState = appStates.firstOrNull;
    logger.i('appState: $appStates');
    if (appState?.user == null) {
      return false;
    }
    if (appState?.user?.accessToken == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<void> updateUserID(String userId) async {
    final isar = DB();
    final db = await isar.local;
    final appStates = await db.appStates.where().findAll();
    final appState = appStates.firstOrNull;
    if (appState?.user == null) {
      return;
    }
    await db.writeTxn(() async {
      appState?.user!.id = userId;
      await db.appStates.put(appState!);
    });
  }

  Future<void> setIsProvider(bool isProvider) async {
    final isar = DB();
    final db = await isar.local;
    final appStates = await db.appStates.where().findAll();
    final appState = appStates.firstOrNull;
    if (appState?.user == null) {
      return;
    }
    await db.writeTxn(() async {
      appState?.user!.isProvider = isProvider;
      await db.appStates.put(appState!);
    });
  }

  Future<bool> get isProvider async {
    final isar = DB();
    final db = await isar.local;
    final appStates = await db.appStates.where().findAll();
    final appState = appStates.firstOrNull;
    logger.i('appState: $appStates');
    if (appState?.user == null) {
      return false;
    }
    return appState?.user?.isProvider ?? false;
  }
}
