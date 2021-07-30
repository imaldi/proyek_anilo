part of 'UserCubit.dart';

class UserCubitState extends Equatable {
  List<UsersModel>? users;

  UserCubitState({this.users});

  @override
  List<Object?> get props => [users];
}
