import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestao_eventos/data/datasources/remoto/firebase/evento_datasource.dart';
import 'package:gestao_eventos/data/repositories/i_evento_repository.dart';
import 'package:gestao_eventos/domain/entities/categoria.dart';
import 'package:gestao_eventos/domain/entities/ciclo_de_vida.dart';
import 'package:gestao_eventos/domain/entities/estoque.dart';
import 'package:gestao_eventos/domain/entities/produto.dart';
import 'package:gestao_eventos/domain/usecases/produto_usecases.dart';
import 'package:gestao_eventos/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Center(
        child: TextButton(
          onPressed: () async {
            final db = FirebaseFirestore.instance;
            final pds = FirebaseProdutoDataSource(firestore: db);
            final rp = ProdutoRepository(pds);
            final uc = ProdutoUseCases(rp);

            final produto = Produto(
              id: 2,
              nome: 'Batata frita',
              descricao: 'descricao',
              categoria: Categoria(id: 1, nome: 'Carnes'),
              preco: 14520,
              imagemUrl: '',
              estoque: Estoque(quantidade: 2),
              cicloDeVida: CicloDeVida(dataDeLancamento: DateTime.now()),
            );

            await uc.createProduto(produto);

            final savedProduto = await uc.getProduto(2);
            print(savedProduto);
          },
          child: const Text('Home'),
        ),
      ),
    );
  }
}
