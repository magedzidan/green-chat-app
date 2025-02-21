import 'package:green_chat/core/enums/enums.dart';
import 'package:green_chat/core/models/user_model.dart';
import 'package:green_chat/core/other/base_view_modle.dart';
import 'package:green_chat/core/services/database_service.dart';
import 'package:logger/logger.dart';
class ChatListViewModel extends BaseViewModle {
  final DatabaseSerice _db;
  final UserModel currentUser;
  final _logger = Logger();

  ChatListViewModel(this._db, this.currentUser) {
    fetchUser();
  }

  List<UserModel> _users = [];
  List<UserModel> _filteredUseres = [];

  List<UserModel> get users => _users;
  List<UserModel> get filteredUseres => _filteredUseres;

  searchUser(String value) {
    if (value.isEmpty) {
      _filteredUseres = List.from(_users); // Ensure it resets properly
    } else {
      _filteredUseres = _users
          .where((e) => e.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  fetchUser() async {
    setState(ViewState.loading);
    try {
      final res = await _db.fetchUsers(currentUser.uid!);
      if (res.isNotEmpty) {
        _users = res.map((e) => UserModel.fromMap(e!)).toList();
        _filteredUseres = List.from(_users); // Ensure filtered list is also set
        notifyListeners();
      }
      setState(ViewState.idle);
    } catch (e) {
      _logger.i(e.toString());
    }
  }
}
