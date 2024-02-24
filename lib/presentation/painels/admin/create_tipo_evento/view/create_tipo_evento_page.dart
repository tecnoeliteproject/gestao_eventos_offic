import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/create_tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/descricao_form_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/imagem_form_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/imagens_de_exemplo_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/name_form_cubit_cubit.dart';

class CreateTipoEventoPage extends StatelessWidget {
  const CreateTipoEventoPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const CreateTipoEventoPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateTipoEventoBloc(),
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
          return Scaffold(
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
