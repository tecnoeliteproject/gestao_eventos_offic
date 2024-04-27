import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/presentation/painels/admin/register_stock/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/register_stock/cubit/create_stock_registry_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/register_stock/cubit/material_selector_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/register_stock/widgets/register_stock_body.dart';

class RegisterStockPage extends StatelessWidget {
  const RegisterStockPage({super.key});

  static Route<dynamic> route() {
    return CupertinoPageRoute<dynamic>(
      builder: (_) => const RegisterStockPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterStockBloc(),
        ),
        BlocProvider(
          create: (context) => CreateStockRegistryCubit(),
        ),
        BlocProvider(
          create: (context) => getIt<MaterialSelectorCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registar Stock'),
          centerTitle: true,
        ),
        body: const RegisterStockView(),
      ),
    );
  }
}

class RegisterStockView extends StatelessWidget {
  const RegisterStockView({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterStockBody();
  }
}
