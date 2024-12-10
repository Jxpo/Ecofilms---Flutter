import 'package:eco/pages/Pesquisa.dart';
import 'package:flutter/material.dart';
import 'package:eco/pages/Cadastro.dart';
import 'package:eco/pages/Catalogo.dart';
import 'package:eco/pages/Login.dart';
import 'package:eco/pages/PlayerFilme.dart';
import 'package:eco/pages/Selecaoperfil.dart';
import 'package:eco/pages/TelaFilme.dart';
import 'package:eco/pages/Downloads.dart';
import 'package:eco/pages/Perfil.dart';
import 'package:eco/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp()); 
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
        '/Splashscreen': (context) => Splash(),
        '/Perfil' : (context) => Perfil(),
        '/Downloads' : (context) => Downloads(),
        '/Pesquisa' : (context) => Pesquisa(),
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
