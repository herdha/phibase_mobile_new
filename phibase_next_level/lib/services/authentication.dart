import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:phibase_next_level/config/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  loginService(payload) async {
    try{
      var res = await Api.request.post('/common/users/login', data: payload);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', res.data['token']);
      // prefs.setString('business', res.data.permission[0].appID);
      // debugPrint(data.data.toString());
      // fetchCurrentUser();
      return res.data;
    } on DioException catch (error) {
      if(error.response != null){
        return error;
      }
    }
  }
  fetchData() async {
    try{
      var data = await Api.request.get('/common/items?app=kopsekop-7704813&page=1&count=50');
      debugPrint('data items ${data.data}');
      return data.data;
    } on DioException catch (error) {
      if(error.response != null){
        return error;
      }
    }
  }
  cektoken() async {
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      debugPrint('data prefs token ${token}');
      // await prefs.clear();
      // var data = await Api.request.get('/common/items?app=kopsekop-7704813&page=1&count=50');
      // debugPrint('data user ${data.data}');
      // return data.data;
    } on DioException catch (error) {
      if(error.response != null){
        return error;
      }
    }
  }
  clearPrefs() async {
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } on DioException catch (error) {
      if(error.response != null){
        return error;
      }
    }
  }
  
  currentUser() async {
    try{
      var res = await Api.request.get('/common/users/current-user');
      debugPrint('data user active ${res.data}');
    } on DioException catch (error) {
      if(error.response != null){
        return error;
      }
    }
  }
}