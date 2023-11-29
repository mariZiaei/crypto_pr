import 'package:flutter/material.dart';

import 'package:flutter_application_crypto/data/model/crypto.dart';
import 'package:flutter_application_crypto/secendPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = 'Loading...';

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: SpinKitCircle(
            color: Colors.blue,
            size: 80,
          ),
        ),
      ),
    ));
  }

  void getData() async {
    var response = await Dio().get('https://api.coincap.io/v2/assets');
    List<Crypto> cryptoList = response.data['data']
        .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CryptoPage(
                  cryptoList: cryptoList,
                )));
  }
}
