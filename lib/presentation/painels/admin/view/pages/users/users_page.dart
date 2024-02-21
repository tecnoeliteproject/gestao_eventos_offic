import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/data/models/user_model.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/admin_screen.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_state.dart';

class UsersPage extends StatefulWidget {
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
            return const CircularProgressIndicator();
          } else if (state is DownloadedUsersState) {
            users = state.users;
          }else{
            users = (state as ChangeUserPermissionLevelState).users;
          }
          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email: ${users[index].email ?? 'Sem email'}'),
                              Text('Permissão: ${UserModel.nivelToText(users[index].level!)}'),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 40,
                            child: InkWell(
                              child: const Icon(Icons.delete,
                                  color: inActiveIconColor),
                              onTap: () {
                                _bloc.add(RemoveUserEvent());
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 40,
                            child: PopupMenuButton(
                                child: const Icon(Icons.more_vert,
                                    color: inActiveIconColor),
                                onSelected: (value) {
                                  _bloc.add(ChangeUserPermissionLevelEvent(level: value, email: users[index].email!, users: users));
                                },
                                itemBuilder: (context) {
                                  return [
                                    const PopupMenuItem(
                                        value: 0,
                                        child:
                                            Text('Definir como administrador')),
                                    const PopupMenuItem(
                                      value: 1,
                                      child: Text('Definir como Gerente'),
                                    ),
                                    const PopupMenuItem(
                                      value: 2,
                                      child: Text('Definir como Cliente'),
                                    ),
                                  ];
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
