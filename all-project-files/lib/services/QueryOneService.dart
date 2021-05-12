import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:yazlab2/Trash/Trash-tripmodel.dart';

class Getdata {
  Stream<QuerySnapshot> getTripdata() {
    var data = FirebaseFirestore.instance
        .collection("TripDate")
        .orderBy("trip_distance", descending: true)
        .limit(5)
        .snapshots();
    return data;
  }
}
