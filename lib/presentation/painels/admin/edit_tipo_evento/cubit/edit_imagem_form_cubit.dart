import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gestao_eventos/domain/entities/c_image.dart';
import 'package:gestao_eventos/core/helpers/custom_image_picker.dart';

part 'edit_imagem_form_state.dart';

class EditImagemFormCubit extends Cubit<EditImagemFormState> {
  EditImagemFormCubit() : super(EditImagemFormInitial());

  CImage? returnValue() {
    if (state is EditImagemFormChanged) {
      return (state as EditImagemFormChanged).imagem;
    }
    return null;
  }

  Future<void> onSelectImagem() async {
    if (kIsWeb) {
      final bytesFromPicker = await ImPicker.pickImage();

      if (bytesFromPicker == null) {
        return;
      }

      emit(
        EditImagemFormChanged(
          imagem: CImage(
            url: 'image_${DateTime.now().toIso8601String()}',
            bytes: bytesFromPicker,
          ),
        ),
      );
    } else {
      final response = await ImPicker.pickImage();

      if (response == null) {
        return;
      }

      final file = File.fromRawPath(response);
      emit(
        EditImagemFormChanged(
          imagem: CImage(
            url: file.path,
              bytes: file.readAsBytesSync(),
          ),
        ),
      );
    }
  }

  Future<void> setImagem(CImage imagem) async {
    emit(EditImagemFormChanged(imagem: imagem));
  }

  void clear() {
    emit(EditImagemFormInitial());
  }
}
