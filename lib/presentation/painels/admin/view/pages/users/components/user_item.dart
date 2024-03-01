import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/data/models/user_model.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/admin_screen.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/components/bloc/user_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/components/custom_circular_avatar.dart';

class UserItem extends StatefulWidget {
  const UserItem({
    required this.users,
    required this.index,
    super.key,
  });

  final List<User> users;
  final int index;

  @override
  State<StatefulWidget> createState() {
    return UserItemState();
  }
}

class UserItemState extends State<UserItem> {
  UserItemState();

  @override
  void initState() {
    super.initState();
    _bloc = UserBloc(UserInitial());
    _manageUsersBloc = BlocProvider.of<ManageUsersBloc>(context);
  }

  late UserBloc _bloc;
  late ManageUsersBloc _manageUsersBloc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        widget.users[widget.index].email ?? 'Sem email',
      ),
      subtitle: BlocBuilder<UserBloc, UserState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ChangeUserPermissionLevelState) {
            return Text(
              UserModel.nivelToText(state.user.level!),
            );
          }
          return Text(
            UserModel.nivelToText(widget.users[widget.index].level!),
          );
        },
      ),
      leading: CustomCircularAvatar(
        caracter:
            widget.users[widget.index].email!.toUpperCase().characters.first,
        color: Colors.white,
        size: 40,
        backgroundColor: Colors.primaries[Random.secure().nextInt(
          Colors.primaries.length - 1,
        )],
      ),
      trailing: _Actions(
        manageUsersBloc: _manageUsersBloc,
        widget: widget,
        bloc: _bloc,
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({
    required ManageUsersBloc manageUsersBloc,
    required this.widget,
    required UserBloc bloc,
  })  : _manageUsersBloc = manageUsersBloc,
        _bloc = bloc;

  final ManageUsersBloc _manageUsersBloc;
  final UserItem widget;
  final UserBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: const Icon(Icons.more_vert, color: inActiveIconColor),
      onSelected: (value) {
        if (value == 0001) {
          _manageUsersBloc.add(
            RemoveUserEvent(
              user: widget.users[widget.index],
              users: widget.users,
            ),
          );
        }

        _bloc.add(
          ChangeUserPermissionLevelEvent(
            level: value,
            email: widget.users[widget.index].email!,
            user: widget.users[widget.index],
          ),
        );
      },
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: User.ADMIN,
            child: Text('Definir como administrador'),
          ),
          const PopupMenuItem(
            value: User.RECEPCIONIST,
            child: Text('Definir como Recepcionista'),
          ),
          const PopupMenuItem(
            value: User.CLIENT,
            child: Text('Definir como Cliente'),
          ),
          const PopupMenuItem(
            value: 0001,
            child: Text('Deletar'),
          ),
        ];
      },
    );
  }
}
