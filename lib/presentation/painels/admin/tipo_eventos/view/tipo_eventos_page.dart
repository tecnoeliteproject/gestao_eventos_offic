import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/create_tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/edit_tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/bloc/tipo_eventos_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/archived_list_tipo_eventos_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/list_tipo_eventos_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/search_tipo_eventos_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/view/archived_tipo_eventos_page.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/widgets/app_bar_title_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/widgets/search_tipo_eventos_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/widgets/tipo_eventos_body.dart';

class TipoEventosPage extends StatefulWidget {
  const TipoEventosPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const TipoEventosPage());
  }

  @override
  State<TipoEventosPage> createState() => _TipoEventosPageState();
}

class _TipoEventosPageState extends State<TipoEventosPage> {
  @override
  void initState() {
    super.initState();
    getIt.registerLazySingleton(ListTipoEventosCubit.new);
  }

  @override
  void dispose() {
    getIt.unregister(instance: getIt<ListTipoEventosCubit>());
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
          create: (context) => getIt<ListTipoEventosCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ArchivedListTipoEventosCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final listTipoEventosCubit = context.read<ListTipoEventosCubit>();
          return MultiBlocListener(
            listeners: [
              BlocListener<CreateTipoEventoBloc, CreateTipoEventoState>(
                bloc: getIt<CreateTipoEventoBloc>(),
                listener: (context, state) {
                  if (state is CreateTipoEventoSuccess) {
                    getIt<ListTipoEventosCubit>().listTipoEventos();
                  }
                },
              ),
              BlocListener<EditTipoEventoBloc, EditTipoEventoState>(
                bloc: getIt<EditTipoEventoBloc>(),
                listener: (context, state) {
                  if (state is EditTipoEventoSuccess) {
                    getIt<ListTipoEventosCubit>().listTipoEventos();
                  }
                },
              ),
              BlocListener<ArchivedListTipoEventosCubit,
                  ArchivedListTipoEventosState>(
                bloc: getIt<ArchivedListTipoEventosCubit>(),
                listener: (context, state) {
                  if (state is UnarchivedListTipoEventosSuccess) {
                    getIt<ListTipoEventosCubit>().listTipoEventos();
                  }
                },
              ),
            ],
            child: Scaffold(
              appBar: _buildAppBarWidget(context),
              body: const TipoEventosView(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(
                      builder: (context) => BlocProvider.value(
                        value: listTipoEventosCubit,
                        child: const CreateTipoEventoPage(),
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBarWidget(BuildContext context) {
    return AppBar(
      title: BlocBuilder<SearchTipoEventosCubit, SearchTipoEventosState>(
        builder: (context, state) {
          if (state is SearchTipoEventosEnabled) {
            return const SearchTipoEventosWidget();
          }

          if (state is SearchTipoEventosDisanabled) {
            return const AppBarTitleWidget();
          }

          return const AppBarTitleWidget();
        },
      ),
      actions: [
        const IconButton(
          onPressed: null,
          // () {
          //   BlocProvider.of<SearchTipoEventosCubit>(context).enable();
          // }
          icon: Icon(Icons.search),
        ),
        const Padding(padding: EdgeInsets.only(right: 8)),
        IconButton(
          onPressed: () {
            Navigator.push(context, ArchivedTipoEventosPage.route());
          },
          icon: const Icon(FontAwesomeIcons.boxArchive),
        ),
        const Padding(padding: EdgeInsets.only(right: 8)),
      ],
    );
  }
}

class TipoEventosView extends StatelessWidget {
  const TipoEventosView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TipoEventosBody();
  }
}
