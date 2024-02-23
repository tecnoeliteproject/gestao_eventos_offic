import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/search_tipo_eventos_cubit.dart';

class SearchTipoEventosWidget extends StatelessWidget {
  const SearchTipoEventosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Pesquisar',
        prefixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<SearchTipoEventosCubit>(context).disable();
          },
          icon: const Icon(Icons.close),
        ),
      ),
    );
  }
}
