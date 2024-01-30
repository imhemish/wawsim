import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/weather_controller.dart';

enum BackgroundImageType { custom, asset }

class UserDataController extends GetxController {
  RxList<String> places = <String>[].obs;
  final collection = FirebaseFirestore.instance.collection("user_data");
  String? documentId;
  WeatherController weatherController = Get.find<WeatherController>();
  Rx<BackgroundImageType> backgroundImageType = BackgroundImageType.asset.obs;
  Rx<String> imageURL = "".obs;

  @override
  void onInit() {
    super.onInit();

    // Wait for ensureInitialised to complete (which will ensure the collections store
    // contains an entry with current user), and then add listener which changes "places"
    ensureInitialised().then((value) => listenToChanges());
    
  }

  void listenToChanges() {
    var doc = collection.doc(documentId);
    // Receive stream of snapshot updates and update places
    doc.snapshots().listen((snapshot) {
      if (snapshot.exists) {
        places.clear();
        for (var i in snapshot.data()?["places"]) {
          places.add(i.toString());
        }

        if (snapshot.data()?.containsKey("backgroundImage") ?? false) {
          imageURL.value = imageURL.value = snapshot.data()!['backgroundImage'];
      backgroundImageType.value = BackgroundImageType.custom;
        }

      }
      
     });
  }

  Future<void> ensureInitialised() async {

    var query = collection.where("owner", isEqualTo: FirebaseAuth.instance.currentUser?.uid);
    if ((await query.get()).docs.isEmpty) {
      // Data has not been sent yet
      var doc = await collection.add({"owner": FirebaseAuth.instance.currentUser?.uid, "places": places.toList()});
      documentId = doc.id;
  } else {
    var document = (await query.get()).docs[0];
    documentId = document.id;
    if (document.data().containsKey("backgroundImage")) {
      imageURL.value = document.data()['backgroundImage'];
      backgroundImageType.value = BackgroundImageType.custom;
    }
  }
  print(documentId);
  }

  Future<void> addPlace(String place) async {
    if (documentId == null) {
      var query = collection.where("owner", isEqualTo: FirebaseAuth.instance.currentUser?.uid);
      documentId = (await query.get()).docs[0].id;
    }
    
    collection.doc(documentId).update({"places": places.toList()+[place]});
  }

  Future<void> deletePlace(String place) async {
    // Clone the places list
    var pls = List.of(places);
    pls.remove(place);
    collection.doc(documentId).update({"places": pls});
    
  }

  Future<void> uploadImage() async {
    final imagePicker = ImagePicker();
    var file = await imagePicker.pickImage(source: ImageSource.gallery);
    //if (!kIsWeb) {
      
    //} else {
      //var path = (await getApplicationCacheDirectory()).path+"bg";
      //file?.saveTo(path);
      //if (file?.name != null && file?.name != "") {
      //(await SharedPreferences.getInstance()).setString("backgroundImage", path);

      //}
    //}
    


    if (file?.name != null && file?.name != "") {
      //(await SharedPreferences.getInstance()).setString("backgroundImage", path);

      // Instead of using File(file.path), we are putting it as data
      // to accomodate the web platform
      final bg = FirebaseStorage.instance.ref().child("bg");
      await bg.putData(await file?.readAsBytes() ?? Uint8List(0), SettableMetadata(contentType: file?.mimeType));
      var url = await bg.getDownloadURL();

      backgroundImageType.value = BackgroundImageType.custom;
      imageURL.value = url;


      
      collection.doc(documentId).update({"backgroundImage": url});
    //weatherController.backgroundImage.value = Image.network(url);
    }    
  }
}