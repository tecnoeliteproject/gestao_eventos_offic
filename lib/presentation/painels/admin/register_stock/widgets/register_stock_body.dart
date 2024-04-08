import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/register_stock/widgets/input_widget_area/input_widget_area.dart';

class RegisterStockBody extends StatelessWidget {
  const RegisterStockBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          InputWidgetArea(),
        ],
      ),
    );
  }
}
