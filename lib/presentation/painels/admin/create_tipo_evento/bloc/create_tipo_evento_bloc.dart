import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_tipo_evento_usecase.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/descricao_form_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/imagem_form_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/imagens_de_exemplo_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/name_form_cubit_cubit.dart';
import 'package:uuid/uuid.dart';
part 'create_tipo_evento_event.dart';
part 'create_tipo_evento_state.dart';

class CreateTipoEventoBloc
    extends Bloc<CreateTipoEventoEvent, CreateTipoEventoState> {
  CreateTipoEventoBloc() : super(const CreateTipoEventoInitial()) {
    _tipoEventoUseCase = getIt();
    _nameFormCubitCubit = getIt();
    _descricaoFormCubit = getIt();
    _imagemFormCubit = getIt();
    _imagensDeExemploFormCubit = getIt();

    on<AddTipoEventoEvent>(_onAddTipoEventoEvent);
  }
  late final ITipoEventoUseCase _tipoEventoUseCase;
  late final NameFormCubitCubit _nameFormCubitCubit;
  late final DescricaoFormCubit _descricaoFormCubit;
  late final ImagemFormCubit _imagemFormCubit;
  late final ImagensDeExemploFormCubit _imagensDeExemploFormCubit;

  FutureOr<void> _onAddTipoEventoEvent(
    AddTipoEventoEvent event,
    Emitter<CreateTipoEventoState> emit,
  ) async {
    final name = _nameFormCubitCubit.returnValue();
    final descricao = _descricaoFormCubit.returnValue();
    final imagem = _imagemFormCubit.returnValue();
    final amostras = _imagensDeExemploFormCubit.returnValue();

    if (name == null) {
      emit(const CreateTipoEventoFormError('Nome não informado'));
      return;
    }

    if (descricao == null) {
      emit(const CreateTipoEventoFormError('Descrição não informada'));
      return;
    }

    if (imagem == null) {
      emit(const CreateTipoEventoFormError('Imagem não informada'));
      return;
    }

    final tipoEvento = TipoEvento(
      id: const Uuid().v4(),
      name: name,
      image: imagem,
      description: descricao,
      exemplos: amostras ?? [],
    );

    emit(const CreateTipoEventoLoading());
    final result = await _tipoEventoUseCase.createTipoEvento(tipoEvento);

    if (result) {
      emit(const CreateTipoEventoSuccess());
    } else {
      emit(
        const CreateTipoEventoError(
          'Ocorreu um erro ao criar o tipo de evento',
        ),
      );
    }
  }
}
