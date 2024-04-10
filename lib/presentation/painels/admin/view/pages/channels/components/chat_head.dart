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
    return Container(
      padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                const CircleAvatar(
                  maxRadius: 30,
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.user.name??'Sem nome', style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}