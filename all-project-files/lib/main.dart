import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:yazlab2/pages/Querypage.dart';
import 'package:yazlab2/services/SendToFirebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yazlab2/services/SendToFirebase_tripdata.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaxiApp',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ParsingAndSending sending = ParsingAndSending();
  ParsingAndSendingTrip sendTrip = ParsingAndSendingTrip();
  // This function is parsing csv files
  void _loadCSV() async {
    final _rawData =
        await rootBundle.loadString("assets/taxi+_zone_lookup.csv");
    List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);
    sending.adddata(_listData);
  }

  void _loadCSV1() async {
    final rawData =
        await rootBundle.loadString("assets/yellow_tripdata_2020-12.csv");
    List<List<dynamic>> listData = CsvToListConverter().convert(rawData);
    sendTrip.addTrip(listData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Anasayfaya Hoşgeldiniz'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('FireBase\'e Veri Ekle'),
                  onPressed: () {
                    _loadCSV();
                    _loadCSV1();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QueryPage()));
                  },
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QueryPage()));
                  },
                  child: Text("Eklemeden Devam Et"),
                )
              ],
            ),
          ],
        ));
  }
}

/* ListView.builder(
        itemCount: _data.length,
        itemBuilder: (_, index) {
          return Card(
            margin: const EdgeInsets.all(3),
            color: index == 0 ? Colors.amber : Colors.white,
            child: ListTile(
              leading: Text(_data[index][0].toString()),
              title: Text(_data[index][1]),
              subtitle: Text(
                _data[index][2].toString(),
              ),
              trailing: Text(
                _data[index][3].toString(),
              ),
              isThreeLine: true,
            ),
          );
        },
      ), */
