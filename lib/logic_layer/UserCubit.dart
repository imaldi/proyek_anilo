import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:proyek_anilo/data_layer/models/UserModel.dart';
import 'package:proyek_anilo/data_layer/repositories/UserRepository.dart';

part 'UserCubitState.dart';

class UserCubit extends Cubit<UserCubitState> {
  UserCubit() : super(UserCubitState(users: []));
  UserRepository _userRepository = UserRepository();

  Future fetchRetrofitContributors() async {
    var result = await _userRepository.getRetrofitContributors();
    var newState = UserCubitState(users: result);
    emit(newState);
  }
}
