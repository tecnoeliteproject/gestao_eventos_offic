part of 'tipo_evento_detail_bloc.dart';

/// {@template tipo_evento_detail_state}
/// TipoEventoDetailState description
/// {@endtemplate}
class TipoEventoDetailState extends Equatable {
  /// {@macro tipo_evento_detail_state}
  const TipoEventoDetailState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current TipoEventoDetailState with property changes
  TipoEventoDetailState copyWith({
    String? customProperty,
  }) {
    return TipoEventoDetailState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template tipo_evento_detail_initial}
/// The initial state of TipoEventoDetailState
/// {@endtemplate}
class TipoEventoDetailInitial extends TipoEventoDetailState {
  /// {@macro tipo_evento_detail_initial}
  const TipoEventoDetailInitial() : super();
}
