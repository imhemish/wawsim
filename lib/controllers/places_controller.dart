import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PlacesController extends GetxController {
  RxList<String> places = <String>[].obs;
  final store = FirebaseFirestore.instance;
  String? documentId;

  @override
  void onInit() {
    super.onInit();

    // Wait for ensureInitialised to complete (which will ensure the collections store
    // contains an entry with current user), and then add listener which changes "places"
    ensureInitialised().then((value) => listenToChanges());
    
  }

  void listenToChanges() {
    var doc = FirebaseFirestore.instance.collection("user_data").doc(documentId);
    // Receive stream of snapshot updates and update places
    doc.snapshots().listen((snapshot) {
      if (snapshot.exists) {
        places.clear();
        for (var i in snapshot.data()?["places"]) {
          places.add(i.toString());
        }
      }
      
     });
  }

  Future<void> ensureInitialised() async {

    var query = store.collection("user_data").where("owner", isEqualTo: FirebaseAuth.instance.currentUser?.uid);
    if ((await query.get()).docs.isEmpty) {
      // Data has not been sent yet
      var doc = await store.collection("user_data").add({"owner": FirebaseAuth.instance.currentUser?.uid, "places": places.toList()});
      documentId = doc.id;
  } else {
    documentId = (await query.get()).docs[0].id;
  }
  print(documentId);
  }

  Future<void> addPlace(String place) async {
    if (documentId == null) {
      var query = store.collection("user_data").where("owner", isEqualTo: FirebaseAuth.instance.currentUser?.uid);
      documentId = (await query.get()).docs[0].id;
    }
    
    store.collection("user_data").doc(documentId).update({"places": places.toList()+[place]});
  }

  Future<void> deletePlace(String place) async {
    
  }
}