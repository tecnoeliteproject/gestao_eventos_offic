import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'name_form_cubit_state.dart';

class NameFormCubitCubit extends Cubit<NameFormCubitState> {
  NameFormCubitCubit() : super(const NameFormCubitInitial());

  String? returnValue() {
    return state.name;
  }

  void nameChanged(String name) {
    emit(NameFormCubitChanged(name));
  }

  void clean() {
    emit(const NameFormCubitInitial());
  }

  void onUpdate(String name) {
    emit(NameFormCubitChanged(name));

    if (kDebugMode) {
      log(state.name);
    }
  }

  String? validateName(String? name) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Name é um campo obrigatóriorio';
    }
    return null;
  }

  void clear() {
    emit(const NameFormCubitInitial());
  }
}
