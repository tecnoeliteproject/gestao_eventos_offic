import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

part 'imagem_form_state.dart';

class ImagemFormCubit extends Cubit<ImagemFormState> {
  ImagemFormCubit() : super(ImagemFormInitial());

  String? returnValue() {
    return state.imagem;
  }

  Future<void> onSelectImagem() async {
    if (kIsWeb) {
      final bytesFromPicker = await ImagePickerWeb.getImageAsBytes();

      if (bytesFromPicker == null) {
        return;
      }

      emit(WebImagemFormChanged(bytesFromPicker));
    } else {
      final picker = ImagePicker();
      final response = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (response == null) {
        return;
      }
      emit(ImagemFormChanged(imagem: response.path));
    }
  }
}
