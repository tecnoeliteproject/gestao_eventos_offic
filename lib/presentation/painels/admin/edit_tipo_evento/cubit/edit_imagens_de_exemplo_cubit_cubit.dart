import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gestao_eventos/domain/entities/c_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

part 'edit_imagens_de_exemplo_cubit_state.dart';

class EditImagensDeExemploFormCubit
    extends Cubit<EditImagensDeExemploFromState> {
  EditImagensDeExemploFormCubit()
      : super(const EditImagensDeExemploCubitInitial());

  List<Object>? returnValue() {
    return state.exemplos;
  }

  Future<void> onSelectImagem() async {
    if (kIsWeb) {
      final bytesFromPicker = await ImagePickerWeb.getImageAsBytes();

      if (bytesFromPicker == null) {
        return;
      }

      emit(
        EditImagensDeExemploCubitChanged(
          [
            ...state.exemplos.cast(),
            CImage(
              url: 'image_${DateTime.now().toIso8601String()}',
              bytes: bytesFromPicker,
            ),
          ],
        ),
      );
    } else {
      final picker = ImagePicker();
      final response = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (response == null) {
        return;
      }
      emit(
        EditImagensDeExemploCubitChanged(
          [
            ...state.exemplos.cast(),
            CImage(
              url: response.path,
              bytes: File(response.path).readAsBytesSync(),
            ),
          ],
        ),
      );
    }
  }

  void removeImage(String imagem) {
    // emit(
    //   ImagensDeExemploCubitChanged(
    //     state.exemplos.where((element) => element != imagem).toList(),
    //   ),
    // );
  }

  void clean() {
    emit(const EditImagensDeExemploCubitInitial());
  }

  Future<void> onSwitchImagem(int index) async {
    if (kIsWeb) {
      final bytesFromPicker = await ImagePickerWeb.getImageAsBytes();

      if (bytesFromPicker == null) {
        return;
      }

      var list = List<CImage>.from(state.exemplos.cast());

      list = list
        ..removeAt(index)
        ..insert(
          index,
          CImage(
            url: 'image_${DateTime.now().toIso8601String()}_$index',
            bytes: bytesFromPicker,
          ),
        );

      emit(
        EditImagensDeExemploCubitChanged([
          ...list.cast(),
        ]),
      );
    } else {
      final picker = ImagePicker();
      final response = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (response == null) {
        return;
      }

      var list = List<CImage>.from(state.exemplos);

      list = list
        ..removeAt(index)
        ..insert(
          index,
          CImage(
            url: response.path,
            bytes: File(response.path).readAsBytesSync(),
          ),
        );

      emit(
        EditImagensDeExemploCubitChanged([
          ...list.cast(),
        ]),
      );
    }
  }

  void clear() {
    emit(const EditImagensDeExemploCubitInitial());
  }

  void setExemplos(List<CImage> exemplos) {
    emit(EditImagensDeExemploCubitChanged(exemplos));
  }
}
