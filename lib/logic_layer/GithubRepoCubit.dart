import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:proyek_anilo/data_layer/models/UserModel.dart';
import 'package:proyek_anilo/data_layer/models/GithubRepoSearchResponse.dart';
import 'package:proyek_anilo/data_layer/repositories/GithubSearchRepository.dart';
import 'package:proyek_anilo/data_layer/repositories/UserRepository.dart';

part 'GithubRepoCubitState.dart';

class GithubRepoCubit extends Cubit<GithubRepoCubitState> {
  GithubRepoCubit() : super(GithubRepoCubitState(repos: []));
  GithubSearchRepository _githubReposModelRepository = GithubSearchRepository();

  Future searchRepo(String query) async {
    if (query.length >= 3) {
      var result = await _githubReposModelRepository.getGithubRepos(query);
      var newState = GithubRepoCubitState(repos: result);
      emit(newState);
    } else {
      emit(GithubRepoCubitState(repos: state.repos));
    }
  }
}
