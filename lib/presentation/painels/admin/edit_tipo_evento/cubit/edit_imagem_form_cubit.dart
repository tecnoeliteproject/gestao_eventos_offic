import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gestao_eventos/domain/entities/c_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

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
      final bytesFromPicker = await ImagePickerWeb.getImageAsBytes();

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
      final picker = ImagePicker();
      final response = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (response == null) {
        return;
      }
      emit(
        EditImagemFormChanged(
          imagem: CImage(
            url: response.path,
            bytes: File(response.path).readAsBytesSync(),
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
