import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gestao_eventos/data/datasources/i_stock_datasource.dart';
import 'package:gestao_eventos/data/datasources/i_tipo_evento_datasource.dart';
import 'package:gestao_eventos/data/datasources/remoto/firebase/firebase_stock_datasource.dart';
import 'package:gestao_eventos/data/datasources/remoto/firebase/firebase_tipo_evento_datasource.dart';
import 'package:gestao_eventos/data/repositories/stock_repository.dart';
import 'package:gestao_eventos/data/repositories/tipo_evento_repository.dart';
import 'package:gestao_eventos/data/repositories_interfaces/i_stock_repository.dart';
import 'package:gestao_eventos/data/repositories_interfaces/i_tipo_evento_repository.dart';
import 'package:gestao_eventos/domain/usecases/stock_usecase.dart';
import 'package:gestao_eventos/domain/usecases/tipo_evento_usecase.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_stock_usecase.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_tipo_evento_usecase.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/bloc/create_tipo_evento_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/bloc/edit_tipo_evento_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/product_details.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/bloc/tipo_eventos_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/archived_list_tipo_eventos_cubit.dart';
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
    ..registerLazySingleton<IStockDatasource>(
      FirebaseStockDatasource.new,
    )
    ..registerLazySingleton<IStockRepository>(
      () => StockRepository(getIt()),
    )
    ..registerLazySingleton<IStockUseCase>(
      () => StockUseCase(getIt()),
    )
    // Blocs

    ..registerLazySingleton(TipoEventosBloc.new)
    ..registerLazySingleton(ProductDetailsBloc.new)
    ..registerLazySingleton(CreateTipoEventoBloc.new)
    ..registerLazySingleton(EditTipoEventoBloc.new)

    //cubits
    ..registerLazySingleton(ArchivedListTipoEventosCubit.new);
  // ..registerLazySingleton(ListTipoEventosCubit.new);
}
