import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:global_med/pages/homeScreen/publications/social.card.widget.dart';
import 'package:global_med/utils/utils.dart';
import 'package:provider/provider.dart';

class Publications extends StatefulWidget {
  const Publications({
    super.key,
  });

  @override
  State<Publications> createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications> {
  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Map<String, dynamic>> combinedData = [];
    try {
      QuerySnapshot publicationSnapshot =
          await FirebaseFirestore.instance.collection("Publicacion").get();

      List<QueryDocumentSnapshot> publications = publicationSnapshot.docs;
      for (var publication in publications) {
        Map<String, dynamic> publicationData =
            publication.data() as Map<String, dynamic>;
        String authorId = publicationData['author'];
        // print("id: " + authorId);
        DocumentSnapshot authorSnapshot = await FirebaseFirestore.instance
            .collection('Usuario')
            .doc(authorId)
            .get();

        if (authorSnapshot.exists) {
          // print("Author Data: ${authorSnapshot.data()}");
          Map<String, dynamic> authorData =
              authorSnapshot.data() as Map<String, dynamic>;

          publicationData['authorInfo'] = {
            'id': authorSnapshot.id,
            ...authorData,
          };
          // print(publicationData);
          combinedData.add(publicationData);
        }
      }
      // print("aca bro final ");
      // print(combinedData[0]);
      // print(combinedData[1]);
      // print(combinedData[2]);
      setState(() {
        _data = combinedData;
        // print("data");
        print(_data);
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 455.h * _data.length,
      width: double.infinity,
      child: _data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: _data.map((publication) {
                var author = publication['authorInfo'];
                List<String> images =
                    List<String>.from(publication['imagenes']);
                List<String> topics =
                    List<String>.from(publication['categorias']);

                return SocialCard(
                  userId: author['id'],
                  name: author['nombre'],
                  ocupation: author['ash'],
                  content: publication['content'],
                  imageProfile: author['mainImage'],
                  imagesUrl: images,
                  topics: topics,
                );
              }).toList(),
            ),
    );
  }
}
