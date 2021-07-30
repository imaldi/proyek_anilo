import 'package:flutter/material.dart';
import 'package:proyek_anilo/data_layer/consts/Sizes.dart';
import 'package:proyek_anilo/data_layer/models/GithubRepoSearchResponse.dart';
import 'package:proyek_anilo/data_layer/models/UserModel.dart';
import 'package:proyek_anilo/presentation_layer/widgets/MyToast.dart';

ListView githubRepoList(BuildContext listContext, List<GithubReposModel>? repos) {
  return ListView.builder(
    itemCount: repos?.length ?? 0,
    padding: EdgeInsets.all(8),
    itemBuilder: (context, index) {
      var currentUser = repos?[index];
      return InkWell(
        onTap: () => myToast("${currentUser?.fullName ?? "Nothing"} clicked"),
        child: ListTile(
          subtitle: Column(
            children: [
              Text("Name: ${currentUser?.name ?? "https://api.github.com/repos"}"),
              Text("URL: ${currentUser?.url ?? "https://api.github.com/repos"}"),
              Text("Owner: ${currentUser?.owner?.login ?? "Jake Warthon"}")
            ],
          ),
        ),
      );
    },
  );
}
