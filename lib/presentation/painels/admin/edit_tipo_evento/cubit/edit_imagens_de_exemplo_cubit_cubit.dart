import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gestao_eventos/core/helpers/custom_image_picker.dart';
import 'package:gestao_eventos/domain/entities/c_image.dart';

part 'edit_imagens_de_exemplo_cubit_state.dart';

class EditImagensDeExemploFormCubit
    extends Cubit<EditImagensDeExemploFromState> {
  EditImagensDeExemploFormCubit()
      : super(const EditImagensDeExemploCubitInitial());

  List<Object>? returnValue() {
    return state.exemplos;
  }

  Future<void> onSelectImagem() async {
    final bytesFromPicker = await ImPicker.pickImage();

    if (bytesFromPicker == null) {
      return;
    }

    if (kIsWeb) {
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
      final file = File.fromRawPath(bytesFromPicker);
      emit(
        EditImagensDeExemploCubitChanged(
          [
            ...state.exemplos.cast(),
            CImage(
              url: file.path,
              bytes: file.readAsBytesSync(),
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
    final bytesFromPicker = await ImPicker.pickImage();

    if (bytesFromPicker == null) {
      return;
    }
    var list = List<CImage>.from(state.exemplos.cast());

    if (kIsWeb) {
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
      final file = File.fromRawPath(bytesFromPicker);
      list = list
        ..removeAt(index)
        ..insert(
          index,
          CImage(
            url: file.path,
            bytes: file.readAsBytesSync(),
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
