import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gestao_eventos/data/datasources/i_tipo_evento_datasource.dart';
import 'package:gestao_eventos/data/datasources/remoto/firebase/tipo_evento_datasource.dart';
import 'package:gestao_eventos/data/repositories/tipo_evento_repository.dart';
import 'package:gestao_eventos/data/repositories_interfaces/i_tipo_evento_repository.dart';
import 'package:gestao_eventos/domain/usecases/tipo_evento_usecase.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_tipo_evento_usecase.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/descricao_form_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/imagem_form_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/imagens_de_exemplo_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/name_form_cubit_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt
    ..registerSingleton(FirebaseFirestore.instance)
    ..registerSingleton(FirebaseStorage.instance)
    ..registerSingleton<ITipoEventoDataSource>(
      FirebaseTipoTipoEventoDataSource(
        firestore: getIt(),
      ),
    )
    ..registerSingleton<ITipoEventoRepository>(
      TipoEventoRepository(getIt()),
    )
    ..registerSingleton<ITipoEventoUseCase>(
      TipoEventoUsecase(getIt()),
    )
    ..registerSingleton(NameFormCubitCubit())
    ..registerSingleton(DescricaoFormCubit())
    ..registerSingleton(ImagemFormCubit())
    ..registerSingleton(ImagensDeExemploFormCubit());
}
