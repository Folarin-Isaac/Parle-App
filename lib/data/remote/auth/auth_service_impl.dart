import 'dart:async';
import 'package:dio/dio.dart';
import 'package:parle_app/app/core/client/app_client.dart';
import 'package:parle_app/app/core/endpoints/endpoints.dart';
import 'package:parle_app/data/remote/auth/auth_service.dart';
import 'package:parle_app/ui/utils/app_logger.dart';

class AuthServiceImpl implements AuthService {
  final AppClient appClient;

  AuthServiceImpl(this.appClient);

  @override
  Future<Response?> login({
    required String emailAddress,
    required String password,
  }) async {
    const String url = Endpoints.login;

    Map<String, dynamic> data = {
      "email_address": emailAddress,
      "password": password,
    };
    Response res = await appClient.post(url, data);
    AppLogger.log("===========================> signIn result ==> $res");
    return res;
  }
}
