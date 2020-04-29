import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Search extends SearchDelegate {
  final List countryData;
  Search(this.countryData);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestList = query.isEmpty
        ? countryData
        : countryData
            .where((element) =>
                element["country"].toString().toLowerCase().startsWith(query))
            .toList();
    return suggestList == null
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
                                  suggestList[index]["countryInfo"]["flag"],
                                  height: 40,
                                )),
                            Text(
                              suggestList[index]["country"],
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
                                  "[ + ${suggestList[index]["todayCases"]} ]",
                                  style: TextStyle(
                                      color: Color(0xffD6368B),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                FittedBox(
                                    child: Text(
                                  suggestList[index]["cases"].toString(),
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
                                  suggestList[index]["active"].toString(),
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
                                  "[ + ${suggestList[index]["todayDeaths"]} ]",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                FittedBox(
                                    child: Text(
                                  suggestList[index]["deaths"].toString(),
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
              itemCount: suggestList.length,
            ),
          );
  }
}
