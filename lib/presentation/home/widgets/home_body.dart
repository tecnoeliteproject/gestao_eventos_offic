import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/presentation/home/bloc/bloc.dart';

/// {@template home_body}
/// Body of the HomePage.
///
/// Add what it does
/// {@endtemplate}
class HomeBody extends StatelessWidget {
  /// {@macro home_body}
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return const Padding(
          padding: EdgeInsets.all(26),
          child: Column(
            children: [
              HeaderAreaWidget(),
              SizedBox(height: kDefaultpadding * 2),
              EventCategoriaAreaWidget(),
            ],
          ),
        );
      },
    );
  }
}

class EventCategoriaAreaWidget extends StatelessWidget {
  const EventCategoriaAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          EventoCategoriaItem(
            icon: Icons.portable_wifi_off,
            text: Text('Pedidos'),
          ),
          EventoCategoriaItem(
            icon: Icons.settings,
            text: Text('Casamentos'),
            isSelected: true,
          ),
          EventoCategoriaItem(
            icon: Icons.text_snippet,
            text: Text('Aniversarios'),
          ),
          EventoCategoriaItem(
            icon: Icons.text_snippet,
            text: Text('Aniversarios'),
          ),
          EventoCategoriaItem(
            icon: Icons.text_snippet,
            text: Text('Aniversarios'),
          ),
          EventoCategoriaItem(
            icon: Icons.text_snippet,
            text: Text('Aniversarios'),
          ),
        ],
      ),
    );
  }
}

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

class HeaderAreaWidget extends StatelessWidget {
  const HeaderAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Solicite o tipo de evento que voce deseja',
            softWrap: true,
            textAlign: TextAlign.left,
            maxLines: 2,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DefaultButton(),
      ],
    );
  }
}

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
          FontAwesomeIcons.phone,
          color: Colors.black,
        ),
      ),
    );
  }
}
