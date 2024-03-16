import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/widgets/headerSection/header_details.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/widgets/headerSection/image_widget.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tipoEvento = getIt<TipoEvento>();

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ImageWidget(tipoEvento: tipoEvento),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: HeaderDetails(tipoEvento: tipoEvento),
            ),
          ),
        ],
      ),
    );
  }
}
