part of 'image_widget_cubit.dart';

sealed class ImageWidgetState extends Equatable {
  const ImageWidgetState(this.boxFit);

  final BoxFit boxFit;

  @override
  List<Object> get props => [];
}

final class ImageWidgetClicked extends ImageWidgetState {
  const ImageWidgetClicked(super.boxFit);
}
