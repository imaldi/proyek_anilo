import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyek_anilo/data_layer/consts/Sizes.dart';
import 'package:proyek_anilo/data_layer/models/GithubRepoSearchResponse.dart';
import 'package:proyek_anilo/presentation_layer/widgets/MyToast.dart';

ListView githubRepoList(BuildContext listContext, List<GithubReposModel>? repos) {
  return ListView.builder(
    itemCount: repos?.length ?? 0,
    padding: EdgeInsets.all(8),
    itemBuilder: (context, index) {
      var currentUser = repos?[index];
      return InkWell(
        onTap: () => myToast("${currentUser?.fullName ?? "Nothing"} clicked"),
        child: Container(
          padding: EdgeInsets.all(size_small),
          margin: EdgeInsets.all(size_small),
          color: Colors.lightBlueAccent,
          child: ListTile(
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${currentUser?.name ?? "https://api.github.com/repos"}"),
                Text("URL: ${currentUser?.url ?? "https://api.github.com/repos"}"),
                Text("Owner: ${currentUser?.owner?.login ?? "Jake Warthon"}")
              ],
            ),
          ),
        ),
      );
    },
  );
}
