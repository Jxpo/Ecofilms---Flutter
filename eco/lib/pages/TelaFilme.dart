import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TelaFilme extends StatelessWidget {
  final String titulo; // Título do filme
  final String descricao; // Descrição do filme
  final String imagemPoster; // Caminho do poster do filme 
  final String duracao; // Duração do filme
  final List<String> recomendacoes; // Lista de imagens para recomendações
  

  const TelaFilme({
    Key? key,
    required this.titulo,
    required this.descricao,
    required this.imagemPoster,
    required this.duracao,
    required this.recomendacoes,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 390,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagemPoster),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                        stops: [0.7, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'ASSISTIR',
                style: TextStyle(
                  fontFamily: 'Antonio',
                  fontSize: 22.5,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(390, 45),
                backgroundColor: Color.fromARGB(255, 101, 202, 101),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'FAZER DOWNLOAD',
                style: TextStyle(
                  fontFamily: 'Antonio',
                  fontSize: 22.5,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(390, 45),
                backgroundColor: Color.fromARGB(255, 62, 62, 62),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                descricao,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Dê uma avaliação!',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.thumb_up_sharp,
                  color: Colors.white,
                  size: 19,
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.thumb_down_sharp,
                  color: Colors.white,
                  size: 19,
                ),
                const Spacer(),
                FaIcon(
                  FontAwesomeIcons.stopwatch,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  duracao,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Antonio',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: recomendacoes.map((recomendacao) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        recomendacao,
                        width: 120,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
