import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'image_widget_state.dart';

class ImageWidgetCubit extends Cubit<ImageWidgetState> {
  ImageWidgetCubit() : super(const ImageWidgetClicked(BoxFit.cover));

  void changeBoxFit() {
    if (state.boxFit == BoxFit.cover) {
      emit(const ImageWidgetClicked(BoxFit.contain));
    }

    if (state.boxFit == BoxFit.contain) {
      emit(const ImageWidgetClicked(BoxFit.cover));
    }
  }
}
