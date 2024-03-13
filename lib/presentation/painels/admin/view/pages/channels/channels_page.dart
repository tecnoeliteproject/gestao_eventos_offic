import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/channels/bloc/channels_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/channels/components/channel_item.dart';

class ChannelsPage extends StatefulWidget {
  ChannelsPage({required this.users});

  final List<User> users;
  @override
  State<ChannelsPage> createState() {
    return ChannelsPageSatate(users: users);
  }
}

class ChannelsPageSatate extends State<ChannelsPage> {
  ChannelsPageSatate({required this.users});

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ChannelsBloc>(context);
    _bloc.add(GetChannelsEvent());
  }

  late ChannelsBloc _bloc;

  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelsBloc, ChannelsState>(
      builder: (context, state) {
        if (state is GettingChannelsState) {
          return LinearProgressIndicator();
        }if (state is GotChannelsState) {
          users = state.users;
        }if (state is ErrorOnGetChannelsState) {
          return Text(state.messages);
        }
        return ListView.builder(
          itemCount: users.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 16),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ChannelItem(
              name: users[index].name ?? 'Sem nome',
              messageText: users[index].email ?? 'Sem email',
              time: DateTime.now().toString(),
              isMessageRead: (index == 0 || index == 3) ? true : false,
            );
          },
        );
      },
    );
  }
}
