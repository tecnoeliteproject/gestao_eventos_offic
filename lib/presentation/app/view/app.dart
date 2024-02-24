import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/routes/routes.dart';
import 'package:gestao_eventos/core/theme/theme.dart';
import 'package:gestao_eventos/l10n/l10n.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_state.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/view/sign_in_screen.dart';
import 'package:gestao_eventos/presentation/auth/sign_up/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/auth/sign_up/bloc/sign_up_state.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_state.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_state.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/components/bloc/user_bloc.dart';
import 'package:gestao_eventos/presentation/painels/client/cubit/home_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext contexts) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(SignInInitialState()),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(SignUpInitialState()),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => AdminBloc(AdminInitialState()),
        ),
        BlocProvider(
          create: (context) => ManageUsersBloc(GettingUsersState()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
        initialRoute: SignInScreen.routeName,
      ),
    );
  }
}
