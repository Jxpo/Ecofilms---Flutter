import 'package:eco/pages/TelaFilme.dart';
import 'package:flutter/material.dart';
import 'custom_navbar.dart';

class Catalogo extends StatefulWidget {
  const Catalogo({super.key});

  @override
  State<Catalogo> createState() => _CatalogoState();
}

class _CatalogoState extends State<Catalogo> {
  int _currentIndex = 0; // Índice inicial da aba na navbar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Positioned.fill(
                  child: Image.asset(
                    'assets/img/nigh.png',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'ASSISTIR',
                      style: TextStyle(
                          fontFamily: 'Antonio',
                          fontSize: 22.5,
                          color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(117, 34),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      'PRÉVIAS',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Antonio',
                          fontSize: 24),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaFilme(
                              titulo: 'The Joker',
                              descricao:
                                  'Isolado, intimidado e desconsiderado pela sociedade, o fracassado comediante Arthur Fleck inicia seu caminho como uma mente criminosa após assassinar três homens em pleno metrô. Sua ação inicia um movimento popular contra a elite de Gotham City, da qual Thomas Wayne é seu maior representante.',
                              imagemPoster: 'assets/img/joker.jpg',
                              duracao: '2h 2min',
                              recomendacoes: [
                                'assets/img/batman.jpg',
                                'assets/img/Aves.png',
                                'assets/img/Batman.png',
                              ],
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/img/joker.jpg',
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaFilme(
                              titulo: 'Django Livre',
                              descricao:
                                  'No sul dos Estados Unidos, o ex-escravo Django faz uma aliança inesperada com o caçador de recompensas Schultz para perseguir os criminosos mais procurados do país e resgatar sua esposa de um fazendeiro que força seus escravos a entrarem em competições mortais.',
                              imagemPoster: 'assets/img/DjangoPoster.png',
                              duracao: '2h 44min',
                              recomendacoes: [
                                'assets/img/Billythekid.png',
                                'assets/img/Setehomens.png',
                                'assets/img/Osimperdoaveis.png',
                              ],
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/img/django.png',
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaFilme(
                              titulo: 'Titanic',
                              descricao:
                                  'Em 1912, o luxuoso transatlântico RMS Titanic colide com um iceberg durante sua viagem inaugural, resultando em um desastre que afeta milhares de vidas. No meio da tragédia, um amor improvável surge entre Jack (Leonardo DiCaprio) e Rose (Kate Winslet), que pertencem a classes sociais muito diferentes.',
                              imagemPoster: 'assets/img/TitanicPoster.PNG',
                              duracao: '3h 14min',
                              recomendacoes: [
                                'assets/img/romeoandjuliet.jpg',
                                'assets/img/Piratasdocaribe.png',
                                'assets/img/Ilhadomedo.png',
                              ],
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/img/titanic.jpg',
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaFilme(
                              titulo: 'Jumanji: Bem-vindo à Selva',
                              descricao:
                                  'Quatro adolescentes são sugados para dentro de um videogame mágico, e a única maneira de escapar é trabalhar juntos para terminar o jogo, enfrentando desafios inesperados e perigos selvagens.',
                              imagemPoster: 'assets/img/Jumanjiposter.png',
                              duracao: '1h 59min',
                              recomendacoes: [
                                'assets/img/Viagem2.png',
                                'assets/img/Jumanjiantigo.png',
                                'assets/img/Zatura.png',
                              ],
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/img/jumanji.png',
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaFilme(
                              titulo: 'Jurassic Park',
                              descricao:
                                  'Um parque temático com dinossauros clonados se transforma em um caos quando as criaturas escapam de seus recintos, colocando visitantes e funcionários em perigo.',
                              imagemPoster: 'assets/img/Jurassicparkposter.png',
                              duracao: '2h 7min',
                              recomendacoes: [
                                'assets/img/Kingkong.png',
                                'assets/img/Tubarao.png',
                                'assets/img/Indiana.png',
                              ],
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/img/jurassicpark.jpg',
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      'Mais assistidos',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Antonio',
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaFilme(
                              titulo: 'Pulp_Fiction',
                              descricao:
                                  'Assassino que trabalha para a máfia se apaixona pela esposa de seu chefe quando é convidado a acompanhá-la, um boxeador descumpre sua promessa de perder uma luta e um casal tenta um assalto que rapidamente sai do controle.',
                              imagemPoster: 'assets/img/Pulpfictionposter.png',
                              duracao: '2h 29min',
                              recomendacoes: [
                                'assets/img/Killbill.png',
                                'assets/img/Bastardos.png',
                                'assets/img/Hollywood.png',
                              ],
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/img/Pulp_Fiction.png',
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaFilme(
                              titulo: 'Prison Break',
                              descricao:
                                  'Quando o irmão de Michael Scofield é injustamente condenado à morte, ele elabora um plano brilhante para escapar da prisão e provar sua inocência, enfrentando desafios perigosos e conspirações ao longo do caminho.',
                              imagemPoster: 'assets/img/Prisonbreakposter.png',
                              duracao: '42min (série)',
                              recomendacoes: [
                                'assets/img/Shawshank.png',
                                'assets/img/Fugadasgalinhas.png',
                                'assets/img/alcatraz.png',
                              ],
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/img/prisionbreak.png',
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaFilme(
                              titulo: 'Mid90s',
                              descricao:
                                  'Em Los Angeles, nos anos 90, Stevie, um garoto de 13 anos, encontra um grupo de skatistas que o introduz ao mundo da amizade, rebeldia e autodescoberta. Enquanto lida com problemas familiares, ele descobre a importância de pertencer a algo maior que ele mesmo.',
                              imagemPoster: 'assets/img/MId90sposter.png',
                              duracao: '1h 25min',
                              recomendacoes: [
                                'assets/img/Urubus.png',
                                'assets/img/Dogtown.png',
                                'assets/img/Street.png',
                              ],
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/img/Mid90s.png',
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaFilme(
                              titulo: 'Clube da Luta',
                              descricao:
                                  'Um homem insatisfeito com sua vida rotineira e consumista encontra um carismático vendedor de sabonetes que o introduz a um clube clandestino de luta. O que começa como uma forma de escapar do cotidiano se transforma em algo muito maior e perigoso.',
                              imagemPoster: 'assets/img/Fightclubposter.png',
                              duracao: '2h 19min',
                              recomendacoes: [
                                'assets/img/Taxidriver.png',
                                'assets/img/Seven.png',
                                'assets/img/Psicopataamericano.png',
                              ],
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/img/fightclub.png',
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaFilme(
                              titulo: 'Homem-Aranha no Aranhaverso',
                              descricao:
                                  'Depois de se reunir com Gwen Stacy, Homem-Aranha é jogado no multiverso. Lá, o super-herói aracnídeo encontra uma numerosa equipe encarregada de proteger sua própria existência.',
                              imagemPoster: 'assets/img/homemaranhaposter.png',
                              duracao: '2h 20min',
                              recomendacoes: [
                                'assets/img/Bighero.png',
                                'assets/img/Osinriveis.png',
                                'assets/img/Legobatman.png',
                              ],
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/img/HOMEM ARNHA.png',
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomNavbar(
          currentIndex: _currentIndex,
          onTabSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
