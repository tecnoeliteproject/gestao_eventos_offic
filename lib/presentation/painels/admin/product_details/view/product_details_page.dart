import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/data/models/tipo_evento_model.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/bloc/product_details_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/widgets/product_details_body.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({required this.tipoEvento, super.key});

  final TipoEvento tipoEvento;

  static Route<dynamic> route(
    TipoEventoModel tipoEvento,
  ) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ProductDetailsPage(
        tipoEvento: tipoEvento,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductDetailsBloc>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: ProductDetailsView(tipoEvento: tipoEvento),
          );
        },
      ),
    );
  }
}

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({required this.tipoEvento, super.key});

  final TipoEvento tipoEvento;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state is UpdateEditTipoEvento) {
          return ProductDetailsBody(
            tipoEvento: state.tipoEvento,
          );
        }

        return ProductDetailsBody(
          tipoEvento: tipoEvento,
        );
      },
    );
  }
}
