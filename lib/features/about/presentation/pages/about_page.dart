import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
const AboutPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 200,width: 200, child: Image.asset('assets/gnac_news_icon.png', fit: BoxFit.fill,)),
            const SizedBox(height: 50,),
            const Text("Développer avec Gnac par Gnac", style: TextStyle(fontStyle: FontStyle.italic),textAlign: TextAlign.end)
          ],
        ),
      ),
    );
  }
}