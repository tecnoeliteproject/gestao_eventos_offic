import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_eventos/data/datasources/i_tipo_evento_datasource.dart';
import 'package:gestao_eventos/data/datasources/remoto/firebase/tipo_evento_datasource.dart';
import 'package:gestao_eventos/data/repositories/tipo_evento_repository.dart';
import 'package:gestao_eventos/data/repositories_interfaces/i_tipo_evento_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt
    ..registerSingleton(FirebaseFirestore.instance)
    ..registerSingleton<ITipoEventoDataSource>(
      FirebaseTipoTipoEventoDataSource(
        firestore: getIt(),
      ),
    )
    ..registerSingleton<ITipoEventoRepository>(
      TipoEventoRepository(getIt()),
    );
}
