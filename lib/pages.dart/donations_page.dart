import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Donations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Text("🙏DONATE🙏",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            Container(
              width: double.infinity,
              height: 550,
              child: Image.network(
                "https://www.pmindia.gov.in/wp-content/uploads/2020/03/Master-Black-QR-PMCARES-BHIM-UPI.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "Domestic Donors",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xff11B1E1),
              ),
            ),
            Text(
              "Name of Account: PM CARES\nAccount Number: 2121PM20202\nIFSC Code: SBIN0000691\nUPI : pmcares@sbi\n\nState Bank Of India,\nNew Delhi Main Branch",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              child: Text(
                "CLICK HERE FOR ONLINE DONATION",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                launch("https://www.pmcares.gov.in/en/");
              },
              color: Color(0xff11B1E1),
              textColor: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
