<<<<<<< HEAD
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/core/helpers/generic_functions.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_event.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_state.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/view/sign_in_screen.dart';
import 'package:gestao_eventos/presentation/general_components/profile_page/profile_page.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_state.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/users_page.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  static const String routeName = '/admin_home_screen';

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  late AdminBloc _bloc;
  late SignInBloc _signInBloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AdminBloc>(context);
    _signInBloc = BlocProvider.of<SignInBloc>(context);

    initPages();
  }

  void initPages() {
    pages = [
      UsersPage(),
      ProfilePage(
        onSigningOut: () {
          _signInBloc.add(SigningOutEvent());
        },
      ),
    ];
  }

  void updateCurrentIndex(int index) {
    _bloc.add(ChangeAdminPageEvent(index: index));
  }

  late List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      bloc: _signInBloc,
      listener: (context, state) {
        if(state is SigningOutState){
          Navigator.pushReplacementNamed(context, SignInScreen.routeName);
          return;
        }
      },
      child: Scaffold(
        body: BlocBuilder<AdminBloc, AdminState>(
          bloc: _bloc,
          builder: (context, state) {
            return pages[_bloc.pageIndex];
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: updateCurrentIndex,
          currentIndex: _bloc.pageIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: inActiveIconColor,
              ),
              activeIcon: Icon(
                Icons.person,
                color: inActiveIconColor,
              ),
              label: 'users',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/User Icon.svg',
                colorFilter: const ColorFilter.mode(
                  inActiveIconColor,
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/User Icon.svg',
                colorFilter: const ColorFilter.mode(
                  kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
=======
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/core/helpers/generic_functions.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_event.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_state.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/view/sign_in_screen.dart';
import 'package:gestao_eventos/presentation/general_components/profile_page/profile_page.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_state.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/users_page.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  static const String routeName = '/admin_home_screen';

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  late AdminBloc _bloc;
  late SignInBloc _signInBloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AdminBloc>(context);
    _signInBloc = BlocProvider.of<SignInBloc>(context);

    initPages();
  }

  void initPages() {
    pages = [
      UsersPage(),
      ProfilePage(
        onSigningOut: () {
          _signInBloc.add(SigningOutEvent());
        },
      ),
    ];
  }

  void updateCurrentIndex(int index) {
    _bloc.add(ChangeAdminPageEvent(index: index));
  }

  late List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      bloc: _signInBloc,
      listener: (context, state) {
        if(state is SigningOutState){
          Navigator.pushReplacementNamed(context, SignInScreen.routeName);
          return;
        }
      },
      child: Scaffold(
        body: BlocBuilder<AdminBloc, AdminState>(
          bloc: _bloc,
          builder: (context, state) {
            return pages[_bloc.pageIndex];
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: updateCurrentIndex,
          currentIndex: _bloc.pageIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: inActiveIconColor,
              ),
              activeIcon: Icon(
                Icons.person,
                color: inActiveIconColor,
              ),
              label: 'users',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/User Icon.svg',
                colorFilter: const ColorFilter.mode(
                  inActiveIconColor,
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/User Icon.svg',
                colorFilter: const ColorFilter.mode(
                  kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
