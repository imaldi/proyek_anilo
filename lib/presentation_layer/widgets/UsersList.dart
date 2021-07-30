import 'package:flutter/material.dart';
import 'package:proyek_anilo/data_layer/consts/Sizes.dart';
import 'package:proyek_anilo/data_layer/models/UserModel.dart';
import 'package:proyek_anilo/presentation_layer/widgets/MyToast.dart';

ListView usersList(BuildContext listContext, List<UsersModel>? users) {
  return ListView.builder(
    itemCount: users?.length ?? 0,
    padding: EdgeInsets.all(8),
    itemBuilder: (context, index) {
      var currentUser = users?[index];
      return InkWell(
        onTap: () => myToast("${currentUser?.login ?? "Nobody"} clicked"),
        child: ListTile(
          leading: Image.network(
            "${currentUser?.avatarUrl}",
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return Container(
                child: Center(child: Icon(Icons.people)),
              );
            },
          ),
          title: Text("${currentUser?.login ?? "Nobody"}"),
          subtitle: Column(
            children: [Text("${currentUser?.url ?? "https://api.github.com/users"}"), Text("User")],
          ),
        ),
      );
    },
  );
}
