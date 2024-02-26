import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_state.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/components/user_item.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UsersPageState();
  }
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ManageUsersBloc>(context);
    _bloc.add(GetUsersEvent());
  }

  late ManageUsersBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
      ),
      body: BlocBuilder<ManageUsersBloc, ManageUsersState>(
        bloc: _bloc,
        builder: (context, state) {
          late List<User> users;
          if (state is EmptyUsersListState) {
            return const Center(child: Text('Sem usuários'));
          } else if (state is GettingUsersState) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: LinearProgressIndicator(),
            );
          } else if (state is RemovingUserState) {
            users = state.users;
          } else if (state is DownloadedUsersState) {
            users = state.users;
          } else if (state is RemovedUserState) {
            users = state.users;
          }
          return Column(
            children: [
              BlocBuilder<ManageUsersBloc, ManageUsersState>(
                builder: (context, state) {
                  if (state is RemovingUserState) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: LinearProgressIndicator(),
                    );
                  }
                  return Container();
                },
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                        bottom: kDefaultPadding,
                      ),
                      child: UserItem(users: users, index: index),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
