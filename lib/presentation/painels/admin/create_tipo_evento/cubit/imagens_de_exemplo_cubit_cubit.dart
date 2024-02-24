import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'imagens_de_exemplo_cubit_state.dart';

class ImagensDeExemploFormCubit extends Cubit<ImagensDeExemploFromState> {
  ImagensDeExemploFormCubit() : super(ImagensDeExemploCubitInitial());

  List<String>? returnValue() {
    return state.exemplos;
  }

  Future<void> onSelectImagem() async {
    final picker = ImagePicker();
    final response = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (response == null) {
      return;
    }

    _addImage(response.path);
  }

  void _addImage(String imagem) {
    emit(ImagensDeExemploCubitChanged([...state.exemplos, imagem]));
  }

  void removeImage(String imagem) {
    emit(ImagensDeExemploCubitChanged(
        state.exemplos.where((element) => element != imagem).toList()));
  }

  void clean() {
    emit(ImagensDeExemploCubitInitial());
  }

  Future<void> onSwitchImagem(int index) async {
    final picker = ImagePicker();
    final response = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (response == null) {
      return;
    }

    var list = List<String>.from(state.exemplos);

    list = list
      ..removeAt(index)
      ..insert(index, response.path);

    emit(
      ImagensDeExemploCubitChanged(list),
    );
  }
}
