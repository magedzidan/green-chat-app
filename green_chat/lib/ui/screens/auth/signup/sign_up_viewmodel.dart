import 'package:firebase_auth/firebase_auth.dart';
import 'package:green_chat/core/enums/enums.dart';
import 'package:green_chat/core/models/user_model.dart';
import 'package:green_chat/core/other/base_view_modle.dart';
import 'package:green_chat/core/services/auth_service.dart';
import 'package:green_chat/core/services/database_service.dart';

class SignUpViewmodel extends BaseViewModle {
  final AuthService _auth;
  final DatabaseSerice _databaseSerice;
  SignUpViewmodel(this._auth, this._databaseSerice);

  String _name = "";
  String _email = "";
  String _password = "";
  String _confirmpassword = "";

  setName(String value) {
    _name = value;
    notifyListeners();
  }

  setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  setConfirmedPassword(String value) {
    if (_confirmpassword == _password) {
      _confirmpassword = value;
      notifyListeners();
    }
  }

  Future<void> signUp() async {
    setState(ViewState.loading);
    try {
      final res = await _auth.signup(_email, _password);
      if (res != null) {
        UserModel usermodel = UserModel(
            uid: res.uid, name: _name, password: _password, email: _email);
        await _databaseSerice.saveUser(usermodel.toMap());
      }
      setState(ViewState.idle);
    } on FirebaseAuthException catch (e) {
      setState(ViewState.idle);
      print(e);
    } catch (e) {
      setState(ViewState.idle);
      print(e);
    }
  }
}
