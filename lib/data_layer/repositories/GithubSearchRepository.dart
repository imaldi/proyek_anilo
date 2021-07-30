import 'package:proyek_anilo/data_layer/consts/URLS.dart';
import 'package:proyek_anilo/data_layer/models/GithubRepoSearchResponse.dart';
import 'package:proyek_anilo/data_layer/models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GithubSearchRepository {
  Future<List<GithubReposModel>?> getGithubRepos(String query) async {
    try {
      var uri = Uri.https("api.github.com", SEARCH_GITHUB_REPOS_URL, {"q": query});

      var response = await http.get(uri, headers: {'Accept': 'application/json'});
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        GithubRepoSearchResponse githubResponse = GithubRepoSearchResponse.fromJson(data);
        print("GithubReposModel From Repo Class = $data");
        return githubResponse.items;
      } else {
        print("Status Code : ${response.statusCode}");
        print("Error In GithubReposModel Repo Class : ${response.body}");
        throw Exception();
      }
    } catch (e) {
      print("Error Lain di GithubReposModel Repo : ${e.toString()}");
      // print("URL : $baseUrl");
      // print("Status Code : ${response.statusCode}");
      // print("Error In Employee Repo Class : ${response.body}");
      throw Exception();
    }
  }
}
