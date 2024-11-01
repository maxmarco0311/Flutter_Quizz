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
          // json.decode吃json string，轉成Map<String, dynamic>
          Map<String, dynamic> sourceMap = json.decode(responseBody);
          // Map<String, dynamic>用[]取值後要轉型
          final data = sourceMap['data'] as List<dynamic>;
          final users = <User>[];
          // 現在常用的套件吃Map<String, dynamic>的是fromJson()，Dart Data Class Generator是fromMap()
          users.addAll(data
              .map((element) => User.fromMap(element as Map<String, dynamic>)));
          // json.encode吃任何型別的object(含Map<String, dynamic>），轉成json string

          // users.addAll(
          //     data.map((element) => User.fromJson(json.encode(element))));
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
