import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/list_tipo_eventos_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/widgets/tipo_evento_item.dart';

class TipoEventosGridView extends StatelessWidget {
  const TipoEventosGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListTipoEventosCubit, ListTipoEventosState>(
      bloc: BlocProvider.of<ListTipoEventosCubit>(context)..listTipoEventos(),
      builder: (context, state) {
        if (state is ListTipoEventosLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ListTipoEventosError) {
          return const Center(
            child: Text('Error'),
          );
        }

        if (state is ListTipoEventosSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return TipoEventoItem(
                  tipoEvento: state.tipos[index],
                );
              },
              itemCount: state.tipos.length,
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
