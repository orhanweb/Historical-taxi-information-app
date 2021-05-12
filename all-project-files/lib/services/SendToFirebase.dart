import 'package:cloud_firestore/cloud_firestore.dart';

class ParsingAndSending {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //veri ekleme kısmı

  Future<void> adddata(List _data) async {
    Map<String, dynamic> itemList = {};
    for (int i = 0; i < _data.length; i++) {
      itemList = {
        "id": _data[i][0],
        "location": _data[i][1],
        "zone": _data[i][2],
        "serviceZone": _data[i][3],
      };
      _firestore.collection("Zone").doc("${_data[i][0]}").set(itemList);
    }
    print("Veriler başarılı bir şekilde firebase' e gönderilmiştir.");
  }
}
