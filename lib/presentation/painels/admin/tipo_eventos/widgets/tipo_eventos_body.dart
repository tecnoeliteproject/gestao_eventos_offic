import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/bloc/tipo_eventos_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/widgets/tipo_eventos_grid_view.dart';

class TipoEventosBody extends StatelessWidget {
  const TipoEventosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TipoEventosBloc, TipoEventosState>(
      builder: (context, state) {
        return const TipoEventosGridView();
      },
    );
  }
}
