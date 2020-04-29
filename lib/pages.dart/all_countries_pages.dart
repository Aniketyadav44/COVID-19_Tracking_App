import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../search.dart';

class AllCountries extends StatelessWidget {
  final List countryData;
  AllCountries(this.countryData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222B45),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: Search(countryData),
                );
              })
        ],
        title: Text("All Countries"),
        centerTitle: true,
      ),
      body: countryData == null
          ? SpinKitWave(color: Colors.white, size: 50)
          : Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: <Widget>[
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Image.network(
                                    countryData[index]["countryInfo"]["flag"],
                                    height: 40,
                                  )),
                              Text(
                                countryData[index]["country"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey[900],
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Confirmed",
                                    style: TextStyle(
                                        color: Color(0xffD6368B),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "[ + ${countryData[index]["todayCases"]} ]",
                                    style: TextStyle(
                                        color: Color(0xffD6368B),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  FittedBox(
                                      child: Text(
                                    countryData[index]["cases"].toString(),
                                    style: TextStyle(
                                        color: Color(0xffD6368B),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Active",
                                    style: TextStyle(
                                        color: Color(0xff4297D8),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(height: 26),
                                  FittedBox(
                                      child: Text(
                                    countryData[index]["active"].toString(),
                                    style: TextStyle(
                                        color: Color(0xff4297D8),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Deaths",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "[ + ${countryData[index]["todayDeaths"]} ]",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  FittedBox(
                                      child: Text(
                                    countryData[index]["deaths"].toString(),
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: countryData.length,
              ),
            ),
    );
  }
}
