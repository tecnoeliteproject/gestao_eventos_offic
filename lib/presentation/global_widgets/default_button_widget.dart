import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 69,
      height: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffF3F3F3),
          width: 4,
        ),
      ),
      child: const Center(
        child: Icon(
          FontAwesomeIcons.grip,
          color: Colors.black,
        ),
      ),
    );
  }
}
