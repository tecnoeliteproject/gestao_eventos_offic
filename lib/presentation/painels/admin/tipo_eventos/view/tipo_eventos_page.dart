import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/create_tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/bloc/tipo_eventos_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/list_tipo_eventos_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/search_tipo_eventos_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/widgets/app_bar_title_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/widgets/search_tipo_eventos_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/widgets/tipo_eventos_body.dart';

class TipoEventosPage extends StatelessWidget {
  const TipoEventosPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const TipoEventosPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TipoEventosBloc(),
        ),
        BlocProvider(
          create: (context) => SearchTipoEventosCubit(),
        ),
        BlocProvider(
          create: (context) => ListTipoEventosCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: _buildAppBarWidget(context),
            body: const TipoEventosView(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, CreateTipoEventoPage.route());
              },
              child: const Icon(Icons.add),
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
        IconButton(
          onPressed: () {
            BlocProvider.of<SearchTipoEventosCubit>(context).enable();
          },
          icon: const Icon(Icons.search),
        ),
        const Padding(padding: EdgeInsets.only(right: 8)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_alt),
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
