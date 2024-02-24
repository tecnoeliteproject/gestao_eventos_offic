<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/core/theme/app_color.dart';

Widget buildTextInput({
    required Color color,
    required Color rcolor,
    required String description,
    required TextEditingController controller,
    required BuildContext context}
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: dw(context),
        color: color,
        child: CupertinoTextField(
          style: TextStyle(color: rcolor),
          cursorColor: AppColor.primary,
          controller: controller,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: AppColor.primary),
              borderRadius: BorderRadius.circular(20)),
          keyboardType: TextInputType.text,
          placeholder: description,
          placeholderStyle: TextStyle(color: rcolor),
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLength: 100,
          padding: const EdgeInsets.all(16.0),
          onChanged: (void text) {
          },
        ),
      ),
    );
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/core/theme/app_color.dart';

Widget buildTextInput({
    required Color color,
    required Color rcolor,
    required String description,
    required TextEditingController controller,
    required BuildContext context}
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: dw(context),
        color: color,
        child: CupertinoTextField(
          style: TextStyle(color: rcolor),
          cursorColor: AppColor.primary,
          controller: controller,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: AppColor.primary),
              borderRadius: BorderRadius.circular(20)),
          keyboardType: TextInputType.text,
          placeholder: description,
          placeholderStyle: TextStyle(color: rcolor),
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLength: 100,
          padding: const EdgeInsets.all(16.0),
          onChanged: (void text) {
          },
        ),
      ),
    );
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
  }