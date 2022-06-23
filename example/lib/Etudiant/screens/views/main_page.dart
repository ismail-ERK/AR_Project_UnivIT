
import 'package:arcore_flutter_plugin_example/Etudiant/screens/scanne_list.dart';

import 'package:flutter/material.dart';



class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: new FittedBox(
                  child: Material(
                      color: Colors.white,
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(10.0),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Container(
                                        child: Text(
                                      "Check my lessons",
                                      style: TextStyle(
                                          color: Color(0xFF1BB5FD),
                                          fontSize: 10),
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Container(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Center(
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ScanneList()));
                                            },
                                            child: Text(
                                              'My lessons',
                                              style: TextStyle(
                                                  color: Colors.blueAccent[700],
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(10.0),
                              child: Image(
                                fit: BoxFit.contain,
                                alignment: Alignment.topRight,
                                image: NetworkImage(
                                    "https://static.vecteezy.com/system/resources/previews/002/896/415/original/books-illustration-cartoon-books-books-vector.jpg"),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
