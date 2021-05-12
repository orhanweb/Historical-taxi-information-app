import 'package:flutter/material.dart';
import 'package:yazlab2/pages/QueryOneWidget.dart';
import 'package:yazlab2/pages/Twogetdate.dart';

class QueryPage extends StatefulWidget {
  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sorgulardan birini seçiniz.'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('1. Sorgu'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QueryOneWidget()));
                  },
                ),
                ElevatedButton(
                  child: Text('2. Sorgu'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Twogetdate()));
                  },
                ),
                ElevatedButton(
                  child: Text('3. Sorgu'),
                  onPressed: () {
                    print('Pressed');
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
