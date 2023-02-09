import 'package:dio/dio.dart';

import '../model/token_model.dart';

abstract class AuthFacade {
  Future<Response?> signUp({required String email, required String password});

  Future<TokenModel?> verifyEmail({required String email, required String code});
}
