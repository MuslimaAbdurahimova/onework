import 'package:flutter/cupertino.dart';
import 'package:onework/domen/repository/auth_repo.dart';
import 'package:onework/domen/service/local_store.dart';

class AuthController extends ChangeNotifier {
  String? wrongPassword;

  signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required VoidCallback onSuccess,
  }) async {
    if (password == confirmPassword) {
      final AuthRepo authRepo = AuthRepo();
      var res = await authRepo.signUp(email: email, password: password);
      if (res?.statusCode == 200) {
        onSuccess();
      }
    } else {
      wrongPassword = "Error Password";
      notifyListeners();
    }
  }

  verifyEmail(
      {required String code,
      required String email,
      required VoidCallback onSuccess}) async {
    final AuthRepo authRepo = AuthRepo();
    var res = await authRepo.verifyEmail(email: email, code: code);
    if (res != null) {
      await LocalStore.setAccessToken(res.token);
      onSuccess();
    }
  }
}
