import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/edit_tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/bloc/tipo_eventos_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/archived_list_tipo_eventos_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/list_tipo_eventos_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/search_tipo_eventos_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/widgets/archived_tipo_eventos_body.dart';

class ArchivedTipoEventosPage extends StatefulWidget {
  const ArchivedTipoEventosPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ArchivedTipoEventosPage(),
    );
  }

  @override
  State<ArchivedTipoEventosPage> createState() =>
      _ArchivedTipoEventosPageState();
}

class _ArchivedTipoEventosPageState extends State<ArchivedTipoEventosPage> {
  @override
  void initState() {
    super.initState();
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<TipoEventosBloc>(),
        ),
        BlocProvider(
          create: (context) => SearchTipoEventosCubit(),
        ),
        BlocProvider(
          create: (context) => getIt<ArchivedListTipoEventosCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocListener(
            listeners: [
              BlocListener<EditTipoEventoBloc, EditTipoEventoState>(
                bloc: getIt<EditTipoEventoBloc>(),
                listener: (context, state) {
                  if (state is EditTipoEventoSuccess) {
                    getIt<ListTipoEventosCubit>().listTipoEventos();
                  }
                },
              ),
            ],
            child: Scaffold(
              appBar: _buildAppBarWidget(context),
              body: const ArchivedTipoEventosView(),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBarWidget(BuildContext context) {
    return AppBar(
      title: const Text('Arquivo'),
    );
  }
}

class ArchivedTipoEventosView extends StatelessWidget {
  const ArchivedTipoEventosView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ArchivedTipoEventosBody();
  }
}
