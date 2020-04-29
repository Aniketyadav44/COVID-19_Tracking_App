import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import './live_updates_page.dart';
import './donations_page.dart';
import './contact.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID-19 HELP"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "Stay Home, \nStay Safe",
                style: TextStyle(
                  color: Color(0xff222B45),
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LivePage();
                  }),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xff222B45),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Live updates",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              "about Corona Virus",
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[500],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(Icons.arrow_forward,
                            color: Colors.white, size: 50),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                launch("https://www.mohfw.gov.in/pdf/FAQ.pdf");
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xff222B45),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "FAQ's",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Donations();
                  }));
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff222B45),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "DONATE",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  launch(
                      "https://play.google.com/store/apps/details?id=nic.goi.aarogyasetu");
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff222B45),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "GET AROGYA SETU APP",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                )),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff222B45)),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: <Widget>[
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Emblem_of_India.svg/496px-Emblem_of_India.svg.png',
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Ministry of Health",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                            Text(
                              "and Family Welfare",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                            Text(
                              "Government of India",
                              style: TextStyle(
                                  color: Color(0xff7D6464), fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Helpline Number :+91-11-23978046",
                    style: TextStyle(color: Colors.grey[500], fontSize: 20),
                  ),
                  Text(
                    "Toll Free : 1075",
                    style: TextStyle(color: Colors.grey[500], fontSize: 20),
                  ),
                  Text(
                    "Helpline Email ID : ncov2019@gov.in",
                    style: TextStyle(color: Colors.grey[500], fontSize: 20),
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Contacts();
                  }));
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff222B45),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "CONTACT DEVELOPER 🖥️",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
