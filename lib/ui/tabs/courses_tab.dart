import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_flutter/widgets/tiles/category_tile.dart';
import 'package:flutter/material.dart';

class CoursesTab extends StatelessWidget {
  const CoursesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection("products")
            .doc("cursos")
            .collection("items")
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var dividedTiles = ListTile.divideTiles(
              tiles: snapshot.data!.docs.map((e) {
                return CategoryTile(e);
              }).toList(),
              color: Colors.grey[500],).toList();

            return ListView(
              children: dividedTiles,
            );
          }
        });
  }
}
