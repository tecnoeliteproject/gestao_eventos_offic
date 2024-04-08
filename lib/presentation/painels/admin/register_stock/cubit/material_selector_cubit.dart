import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/material_item.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_stock_usecase.dart';

part 'material_selector_state.dart';

class MaterialSelectorCubit extends Cubit<MaterialSelectorState> {
  MaterialSelectorCubit() : super(MaterialSelectorInitial()) {
    _stockUseCase = getIt<IStockUseCase>();
  }

  late final IStockUseCase _stockUseCase;

  void getAllMaterials() {
    emit(MaterialSelectorLoading());

    _stockUseCase.getAllStocks().then((value) {
      emit(MaterialSelectorLoaded(value.map((e) => e.material).toList()));
    }).catchError((Object e) {
      emit(MaterialSelectorError(e.toString()));
    });
  }
}
