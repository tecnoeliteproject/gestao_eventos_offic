import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/gestao_stock/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/gestao_stock/cubit/create_stock_registry_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/gestao_stock/widgets/gestao_stock_body.dart';

/// {@template gestao_stock_page}
/// A description for GestaoStockPage
/// {@endtemplate}
class GestaoStockPage extends StatelessWidget {
  /// {@macro gestao_stock_page}
  const GestaoStockPage({super.key});

  /// The static route for GestaoStockPage
  static Route<dynamic> route() {
    return CupertinoPageRoute<dynamic>(builder: (_) => const GestaoStockPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GestaoStockBloc(),
        ),
        BlocProvider(
          create: (context) => CreateStockRegistryCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Gestão de Stock'),
            ),
            body: const GestaoStockView(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CreateStockRegistryCubit>(context)
                    .createStock();
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

/// {@template gestao_stock_view}
/// Displays the Body of GestaoStockView
/// {@endtemplate}
class GestaoStockView extends StatelessWidget {
  /// {@macro gestao_stock_view}
  const GestaoStockView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GestaoStockBody();
  }
}
