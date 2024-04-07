import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/gestao_stock/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/gestao_stock/cubit/create_stock_registry_cubit.dart';

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
    return BlocBuilder<CreateStockRegistryCubit, CreateStockRegistryState>(
      builder: (context, state) {
        if (state is CreateStockRegistryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CreateStockRegistrySuccess) {
          return const Center(
            child: Text(
              'Stock criado com sucesso',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          );
        }

        if (state is CreateStockRegistryError) {
          return const Center(
            child: Text(
              'Erro ao criar o Stock',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          );
        }

        return const Center(
          child: Text('Vamos começar?!'),
        );
      },
    );
  }
}
