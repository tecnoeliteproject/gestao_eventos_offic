import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'channel_item_event.dart';
part 'channel_item_state.dart';

class ChannelItemBloc extends Bloc<ChannelItemEvent, ChannelItemState> {
  ChannelItemBloc() : super(ChannelItemInitialState()) {
    on<GetLastMessageEvent>((event, emit) {
      emit(GettingLastMessageState());
      try {
        
      } catch (e) {
        
      }
    });
  }
}
