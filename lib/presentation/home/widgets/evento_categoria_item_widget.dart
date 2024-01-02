
import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';

class EventoCategoriaItem extends StatelessWidget {
  const EventoCategoriaItem({
    required this.icon,
    super.key,
    this.text,
    this.onTap,
    this.isSelected = false,
  });

  final IconData icon;
  final Text? text;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          color: isSelected ? Colors.black : const Color(0xffF7F6F9),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 25,
        ),
        margin: const EdgeInsets.only(right: 10),
        child: !isSelected
            ? Icon(icon, color: Colors.black)
            : Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: kDefaultpadding / 2),
                  Text(
                    text!.data ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
