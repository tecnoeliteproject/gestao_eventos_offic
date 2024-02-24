import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_event.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_state.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/view/sign_in_screen.dart';
import 'package:gestao_eventos/presentation/painels/client/cubit/home_cubit.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/main_page/main_page.dart';
import 'package:gestao_eventos/presentation/general_components/profile_page/profile_page.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  static const String routeName = '/client_home_screen';

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  late HomeCubit _homeCubit;
  late SignInBloc _signInBloc;

  @override
  void initState() {
    super.initState();
    _homeCubit = BlocProvider.of<HomeCubit>(context);
    _signInBloc = BlocProvider.of<SignInBloc>(context);
    initPages();
  }

  void initPages() {
    pages = [
    const MainPage(),
    const MainPage(),ProfilePage(
        onSigningOut: () {
          _signInBloc.add(SigningOutEvent());
        },
      ),
    ];
  }

  late List<Widget> pages;

  void updateCurrentIndex(int index) {
    _homeCubit.changePage(index);
  }


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
          body: pages[context.select((HomeCubit cubit) => cubit.state)],
          bottomNavigationBar: BottomNavigationBar(
            onTap: updateCurrentIndex,
            currentIndex: context.select((HomeCubit cubit) => cubit.state),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/Shop Icon.svg',
                  colorFilter: const ColorFilter.mode(
                    inActiveIconColor,
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/Shop Icon.svg',
                  colorFilter: const ColorFilter.mode(
                    kPrimaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/Heart Icon.svg',
                  colorFilter: const ColorFilter.mode(
                    inActiveIconColor,
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/Heart Icon.svg',
                  colorFilter: const ColorFilter.mode(
                    kPrimaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Fav',
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
