import 'package:firebase_auth/firebase_auth.dart';
import 'package:listin/firestore/models/listin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListinService {
  String user_id = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> adicionarListin({required Listin listin}) async {
    return firestore.collection('feiras').doc(listin.idListin).set(listin.toMap());
  }

  Future<List<Listin>> lerListins() async {
    List<Listin> temp = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('feiras').where('idUser', isEqualTo: user_id).get();

    for (var doc in snapshot.docs) {
      temp.add(Listin.fromMap(doc.data()));
    }

    return temp;
  }

  Future<void> removerListin({required String listinId}) async {
    return firestore.collection('feiras').doc(listinId).delete();
  }
}