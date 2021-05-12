import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yazlab2/services/QueryOneService.dart';

class QueryOneWidget extends StatefulWidget {
  @override
  _QueryOneWidgetState createState() => _QueryOneWidgetState();
}

class _QueryOneWidgetState extends State<QueryOneWidget> {
  Getdata getdata1 = Getdata();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("En Uzun Mesafeli 5 Yolculuk"),
      ),
      body: StreamBuilder(
          stream: getdata1.getTripdata(),
          builder: (context, snaphot) {
            return !snaphot.hasData
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snaphot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot mydata = snaphot.data.docs[index];

                      return Card(
                        margin: const EdgeInsets.all(3),
                        //color: index == 0 ? Colors.amber : Colors.white,
                        child: ListTile(
                          leading:
                              Text("Zaman: ${mydata['tpep_pickup_datetime']}"),
                          title: Text(""),
                          subtitle: Text(
                            "",
                          ),
                          trailing: Text(
                            "Mesafe : ${mydata['trip_distance']} mil",
                          ),
                          isThreeLine: true,
                        ),
                      );
                    });
          }),
    );
  }
}
