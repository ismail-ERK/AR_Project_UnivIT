import 'dart:convert';

import 'package:arcore_flutter_plugin_example/color.dart';
import 'package:flutter/material.dart';


import 'QrCodeScanner/new_scan_new_qr.dart';

// classe represente l'activite de choix de l'option de scan
class ScanneList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScanneList();
}

class _ScanneList extends State<ScanneList> {
  // liste des choice de scan avec leur description
  List<ScanChoice> ScanChoices = [

    ScanChoice(
        choiceId: 2,
        title: 'QR Code augmenté',
        description: 'scan de QR Code pour afficher le modele',
        imagePath: 'assets/images/qrscan.png'),

  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Les méthodes de scan'),


            ),
            body: ChoiceListView(ScanChoices: ScanChoices)));
  }


}

// class represente les choix avec leur details
class ScanChoice {
  String title;
  String description;
  String imagePath;
  int choiceId;

  ScanChoice({this.choiceId, this.title, this.description, this.imagePath});
}

//classe pour convertir la liste des donnees en des composants graphiques
class ChoiceListView extends StatelessWidget {
  List<ScanChoice> ScanChoices = [];

  ChoiceListView({this.ScanChoices});

  List<Widget> _bulidList(BuildContext context) {
    List<Widget> list = [];
    list.add(Container(
        height: 200,
        // color: Color.fromARGB(255, 83, 154, 230),
        child: Row(
          children: [
            SizedBox(width: 20),
            Text(
              'Choisir une \n    Option',
              style: TextStyle(
                  fontFamily: 'Updock',
                  fontSize: 34,
                  letterSpacing: 3.2,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            // SizedBox(width: 48),
            Image.asset('assets/images/select.png', height: 100, width: 100)
          ],
        )));
    for (ScanChoice scanChoice in ScanChoices) {
      list.add(
        Builder(
            builder: (context) => InkWell(
                  onTap: () {
                    switch (scanChoice.choiceId) {

                      case 2:
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewScanNewQr()),
                          (Route<dynamic> route) => false,
                        );
                        break;

                      default:
                    }
                  },
                  child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.5), //shadow color
                            spreadRadius: 5, // spread radius
                            blurRadius: 7, // shadow blur radius
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        children: [
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                scanChoice.title,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                scanChoice.description,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                          Image.asset(
                            scanChoice.imagePath,
                            height: 200,
                          ),
                        ],
                      )),
                )),
      );
      list.add(SizedBox(height: MediaQuery.of(context).size.height * 0.05));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: StandardColor.color4,
      child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: _bulidList(context)),
    );
  }
}
