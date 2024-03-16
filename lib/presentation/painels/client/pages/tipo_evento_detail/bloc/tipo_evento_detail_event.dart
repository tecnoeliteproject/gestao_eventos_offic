part of 'tipo_evento_detail_bloc.dart';

abstract class TipoEventoDetailEvent  extends Equatable {
  const TipoEventoDetailEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_tipo_evento_detail_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomTipoEventoDetailEvent extends TipoEventoDetailEvent {
  /// {@macro custom_tipo_evento_detail_event}
  const CustomTipoEventoDetailEvent();
}
