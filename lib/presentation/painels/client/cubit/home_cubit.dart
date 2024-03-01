<<<<<<< HEAD
<<<<<<< HEAD
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  void changePage(int index) {
    emit(index);
  }
=======
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  void changePage(int index) {
    emit(index);
  }
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
=======
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(1);

  void changePage(int index) {
    emit(index);
  }
>>>>>>> origin/GDE-19-Adicionar-a-pagina/aba-chat-no-painel-gerente
}