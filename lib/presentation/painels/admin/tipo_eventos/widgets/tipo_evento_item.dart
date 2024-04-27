// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/view/product_details_page.dart';

import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/widgets/confirm_arquivar_tipo_evento_dialog.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/widgets/confirm_desarquivar_tipo_evento_dialog.dart';

enum _PopupIdMenuItem {
  editar,
  arquivar,
  desarquivar,
}

class TipoEventoItem extends StatelessWidget {
  const TipoEventoItem({
    required this.tipoEvento,
    super.key,
  });

  final TipoEvento tipoEvento;

  void _onTap(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) {
          return ProductDetailsPage(tipoEvento: tipoEvento);
        },
      ),
    );
  }

  Future<void> _archiveTipoEventoConfirmation(BuildContext context) {
    return showAdaptiveDialog(
      context: context,
      builder: (context) {
        return ArchiveTipoEventoConfimDialog(
          tipoEvento: tipoEvento,
        );
      },
    );
  }

  Future<void> _desarchiveTipoEventoConfirmation(BuildContext context) {
    return showAdaptiveDialog(
      context: context,
      builder: (context) {
        return UnarchiveTipoEventoConfimDialog(
          tipoEvento: tipoEvento,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => _onTap(context),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        tipoEvento.image.url,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      limitText(
                        size,
                        tipoEvento.name,
                      ),
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                    ),
                    const Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: PopupMenuButton(
                        child: const Icon(Icons.more_vert),
                        onSelected: (value) {
                          if (value == _PopupIdMenuItem.editar.index) {
                            // Navigator.of(context).push(
                            //   EditTipoEventoPage.route(tipoEvento),
                            // );
                          }

                          if (value == _PopupIdMenuItem.arquivar.index) {
                            _archiveTipoEventoConfirmation(context);
                          }

                          if (value == _PopupIdMenuItem.desarquivar.index) {
                            _desarchiveTipoEventoConfirmation(context);
                          }
                        },
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              value: _PopupIdMenuItem.editar.index,
                              child: const ListTile(
                                title: Text('Editar'),
                                leading: Icon(Icons.edit),
                              ),
                            ),
                            PopupMenuItem(
                              value: _tipoEventoIsArchived
                                  ? _PopupIdMenuItem.desarquivar.index
                                  : _PopupIdMenuItem.arquivar.index,
                              child: ListTile(
                                title: Text(
                                  _tipoEventoIsArchived
                                      ? 'Desrquivar'
                                      : 'Arquivar',
                                ),
                                leading: Icon(
                                  _tipoEventoIsArchived
                                      ? Icons.unarchive
                                      : Icons.archive,
                                ),
                              ),
                            ),
                          ];
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get _tipoEventoIsArchived {
    return tipoEvento.isArchived != null && tipoEvento.isArchived! == true;
  }

  String limitText(Size screenSize, String text) {
    var limit = 21;

    if (screenSize.width < 360.0) {
      limit = 8;
    }

    if (screenSize.width > 360.0 && screenSize.width < 380.0) {
      limit = 11;
    }

    if (screenSize.width > 380.0 && screenSize.width < 400.0) {
      limit = 12;
    }

    if (screenSize.width > 400.0 && screenSize.width < 453.0) {
      limit = 15;
    }

    if (screenSize.width > 460.0 && screenSize.width < 500.0) {
      limit = 22;
    }
    if (screenSize.width > 590.0) {
      limit = 30;
    }

    return text.length > limit ? '${text.substring(0, limit)}...' : text;
  }
}
