// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Api {
//   // static var logout = Get.put(SettingController());
//   static const _baseUrl = 'http://160.19.224.220/api/v2';

//   static Map<String, dynamic> headers = {
//     'Accept': 'application/json',
//     'Content-Type': 'application/json',
//   };

//   static Dio request = Dio(
//     BaseOptions(
//       baseUrl: _baseUrl,
//       headers: headers,
//       extra: {
//         'withCredentials': true,
//       }
//     )
//   );

//   // Tambahkan Interceptor
//   static void setupInterceptors() async {
//     final prefs = await SharedPreferences.getInstance();
//     request.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) {
//         // Menambahkan token Authorization ke header setiap permintaan
//         final token = prefs.getString('token');
//         debugPrint('token simpan ${token}');

//         // if (token != null) {
//           options.headers['Authorization'] = 'Bearer $token';
//         // } else {
//         //   options.headers.remove('Authorization');
//         // }

//         // print('Request[${options.method}] => PATH: ${options.path}');
//         return handler.next(options); // Lanjutkan dengan permintaan
//       },
//       onResponse: (response, handler) {
//         // print('Response[${response.statusCode}] => PATH: ${response.requestOptions.path}');
//         return handler.next(response); // Lanjutkan dengan respons
//       },
//       onError: (DioException e, handler) async {
//         // print('Error[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
//         if(e.response?.statusCode == 401){
//           // logout.logoutApi();
//           // await prefs.clear();
//           // Get.offNamed(AppRoutes.login);
//         }
//         debugPrint('debug: $e');
//         return handler.next(e); // Lanjutkan dengan kesalahan
//       },
//     ));
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class Api {
  // Base URL for your API
  static const _baseUrl = 'http://160.19.224.220/api/v2';

  // Dio instance with cookie manager
  static Dio request = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  // Set up cookie jar for Dio
  static CookieManager cookieManager = CookieManager(CookieJar());

  // Initialize Dio interceptors and cookie manager
  static void setupInterceptors() async {
    final prefs = await SharedPreferences.getInstance();

    // Add cookie manager interceptor to Dio instance
    request.interceptors.add(cookieManager);

    // Add custom interceptor for token management
    request.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Retrieve the token from shared preferences
        final token = prefs.getString('token');
        debugPrint('Token from shared preferences: $token');

        // Add Authorization header if the token is available
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        // Continue with the request
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Handle the response
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        // Handle error
        if (e.response?.statusCode == 401) {
          // Handle the case when token is expired
          // Log out or perform any necessary action
        }
        debugPrint('Error: $e');
        return handler.next(e);
      },
    ));
  }

  // To manually set cookies (for example after login)
  static Future<void> setCookies(List<Cookie> cookies) async {
    // Manually add cookies to the cookie jar
    await cookieManager.cookieJar.saveFromResponse(Uri.parse(_baseUrl), cookies);
  }

  // To manually get cookies (for example to view the cookies stored in the jar)
  static Future<List<Cookie>> getCookies() async {
    // Get cookies from the cookie jar for a specific URL
    var cookies = await cookieManager.cookieJar.loadForRequest(Uri.parse(_baseUrl));
    return cookies;
  }
}
