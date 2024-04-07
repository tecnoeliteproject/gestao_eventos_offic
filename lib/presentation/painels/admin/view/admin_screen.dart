import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_event.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_state.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/view/sign_in_screen.dart';
import 'package:gestao_eventos/presentation/general_components/admin_drawer.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_state.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/channels/bloc/channels_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/channels/channels_page.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/components/profile_page.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/users_page.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat/client_chat.dart';
import 'package:get_it/get_it.dart';

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
    _initDependencies();
    initPages();
  }

  void _initDependencies() {
    _bloc = BlocProvider.of<AdminBloc>(context);
    _signInBloc = BlocProvider.of<SignInBloc>(context);
    GetIt.I.registerSingleton<AdminBloc>(_bloc);
    GetIt.I
        .registerSingleton<ChannelsBloc>(ChannelsBloc(ChannelsInitialState()));
  }

  void initPages() {
    pages = [
      const UsersPage(),
      ChannelsPage(
        messages: const [],
      ),
      ProfileAdminPage(
        onSigningOut: () {
          _signInBloc.add(SigningOutEvent());
        },
      ),
      if (_bloc.userSender != null)
        ClientChat(userSender: _bloc.userSender!)
      else
        Container(),
    ];
  }

  void updateCurrentIndex(int index) {
    _bloc.add(ChangeAdminPageEvent(
      index: index,
    ),);
  }

  late List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      bloc: _signInBloc,
      listener: (context, state) {
        if (state is SigningOutState) {
          Navigator.pushReplacementNamed(context, SignInScreen.routeName);
          return;
        }if (state is GotoChatPageState) {
          Navigator.pushReplacementNamed(context, ClientChat.routeName);
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Administração'),
        ),
        drawer: const AdminDrawer(),
        body: BlocListener<AdminBloc, AdminState>(
          listener: (context, state) {},
          child: BlocBuilder<AdminBloc, AdminState>(
            bloc: _bloc,
            builder: (context, state) {
              return pages[_bloc.pageIndex];
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<AdminBloc, AdminState>(
          builder: (context, state) {
            return BottomNavigationBar(
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: inActiveIconColor,
              onTap: updateCurrentIndex,
              currentIndex: _bloc.pageIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.people,
                    color: inActiveIconColor,
                  ),
                  activeIcon: Icon(
                    Icons.people,
                    color: kPrimaryColor,
                  ),
                  label: 'users',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message,
                    color: inActiveIconColor,
                  ),
                  activeIcon: Icon(
                    Icons.message,
                    color: kPrimaryColor,
                  ),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: inActiveIconColor,
                  ),
                  activeIcon: Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  label: 'Profile',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
