import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/data/models/user_model.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/admin_screen.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/components/bloc/user_bloc.dart';


class UserItem extends StatefulWidget{
  
  const UserItem({
    super.key,
    required this.users,
    required this.index,
  });

  final List<User> users;
  final int index;
  @override
  State<StatefulWidget> createState() {
    return UserItemState(users: users, index: index);
  }

}

class UserItemState extends State<UserItem> {
  UserItemState({
    required this.users,
    required this.index,
  });

  @override
  void initState(){
    super.initState();
    _bloc = UserBloc(UserInitial());
    _manageUsersBloc = BlocProvider.of<ManageUsersBloc>(context);
  }

  late UserBloc _bloc;
  late ManageUsersBloc _manageUsersBloc;

  final List<User> users;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                BlocBuilder<UserBloc, UserState>(
                  bloc: _bloc,
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return CircularProgressIndicator();
                    }if (state is ChangeUserPermissionLevelState) {
                      return Text(
                        'Permissão: ${UserModel.nivelToText(state.user.level!)}');
                    }
                    return Text(
                        'Permissão: ${UserModel.nivelToText(users[index].level!)}');
                  },
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 40,
              child: InkWell(
                child: const Icon(Icons.delete, color: inActiveIconColor),
                onTap: () {
                  _manageUsersBloc.add(RemoveUserEvent(user: users[index], users: users));
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              width: 40,
              child: PopupMenuButton(
                  child: const Icon(Icons.more_vert, color: inActiveIconColor),
                  onSelected: (value) {
                    _bloc.add(ChangeUserPermissionLevelEvent(
                        level: value,
                        email: users[index].email!,
                        user: users[index]));
                  },
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                          value: 0, child: Text('Definir como administrador')),
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
    );
  }
}
