import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/archived_list_tipo_eventos_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/widgets/tipo_evento_item.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ArchivedTipoEventosGridView extends StatelessWidget {
  const ArchivedTipoEventosGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArchivedListTipoEventosCubit,
        ArchivedListTipoEventosState>(
      bloc: getIt<ArchivedListTipoEventosCubit>()..listArchivedTipoEventos(),
      builder: (context, state) {
        if (state is ArchivedListTipoEventosLoading) {
          context.loaderOverlay.show();
        } else {}

        if (state is ArchivedListTipoEventosError) {
          context.loaderOverlay.hide();
          return const Center(
            child: Text('Error'),
          );
        }

        if (state is ArchivedListTipoEventosSuccess) {
          context.loaderOverlay.hide();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) =>
                  TipoEventoItem(tipoEvento: state.tipos[index]),
              itemCount: state.tipos.length,
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
