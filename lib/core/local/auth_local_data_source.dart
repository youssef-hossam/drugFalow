import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../errors/exceptions.dart';

const loginConst = "login";
const cacheEmployeeTokenConst = "cache_employee_token_cons";
const profileUser = "user_profile";
const userInfoConst = 'user_info_const';
 const String cacheTokenConst = 'CACHE_TOKEN';
const String cacheNotificationSettingsConst =
    'CACHE_NOTIFICATION_SETTINGS';

abstract class AuthLocalDataSource {
  Future<void> cacheUserAccessToken({required String token});
  Future<String> getCachedUserAccessToken();
  /*Future<void> cacheUserVerificationInfo({required User user});
  Future<User> getCachedUserVerificationInfo();*/


  /// Cache notification settings ONLY
  /*Future<void> cacheNotificationSettings(
      {required NotificationSettings settings});

  /// Get cached notification settings
  Future<NotificationSettings> getCachedNotificationSettings();*/
}
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl(this.sharedPreferences);



  // =========================
  // ACCESS TOKEN
  // =========================
  @override
  Future<void> cacheUserAccessToken({required String token}) async {
    try {
      await sharedPreferences.setString(cacheTokenConst, token);
    } catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<String> getCachedUserAccessToken() async {
    try {
      final token = sharedPreferences.getString(cacheTokenConst);
      if (token != null) {
        return token;
      } else {
        throw NoCachedUserException();
      }
    } on NoCachedUserException {
      rethrow;
    } catch (_) {
      throw CacheException();
    }
  }


 /* @override
  Future<void> cacheUserVerificationInfo({required User user}) async {
    try {
      final userJson = user.toJson(); // Make sure your User model has toJson()
      await sharedPreferences.setString('cached_user', jsonEncode(userJson));
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<User> getCachedUserVerificationInfo() async {
    final userString = sharedPreferences.getString('cached_user');
    if (userString != null) {
      final Map<String, dynamic> json = jsonDecode(userString);
      return User.fromJson(json); // Make sure User has fromJson()
    }
    throw NoCachedUserException();
  }*/
}

