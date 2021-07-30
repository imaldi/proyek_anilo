import 'package:proyek_anilo/data_layer/consts/URLS.dart';
import 'package:proyek_anilo/data_layer/models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserRepository {
  Future<List<UsersModel>?> getRetrofitContributors() async {
    String baseUrl = BASE_URL + RETROFIT_CONTRIBUTORS_URL;

    try {
      var response = await http.get(Uri.parse(baseUrl), headers: {'Accept': 'application/json'});
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<UsersModel>? employeeForms = data.map((e) => UsersModel.fromJson(e)).toList();
        print("Users From Repo Class = $data");
        return employeeForms;
      } else {
        print("Status Code : ${response.statusCode}");
        print("Error In Employee Repo Class : ${response.body}");
        throw Exception();
      }
    } catch (e) {
      // print("Error Lain di Employee Repo : $baseUrl");
      print("URL : $baseUrl");
      // print("Status Code : ${response.statusCode}");
      // print("Error In Employee Repo Class : ${response.body}");
      throw Exception();
    }
  }
}
