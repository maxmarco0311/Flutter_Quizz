part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class FetchUserLoading extends UserState {
  FetchUserLoading();
}

final class FetchUserSuccess extends UserState {
  final List<User> users;

  FetchUserSuccess({required this.users});
}

final class FetchUserFailure extends UserState {
  final String error;

  FetchUserFailure({required this.error});
}
