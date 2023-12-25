import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/home/bloc/bloc.dart';

/// {@template home_body}
/// Body of the HomePage.
///
/// Add what it does
/// {@endtemplate}
class HomeBody extends StatelessWidget {
  /// {@macro home_body}
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Center(
          child: Text(
            'Home',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        );
      },
    );
  }
}
