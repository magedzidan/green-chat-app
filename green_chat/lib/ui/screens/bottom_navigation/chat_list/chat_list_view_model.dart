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

  fetchUser(){
    try {
       
    } catch (e) {
     _logger.i(e.toString()); 
    }
  }
}
