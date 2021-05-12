import 'package:cloud_firestore/cloud_firestore.dart';

class ParsingAndSendingTrip {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //veri ekleme kısmı

  Future<void> addTrip(List listData) async {
    Map<String, dynamic> itemList = {};
    List<List<dynamic>> dataTrip = [];
    for (int i = 0; i < 3000; i++) {
      listData[i].removeAt(0);
      listData[i].removeAt(1);
      listData[i].removeAt(3);
      listData[i].removeAt(3);
      listData[i].removeAt(5);
      listData[i].removeAt(5);
      listData[i].removeAt(5);
      listData[i].removeAt(5);
      listData[i].removeAt(5);
      listData[i].removeAt(5);
      listData[i].removeAt(5);
      listData[i].removeAt(6);
      dataTrip.add(listData[i]);
    }
    for (int i = 0; i < dataTrip.length; i++) {
      String date = dataTrip[i][0].toString();
      String realdate = date.substring(0, 10);
      realdate = realdate.replaceAll("-", "");
      dataTrip[i][0] = int.parse(realdate);
    }
    for (int i = 0; i < dataTrip.length; i++) {
      itemList = {
        "tpep_pickup_datetime": dataTrip[i][0],
        "passenger_count": dataTrip[i][1],
        "trip_distance": dataTrip[i][2],
        "pulocationID": dataTrip[i][3],
        "dolocationID": dataTrip[i][4],
        "total_amount": dataTrip[i][5],
      };
      _firestore.collection("TripDate").doc().set(itemList);
    }
    print("Gezinge verileri başarılı bir şekilde firebase' e gönderilmiştir.");
  }
}
