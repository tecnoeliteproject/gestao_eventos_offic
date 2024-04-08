import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/gestao_stock/bloc/bloc.dart';

/// {@template gestao_stock_body}
/// Body of the GestaoStockPage.
///
/// Add what it does
/// {@endtemplate}
class GestaoStockBody extends StatelessWidget {
  /// {@macro gestao_stock_body}
  const GestaoStockBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GestaoStockBloc, GestaoStockState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
