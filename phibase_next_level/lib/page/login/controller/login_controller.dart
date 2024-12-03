import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:phibase_next_level/services/authentication.dart';

class LoginController extends GetxController{
  Authentication authService = Authentication();
  var showPass = true.obs;

  @override
  void onInit(){
    super.onInit();
  }

  login(String email, String password) async {
    try{
      var data = {
        "email": email,
        "password": password
      };
      print(data.toString());
      var response = await authService.loginService(data);
      debugPrint(response.toString());
    } on DioException catch (error) {
      debugPrint('gagal in controller login');
      debugPrint(error.response!.data['message'].toString());
    }
  }  
  
  getData() async {
    try{
      await authService.fetchData();
      // debugPrint(response.toString());
    } on DioException catch(error){
      debugPrint('gagal in controller login');
      debugPrint(error.response!.data['message'].toString());
    }
  }
  
  cekTokenSimpan() async {
    try{
      await authService.cektoken();
      // debugPrint(response.toString());
    } on DioException catch(error){
      debugPrint('gagal in controller login');
      debugPrint(error.response!.data['message'].toString());
    }
  }

  removePrefs() async {
    try{
      await authService.clearPrefs();
      // debugPrint(response.toString());
    } on DioException catch(error){
      debugPrint('gagal in controller login');
      debugPrint(error.response!.data['message'].toString());
    }
  }

  userActive() async {
    try{
      await authService.currentUser();
      // debugPrint(response.toString());
    } on DioException catch(error){
      debugPrint('gagal in controller login');
      debugPrint(error.response!.data['message'].toString());
    }
  }
}