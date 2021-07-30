part of 'GithubRepoCubit.dart';

class GithubRepoCubitState extends Equatable {
  List<GithubReposModel>? repos;

  GithubRepoCubitState({this.repos});

  @override
  List<Object?> get props => [repos];
}
