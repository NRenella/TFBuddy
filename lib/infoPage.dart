import 'package:flutter/material.dart';

void main() => runApp(InfoPage());

class InfoPage extends StatefulWidget {

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                Color(0xff09a4bc),
                Color(0xff03273d),
                ]
              )
            ),
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
     SizedBox(height: 10,),
     Row(
        children: <Widget> [
        Container(
        margin: EdgeInsets.all(5.0),
        alignment: Alignment.centerLeft,
        child:
        Text("TFBuddy isn’t endorsed by Riot Games and doesn’t reflect the views or opinions of Riot Games or anyone officially involved in producing or managing League of Legends. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc. League of Legends © Riot Games, Inc."
          , style: TextStyle(
        fontFamily: 'Helvetica',
         fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
        ),
        ),
        ]
    ),
    ],
    ),
    ),
    ),
    );
  }
}
