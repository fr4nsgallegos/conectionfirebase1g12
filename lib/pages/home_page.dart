import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // FirebaseFirestore.instance.collection("users").get();
                  CollectionReference userReference = FirebaseFirestore.instance
                      .collection("users");
                  userReference.get().then((value) {
                    QuerySnapshot userCollection = value;
                    List<QueryDocumentSnapshot> docs = userCollection.docs;
                    print("userCollection: $userCollection");
                    print("docs: $docs");
                    print(docs[0]);
                    docs.forEach((e) {
                      print("--------------------------------");
                      print(e);
                      print(e.id);
                      print(e.data());
                      print("--------------------------------");
                    });
                  });
                },
                child: Text("Traer información desde Firestore"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
