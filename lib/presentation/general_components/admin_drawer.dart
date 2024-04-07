import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestao_eventos/presentation/painels/admin/gestao_stock/gestao_stock.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/tipo_eventos.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(child: Text('Painel administrativo')),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, TipoEventosPage.route());
            },
            title: const Text('Gestão de serviços'),
            leading: const Icon(FontAwesomeIcons.basketShopping),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, GestaoStockPage.route());
            },
            title: const Text('Gestão de STOCK'),
            leading: const Icon(FontAwesomeIcons.warehouse),
          ),
        ],
      ),
    );
  }
}
