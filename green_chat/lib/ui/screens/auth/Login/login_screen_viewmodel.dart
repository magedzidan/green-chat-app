import 'package:green_chat/core/enums/enums.dart';
import 'package:green_chat/core/other/base_view_modle.dart';
import 'package:green_chat/core/services/auth_service.dart';
import 'package:logger/logger.dart';
import 'package:logger/logger.dart';

class LoginScreenViewmodel extends BaseViewModle {
  final AuthService _auth;
  LoginScreenViewmodel(this._auth);

  String _email = "";

  String _password = "";
  final _logger = Logger();
  setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future Login() async {
    setState(ViewState.loading);
    try {
      await _auth.login(_email, _password);
      setState(ViewState.idle);
    } catch (e) {
      setState(ViewState.idle);

      _logger.i(e.toString());
      rethrow;
    }
  }
}
