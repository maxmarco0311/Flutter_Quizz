import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quizz/Models/user_model.dart';
import 'package:flutter_quizz/data.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUserEvent>((event, emit) async {
      emit(FetchUserLoading());
      try {
        await Future.delayed(const Duration(seconds: 3), () {
          final responseBody = fakeAPIRequest();
          // 因為這裡的responseBody是寫死的，所以不為空
          // compiler不讓我檢查是否為null
          Map<String, dynamic> sourceMap = json.decode(responseBody);
          final data = sourceMap['data'] as List<dynamic>;
          final users = <User>[];
          for (final element in data) {
            final user = User.fromMap(element as Map<String, dynamic>);
            users.add(user);
          }
          emit(FetchUserSuccess(users: users));
        });
      } on Error catch (e) {
        emit(FetchUserFailure(error: e.toString()));
        debugPrint(e.toString());
      } on Exception catch (e) {
        emit(FetchUserFailure(error: e.toString()));
        debugPrint(e.toString());
      }
    });
  }
}
