import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yazlab2/services/QueryTwoService.dart';

class QueryTwoWidget extends StatefulWidget {
  @override
  _QueryTwoWidgetState createState() => _QueryTwoWidgetState();
}

class _QueryTwoWidgetState extends State<QueryTwoWidget> {
  Getdete getdata2 = Getdete();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("En az mesafeli 5 yolculuk"),
      ),
      body: StreamBuilder(
          stream: getdata2.getTripdata(),
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
