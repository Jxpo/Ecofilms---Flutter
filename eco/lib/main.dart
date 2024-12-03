import 'package:flutter/material.dart';
import 'package:eco/pages/Cadastro.dart';
import 'package:eco/pages/Catalogo.dart';
import 'package:eco/pages/Login.dart';
import 'package:eco/pages/PlayerFilme.dart';
import 'package:eco/pages/Selecaoperfil.dart';
import 'package:eco/pages/TelaFilme.dart';  // Apenas importe uma vez
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante que a ligação dos widgets do Flutter esteja inicializada antes de usar qualquer plugin
  await Firebase.initializeApp(); // Inicializa o Firebase na aplicação
  runApp(const MyApp()); // Executa a aplicação iniciando pela classe MyApp
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/Login',
      routes: {
        '/Login': (context) => Login(),
        '/cadastro': (context) => const Cadastro(),
        '/Catalogo': (context) => const Catalogo(),
        '/Selecaoperfil': (context) => const Selecaoperfil(),
        '/PlayerFilme': (context) => YoutubeVideoPage(),
        '/TelaFilme': (context) => TelaFilme( 
          titulo: '', 
          descricao: '', 
          imagemPoster: '', 
          duracao: '', 

          recomendacoes: [],
        ), 
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
