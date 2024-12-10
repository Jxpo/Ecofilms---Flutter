import 'package:flutter/material.dart';

class Pesquisa extends StatefulWidget {
  @override
  State<Pesquisa> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 23, 23),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 23, 23, 23),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/Catalogo');
          },
        ),
        titleSpacing: -13,
        title: TextFormField(
          style: TextStyle(color: Colors.white), 
          decoration: InputDecoration(
            hintText: 'Pesquisar...',
            hintStyle: TextStyle(fontFamily: 'Antonio', fontSize: 17, color: Colors.white), 
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Text("Página de Pesquisa", style: TextStyle(color: Colors.white)), 
      ),
    );
  }
}
