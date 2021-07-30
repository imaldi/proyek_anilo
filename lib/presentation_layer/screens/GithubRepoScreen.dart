import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyek_anilo/data_layer/consts/Sizes.dart';
import 'package:proyek_anilo/logic_layer/GithubRepoCubit.dart';
import 'package:proyek_anilo/presentation_layer/widgets/GithubRepoList.dart';
import 'package:proyek_anilo/presentation_layer/widgets/MyTextField.dart';

class GithubRepoScreen extends StatefulWidget {
  const GithubRepoScreen({Key? key}) : super(key: key);

  @override
  _GithubRepoScreenState createState() => _GithubRepoScreenState();
}

class _GithubRepoScreenState extends State<GithubRepoScreen> {
  @override
  void initState() {
    final githubCubit = context.read<GithubRepoCubit>();
    githubCubit.searchRepo("");
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (c) {
      var repos = c.watch<GithubRepoCubit>().state.repos;

      TextEditingController controller = TextEditingController(text: "");
      return Stack(
        children: [
          MyTextField(
            controller: TextEditingController(text: ""),
            decoration: InputDecoration(
              hintText: "Search",
              prefix: Icon(Icons.search),
            ),
            enabled: true,
            onChanged: (v) {
              c.read<GithubRepoCubit>().searchRepo(v);
            },
          ),
          Container(padding: EdgeInsets.only(top: size_huge * 2), child: githubRepoList(c, repos)),
        ],
      );
    });
  }
}
