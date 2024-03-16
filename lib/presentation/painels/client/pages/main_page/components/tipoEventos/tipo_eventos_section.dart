import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/main_page/components/section_title.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/main_page/components/tipoEventos/client_tipo_evento_item.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/main_page/components/tipoEventos/cubit/tipo_evento_item_cubit.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/view/tipo_evento_detail_page.dart';

class TipoEventosSection extends StatelessWidget {
  const TipoEventosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TipoEventoItemCubit(),
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SectionTitle(
                  title: 'Tipos de eventos',
                  press: () {
                    Navigator.pushNamed(context, 'ProductsScreen.routeName');
                  },
                ),
              ),
              const Gutter(),
              BlocBuilder<TipoEventoItemCubit, TipoEventoItemState>(
                bloc: context.read<TipoEventoItemCubit>()..getTipoEventos(),
                builder: (context, state) {
                  if (state is TipoEventoItemLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is TipoEventoItemError) {
                    return const Column(
                      children: [
                        Gutter(),
                        Center(
                          child: Text('Error'),
                        ),
                      ],
                    );
                  }

                  if (state is TipoEventoItemLoaded) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...state.tipoEventos.map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ClientTipoEventoItem(
                                e,
                                onPress: () => Navigator.push(
                                  context,
                                  TipoEventoDetailPage.route(tipoEvento: e),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
