import 'package:flutter/material.dart';

class Selecaoperfil extends StatefulWidget {
  const Selecaoperfil({super.key});

  @override
  State<Selecaoperfil> createState() => _SelecaoperfilState();
}

class _SelecaoperfilState extends State<Selecaoperfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 27, 27),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text('Quem esta assistindo?',
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'Antonio', 
                fontSize: 33,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: 350,
              padding: const EdgeInsets.all(10),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        child: const Image(
                          image: AssetImage(
                            'assets/img/iconmiles.png',
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/Catalogo');
                        },
                      ),
                      const Text(
                        'Tomás',
                        style: TextStyle(
                            fontFamily: 'Antonio',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Image(image: AssetImage('assets/img/icondjango.png')),
                      Text(
                        'André',
                        style: TextStyle(
                            fontFamily: 'Antonio',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Image(image: AssetImage('assets/img/iconjane.png')),
                      Text(
                        'Fernanda',
                        style: TextStyle(
                            fontFamily: 'Antonio',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Image(image: AssetImage('assets/img/iconmary.png')),
                      Text(
                        'Andressa',
                        style: TextStyle(
                            fontFamily: 'Antonio',
                            fontSize: 20,
                            color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
