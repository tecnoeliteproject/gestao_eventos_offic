import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'descricao_form_cubit_state.dart';

class DescricaoFormCubit extends Cubit<DescricaoFormCubitState> {
  DescricaoFormCubit() : super(const DescricaoFormCubitInitial());

  String? returnValue() {
    return state.descricao;
  }

  void descricaoChanged(String descricao) {
    emit(DescricaoFormCubitChanged(descricao));
  }

  void clean() {
    emit(const DescricaoFormCubitInitial());
  }

  void onUpdate(String descricao) {
    emit(DescricaoFormCubitChanged(descricao));

    if (kDebugMode) {
      log(state.descricao);
    }
  }

  String? validateDescricao(String? descricao) {
    if (descricao == null) {
      return null;
    }

    if (descricao.isEmpty) {
      return 'Descricao é um campo obrigatório';
    }
    return null;
  }
}
