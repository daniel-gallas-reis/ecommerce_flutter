import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildBodyBack() => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 58, 76, 128),
                Color.fromARGB(150, 58, 76, 128),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );

    return Stack(
      children: [
        buildBodyBack(),
        CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Lopes Consultoria',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700
                  ),
                ),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                      children: snapshot.data!.docs.map((e) {
                        return StaggeredGridTile.count(
                          crossAxisCellCount: e.get('x'),
                          mainAxisCellCount: e.get('y'),
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //TODO ir para a página do produto clicado
                                  print('tocou');
                                },
                                onLongPress: () {
                                  //TODO colocar uma tela popup de aviso com funções e explicações
                                  print('segurou');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: FadeInImage.memoryNetwork(
                                    alignment: Alignment.center,
                                    placeholder: kTransparentImage,
                                    image: e.get(
                                      'image',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //TODO ir para a página do produto clicado
                                  print('tocou');
                                },
                                onLongPress: () {
                                  //TODO colocar uma tela popup de aviso com funções e explicações
                                  print('segurou');
                                },
                                child: Center(
                                  child: Container(
                                    color:
                                        const Color.fromARGB(80, 58, 76, 128),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //TODO ir para a página do produto clicado
                                  print('tocou');
                                },
                                onLongPress: () {
                                  //TODO colocar uma tela popup de aviso com funções e explicações
                                  print('segurou');
                                },
                                child: Center(
                                  child: Text(
                                    e.get('text'),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }
              },
              future: FirebaseFirestore.instance
                  .collection("home")
                  .orderBy("pos")
                  .get(),
            ),
          ],
        ),
      ],
    );
  }
}
