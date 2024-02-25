import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Users'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, TipoEventosPage.route());
            },
            title: const Text('Tipos de eventos'),
            leading: const Icon(FontAwesomeIcons.mendeley),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
