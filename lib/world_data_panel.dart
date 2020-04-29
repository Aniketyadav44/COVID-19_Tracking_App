import 'package:flutter/material.dart';

class WorldPanel extends StatelessWidget {
  final Map worldData;
  WorldPanel(this.worldData);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                height: 150,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FittedBox(
                        child: Text(
                      "CONFIRMED CASES",
                      style: TextStyle(
                          color: Color(0xffD6368B),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                    Text(
                      "[ + ${worldData["todayCases"]} ]",
                      style: TextStyle(
                          color: Color(0xffD6368B),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    FittedBox(
                      child: Text(
                        worldData["cases"].toString(),
                        style: TextStyle(
                            color: Color(0xffD6368B),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 150,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "DEATHS",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "[ + ${worldData["todayDeaths"]} ]",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    FittedBox(
                        child: Text(
                      worldData["deaths"].toString(),
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                height: 150,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "RECOVERED",
                      style: TextStyle(
                          color: Color(0xff30D593),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    FittedBox(
                        child: Text(
                      worldData["recovered"].toString(),
                      style: TextStyle(
                          color: Color(0xff30D593),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 150,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "ACTIVE",
                      style: TextStyle(
                          color: Color(0xff4297D8),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    FittedBox(
                        child: Text(
                      worldData["active"].toString(),
                      style: TextStyle(
                          color: Color(0xff4297D8),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
