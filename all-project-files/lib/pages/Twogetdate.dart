import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:yazlab2/pages/QueryTwoWidget.dart';
import 'package:yazlab2/services/QueryTwoService.dart';

class Twogetdate extends StatefulWidget {
  @override
  _TwogetdateState createState() => _TwogetdateState();
}

class _TwogetdateState extends State<Twogetdate> {
  Getdete dates = Getdete();
  TextEditingController baslangic = TextEditingController();
  TextEditingController bitis = TextEditingController();
  kontrol(dynamic giris, dynamic cikis) {
    //Repository().placeAddApiProvider(int.parse(_section_id.text));
    int t1 = int.parse(giris.toString());
    int t2 = int.parse(cikis.toString());
    if (t2 <= t1) {
      print("Başlangıç değeri bitis değerinden büyük olamaz.");
    } else if (t1 < 1 || t2 < 1 || 31 < t1 || 31 < t2) {
      print("Lütfen 1 ve 31 arasında değerler girin.");
    } else if (giris == "" || cikis == "") {
      print("Baslangic ve bitis değerleri bos birakilamaz.");
    } else {
      dates.getdate(t1, t2);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => QueryTwoWidget()));
    }
  }

  Getdete getdata2 = Getdete();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lütfen aralık seçin"),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: baslangic,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: bitis,
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  child: Text('Göster'),
                  onPressed: () {
                    kontrol(baslangic.text, bitis.text);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
