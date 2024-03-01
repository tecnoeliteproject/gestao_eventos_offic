import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/create_tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/descricao_form_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/imagem_form_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/imagens_de_exemplo_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/name_form_cubit_cubit.dart';

class CreateTipoEventoPage extends StatefulWidget {
  const CreateTipoEventoPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const CreateTipoEventoPage(),
    );
  }

  @override
  State<CreateTipoEventoPage> createState() => _CreateTipoEventoPageState();
}

class _CreateTipoEventoPageState extends State<CreateTipoEventoPage> {
  @override
  void initState() {
    // registra as dependencias de cubit sempre que a tela for iniciada
    getIt
      ..registerSingleton<NameFormCubitCubit>(NameFormCubitCubit())
      ..registerSingleton<DescricaoFormCubit>(DescricaoFormCubit())
      ..registerSingleton<ImagemFormCubit>(ImagemFormCubit())
      ..registerSingleton<ImagensDeExemploFormCubit>(
        ImagensDeExemploFormCubit(),
      );

    super.initState();
  }

  @override
  void dispose() {
    getIt
      ..unregister(instance: getIt<NameFormCubitCubit>())
      ..unregister(instance: getIt<DescricaoFormCubit>())
      ..unregister(instance: getIt<ImagemFormCubit>())
      ..unregister(instance: getIt<ImagensDeExemploFormCubit>());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CreateTipoEventoBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<NameFormCubitCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<DescricaoFormCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ImagemFormCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ImagensDeExemploFormCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return BlocListener<CreateTipoEventoBloc, CreateTipoEventoState>(
            listener: (context, state) {
              // if (state is CreateTipoEventoLoading) {
              //   context.loaderOverlay.show();
              // } else {
              //   context.loaderOverlay.hide();
              // }
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Novo Tipo Evento'),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () async {
                    await BlocProvider.of<CreateTipoEventoBloc>(context)
                        .close()
                        .then((value) => Navigator.pop(context));
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              body: const CreateTipoEventoView(),
              floatingActionButton:
                  BlocBuilder<CreateTipoEventoBloc, CreateTipoEventoState>(
                builder: (context, state) {
                  return FloatingActionButton(
                    onPressed: () {
                      context
                          .read<CreateTipoEventoBloc>()
                          .add(const AddTipoEventoEvent());
                    },
                    child: const Icon(Icons.save_rounded),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class CreateTipoEventoView extends StatelessWidget {
  const CreateTipoEventoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateTipoEventoBody();
  }
}
