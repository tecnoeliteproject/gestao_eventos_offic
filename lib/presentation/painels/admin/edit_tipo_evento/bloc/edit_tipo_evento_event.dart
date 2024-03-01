part of 'edit_tipo_evento_bloc.dart';

abstract class EditTipoEventoEvent extends Equatable {
  const EditTipoEventoEvent();

  @override
  List<Object> get props => [];
}

class SaveEditTipoEventoEvent extends EditTipoEventoEvent {
  const SaveEditTipoEventoEvent();
}
