import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/descricao_form_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/name_form_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/cubit/edit_imagem_form_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/cubit/edit_imagens_de_exemplo_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/widgets/edit_tipo_evento_body.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/product_details.dart';

class EditTipoEventoPage extends StatefulWidget {
  const EditTipoEventoPage({
    required this.tipoEvento,
    super.key,
  });

  final TipoEvento tipoEvento;

  static Route<dynamic> route(
    TipoEvento tipoEvento,
    ProductDetailsBloc productDBloc,
  ) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => BlocProvider.value(
        value: productDBloc,
        child: EditTipoEventoPage(
          tipoEvento: tipoEvento,
        ),
      ),
    );
  }

  @override
  State<EditTipoEventoPage> createState() => _EditTipoEventoPageState();
}

class _EditTipoEventoPageState extends State<EditTipoEventoPage> {
  @override
  void initState() {
    // registra as dependencias de cubit sempre que a tela for iniciada
    getIt
      ..registerSingleton<NameFormCubitCubit>(NameFormCubitCubit())
      ..registerSingleton<DescricaoFormCubit>(DescricaoFormCubit())
      ..registerSingleton<EditImagemFormCubit>(EditImagemFormCubit())
      ..registerSingleton<EditImagensDeExemploFormCubit>(
        EditImagensDeExemploFormCubit(),
      )
      ..pushNewScope(
        scopeName: widget.tipoEvento.id,
      )
      ..registerSingleton(widget.tipoEvento);

    super.initState();
  }

  @override
  void dispose() {
    getIt
      ..unregister(instance: getIt<NameFormCubitCubit>())
      ..unregister(instance: getIt<DescricaoFormCubit>())
      ..unregister(instance: getIt<EditImagemFormCubit>())
      ..unregister(instance: getIt<EditImagensDeExemploFormCubit>())
      ..popScope();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<EditTipoEventoBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<NameFormCubitCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<DescricaoFormCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<EditImagemFormCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<EditImagensDeExemploFormCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return BlocListener<EditTipoEventoBloc, EditTipoEventoState>(
            listener: (context, state) {
              if (state is EditTipoEventoSuccess) {
                BlocProvider.of<ProductDetailsBloc>(context).add(
                  RefreshProductEvent(state.tipoEvento),
                );
                Navigator.of(context).pop();
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Editar Tipo de Evento'),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () async {
                    await BlocProvider.of<EditTipoEventoBloc>(context)
                        .close()
                        .then((value) => Navigator.pop(context));
                  },
                  icon: const Icon(Icons.close),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: IconButton(
                      onPressed: () async {
                        context
                            .read<EditTipoEventoBloc>()
                            .add(const SaveEditTipoEventoEvent());
                      },
                      icon: const Icon(FontAwesomeIcons.floppyDisk),
                    ),
                  ),
                ],
              ),
              body: const EditTipoEventoView(),
              floatingActionButton:
                  BlocBuilder<EditTipoEventoBloc, EditTipoEventoState>(
                builder: (context, state) {
                  return FloatingActionButton(
                    onPressed: () {
                      context
                          .read<EditTipoEventoBloc>()
                          .add(const SaveEditTipoEventoEvent());
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

class EditTipoEventoView extends StatelessWidget {
  const EditTipoEventoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EditTipoEventoBody();
  }
}
