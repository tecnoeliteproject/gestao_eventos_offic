import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/material_item.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_material_usecase.dart';

part 'material_selector_state.dart';

class MaterialSelectorCubit extends Cubit<MaterialSelectorState> {
  MaterialSelectorCubit() : super(MaterialSelectorInitial()) {
    _materialUsecase = getIt();
  }

  late final IMaterialUsecase _materialUsecase;

  void getAllMaterials() {
    emit(MaterialSelectorLoading());

    _materialUsecase.getAllMaterials().then((value) {
      value.sort((a, b) => a.nome.compareTo(b.nome));
      if (value.isEmpty) {
        emit(MaterialSelectorEmpty());
      }
      emit(MaterialSelectorLoaded(value.toList()));
    }).catchError((Object e) {
      emit(MaterialSelectorError(e.toString()));
    });
  }
}
