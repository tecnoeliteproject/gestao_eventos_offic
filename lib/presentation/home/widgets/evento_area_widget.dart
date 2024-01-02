import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gestao_eventos/presentation/home/widgets/evento_item.dart';

class EventoAreaWidget extends HookWidget {
  const EventoAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.5;
    final controller = usePageController(viewportFraction: 0.8);

    return SizedBox(
      height: height,
      child: PageView(
        controller: controller,
        children: List.generate(20, (index) => const EventoItemWidget()),
      ),
    );
  }
}
