import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(1);

  void changePage(int index) {
    emit(index);
  }
}