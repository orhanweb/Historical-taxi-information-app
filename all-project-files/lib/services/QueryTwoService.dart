import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:yazlab2/Trash/Trash-tripmodel.dart';

class Getdete {
  int baslangic = 0, bitis = 0;
  getdate(int giris, int cikis) {
    baslangic = giris;
    bitis = cikis;
    print(int.parse("202012${baslangic}"));
    print(int.parse("202012${bitis}"));
  }

  Stream<QuerySnapshot> getTripdata() {
    var data = FirebaseFirestore.instance
        .collection("TripDate")
        .orderBy("trip_distance", descending: false)
        /*.where("tpep_pickup_datetime",
            isGreaterThan: int.parse("202012${bitis}"),
            isLessThan: int.parse("202012${baslangic}"))*/
        .where("trip_distance", isGreaterThan: 0.0)
        .limit(5)
        .snapshots();
    return data;
  }
}
