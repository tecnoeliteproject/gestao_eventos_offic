import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_tipo_evento_usecase.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/descricao_form_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/name_form_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/cubit/edit_imagem_form_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/cubit/edit_imagens_de_exemplo_cubit_cubit.dart';
part 'edit_tipo_evento_event.dart';
part 'edit_tipo_evento_state.dart';

class EditTipoEventoBloc
    extends Bloc<SaveEditTipoEventoEvent, EditTipoEventoState> {
  EditTipoEventoBloc() : super(const EditTipoEventoInitial()) {
    on<SaveEditTipoEventoEvent>(_onSaveEditTipoEventoEvent);
  }

  late final ITipoEventoUseCase _tipoEventoUseCase;
  late final NameFormCubitCubit _nameFormCubitCubit;
  late final DescricaoFormCubit _descricaoFormCubit;
  late final EditImagemFormCubit _imagemFormCubit;
  late final EditImagensDeExemploFormCubit _imagensDeExemploFormCubit;

  FutureOr<void> _onSaveEditTipoEventoEvent(
    SaveEditTipoEventoEvent event,
    Emitter<EditTipoEventoState> emit,
  ) async {
    _tipoEventoUseCase = getIt();
    _nameFormCubitCubit = getIt();
    _descricaoFormCubit = getIt();
    _imagemFormCubit = getIt();
    _imagensDeExemploFormCubit = getIt();

    final name = _nameFormCubitCubit.returnValue();
    final descricao = _descricaoFormCubit.returnValue();
    final imagem = _imagemFormCubit.returnValue();
    final amostras = _imagensDeExemploFormCubit.returnValue();

    if (name == null || name.isEmpty) {
      emit(const EditTipoEventoFormError('Nome não informado'));
      return;
    }

    if (descricao == null || descricao.isEmpty) {
      emit(const EditTipoEventoFormError('Descrição não informada'));
      return;
    }

    if (imagem == null) {
      emit(const EditTipoEventoFormError('Imagem não informada'));
      return;
    }

    final tipoEvento = TipoEvento(
      id: getIt<TipoEvento>().id,
      name: name,
      image: imagem,
      description: descricao,
      exemplos: amostras?.cast() ?? [],
    );

    emit(const EditTipoEventoLoading());
    try {
      final result = await _tipoEventoUseCase.updateTipoEvento(tipoEvento);

      if (result != null) {
        emit(EditTipoEventoSuccess(result));
      } else {
        emit(
          const EditTipoEventoError(
            'Ocorreu um erro ao criar o tipo de evento',
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(EditTipoEventoError(e.toString()));
    }
  }
}
