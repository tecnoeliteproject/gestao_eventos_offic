// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';

import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/widgets/contratarServicoSection/contratar_servico_section.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/widgets/tipo_evento_detail_body.dart';

/// {@template tipo_evento_detail_page}
/// A description for TipoEventoDetailPage
/// {@endtemplate}
class TipoEventoDetailPage extends StatefulWidget {
  /// {@macro tipo_evento_detail_page}
  const TipoEventoDetailPage({
    required this.tipoEvento,
    super.key,
  });

  final TipoEvento tipoEvento;

  /// The static route for TipoEventoDetailPage
  static Route<dynamic> route({required TipoEvento tipoEvento}) {
    return CupertinoPageRoute<dynamic>(
      builder: (_) => TipoEventoDetailPage(
        tipoEvento: tipoEvento,
      ),
    );
  }

  @override
  State<TipoEventoDetailPage> createState() => _TipoEventoDetailPageState();
}

class _TipoEventoDetailPageState extends State<TipoEventoDetailPage> {
  @override
  void initState() {
    super.initState();
    getIt.registerSingleton(widget.tipoEvento);
  }

  @override
  void dispose() {
    getIt.unregister(instance: widget.tipoEvento);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TipoEventoDetailBloc(),
        ),
      ],
      child: const SafeArea(
        child: Scaffold(
          body: TipoEventoDetailView(),
        ),
      ),
    );
  }
}

class TipoEventoDetailView extends StatelessWidget {
  const TipoEventoDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      fit: StackFit.expand,
      children: [
        TipoEventoDetailBody(),
        ContratarServicoSection(),
      ],
    );
  }
}
