import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyek_anilo/logic_layer/UserCubit.dart';
import 'package:proyek_anilo/presentation_layer/widgets/UsersList.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    final userCubit = context.read<UserCubit>();
    userCubit.fetchRetrofitContributors();
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (c) {
      var users = c.watch<UserCubit>().state.users;
      return usersList(c, users);
    });
  }
}
