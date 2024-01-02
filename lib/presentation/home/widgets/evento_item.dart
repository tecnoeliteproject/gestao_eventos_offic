import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/presentation/home/widgets/button_bottom_area_widget.dart';

class EventoItemWidget extends StatelessWidget {
  const EventoItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * .8;

    return Container(
      width: width,
      margin: const EdgeInsets.only(left: kDefaultpadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xffFFEBED),
      ),
      padding: const EdgeInsets.all(kDefaultpadding * 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pedido de casamento',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/imgs/eventos/pedidos/pedido1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: kDefaultpadding),
          const ButtonBottomAreaWidget(),
        ],
      ),
    );
  }
}
