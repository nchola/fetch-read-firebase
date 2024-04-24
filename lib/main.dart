import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:muhammadnanda_uts/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDjpmPxCxU3y7wmRPfmWpPOuPnnvfqWRQM',
      appId: '1:253279311778:web:2379422477d574971b04fb',
      messagingSenderId: '253279311778',
      projectId: 'muhammadnandauts',
      authDomain: 'muhammadnandauts.firebaseapp.com',
      databaseURL: 'https://muhammadnandauts-default-rtdb.asia-southeast1.firebasedatabase.app',
      storageBucket: 'muhammadnandauts.appspot.com',
      measurementId: 'G-2XMZJRJSQ6',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RelTimeData(),
    );
  }
}

class RelTimeData extends StatelessWidget {
  RelTimeData({super.key});

  final ref = FirebaseDatabase.instance.ref('provinsi_data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RealTimeDatabase"),
      ),
      body: FirebaseAnimatedList(
        query: ref,
        itemBuilder: (context, snapshot, animation, index) {
          Map<String, dynamic> data = Map<String, dynamic>.from(snapshot.value as Map);
          return Card(
            color: Color.fromARGB(255, 229, 206, 134),
            child: ListTile(
              title: Text("Provinsi: ${data['provinsi']}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ibukota: ${data['ibukota']}"),
                  Text("Luas (km2): ${data['luas_km2']}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}