import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../world_data_panel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './all_countries_pages.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  Map worldData;
  List countryData;
  List allCountryData;

  fetchWorldData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/v2/all");
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  fetchCountryData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v2/countries?sort=cases");
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  fetchAllCountryData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v2/countries");
    setState(() {
      allCountryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldData();
    fetchCountryData();
    fetchAllCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222B45),
      appBar: AppBar(
        title: Text("Live Updates"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                "WorldWide Cases",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              trailing: IconButton(
                  icon: Icon(Icons.refresh, color: Colors.white, size: 30),
                  onPressed: () {}),
            ),
            worldData == null
                ? SpinKitWave(color: Colors.white, size: 50)
                : WorldPanel(worldData),
            ListTile(
              title: Text(
                "Most Affected Countries",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              trailing: IconButton(
                  icon: Icon(Icons.refresh, color: Colors.white, size: 30),
                  onPressed: () {}),
            ),
            countryData == null
                ? SpinKitWave(color: Colors.white, size: 50)
                : Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
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
                                          countryData[index]["countryInfo"]
                                              ["flag"],
                                          height: 40,
                                        )),
                                    Text(
                                      countryData[index]["country"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.grey[900],
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          countryData[index]["cases"]
                                              .toString(),
                                          style: TextStyle(
                                              color: Color(0xffD6368B),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          countryData[index]["active"]
                                              .toString(),
                                          style: TextStyle(
                                              color: Color(0xff4297D8),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          countryData[index]["deaths"]
                                              .toString(),
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
                      itemCount: 5,
                    ),
                  ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AllCountries(allCountryData);
                }));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "View All Countries",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Icon(Icons.chevron_right, color: Colors.white, size: 50),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
