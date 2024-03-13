import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gestao_eventos/core/helpers/custom_image_picker.dart';
import 'package:gestao_eventos/domain/entities/c_image.dart';

part 'imagem_form_state.dart';

class ImagemFormCubit extends Cubit<ImagemFormState> {
  ImagemFormCubit() : super(ImagemFormInitial());

  CImage? returnValue() {
    if (state is ImagemFormChanged) {
      return (state as ImagemFormChanged).imagem;
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
        ImagemFormChanged(
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
        ImagemFormChanged(
          imagem: CImage(
            url: file.path,
              bytes: file.readAsBytesSync(),
          ),
        ),
      );
    }
  }

  void clear() {
    emit(ImagemFormInitial());
  }
}
