import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gestao_eventos/domain/entities/c_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

part 'imagens_de_exemplo_cubit_state.dart';

class ImagensDeExemploFormCubit extends Cubit<ImagensDeExemploFromState> {
  ImagensDeExemploFormCubit() : super(const ImagensDeExemploCubitInitial());

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
        ImagensDeExemploCubitChanged(
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
        ImagensDeExemploCubitChanged(
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
    emit(const ImagensDeExemploCubitInitial());
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
        ImagensDeExemploCubitChanged([
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
        ImagensDeExemploCubitChanged([
          ...list.cast(),
        ]),
      );
    }
  }
}
