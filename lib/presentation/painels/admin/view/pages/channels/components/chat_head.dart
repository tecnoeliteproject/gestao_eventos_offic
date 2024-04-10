import 'package:flutter/material.dart';
import 'package:gestao_eventos/domain/entities/user.dart';

class ChatHead extends StatefulWidget{
  ChatHead({required this.user});
  User user;
  @override
  _ChatHeadState createState() => _ChatHeadState();
}

class _ChatHeadState extends State<ChatHead> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const CircleAvatar(
          maxRadius: 30,
          child: Icon(Icons.person),
        ),
        SizedBox(width: 16,),
        Text(widget.user.name??'Sem nome', style: TextStyle(fontSize: 16),)
      ],
    );
  }
}