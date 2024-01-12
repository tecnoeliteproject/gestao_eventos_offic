import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/routes/routes.dart';
import 'package:gestao_eventos/core/theme/theme.dart';
import 'package:gestao_eventos/l10n/l10n.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_state.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext contexts) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(InitialState()),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme(contexts),
        scrollBehavior: const ScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
          },
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: GlobalRouter.onGenerateRoute,
        initialRoute: '/splash',
      ),
    );
  }
}
