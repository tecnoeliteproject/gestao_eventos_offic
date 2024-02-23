part of 'tipo_eventos_bloc.dart';

/// {@template tipo_eventos_state}
/// TipoEventosState description
/// {@endtemplate}
class TipoEventosState extends Equatable {
  /// {@macro tipo_eventos_state}
  const TipoEventosState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current TipoEventosState with property changes
  TipoEventosState copyWith({
    String? customProperty,
  }) {
    return TipoEventosState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template tipo_eventos_initial}
/// The initial state of TipoEventosState
/// {@endtemplate}
class TipoEventosInitial extends TipoEventosState {
  /// {@macro tipo_eventos_initial}
  const TipoEventosInitial() : super();
}
