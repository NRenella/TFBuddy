import 'package:flutter/material.dart';

import 'package:tfbuddy/itemsPage.dart';
import 'package:tfbuddy/championsPage.dart';
import 'package:tfbuddy/infoPage.dart';
import 'package:tfbuddy/placeholder_widget.dart';

void main() => runApp(App());



class App extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: NavigationBar(),
    );
  }
}
class NavigationBar extends StatefulWidget{

  @override
  _NavigationBarState createState() => new _NavigationBarState();

}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;
  List<Widget> _children = [
    ItemsPage(),
    ChampionsPage(),
    InfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xff03273d),
          primaryColor: Color(0xffD0A954),
          textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: TextStyle(color: Colors.grey))
        ),
        child: BottomNavigationBar(

          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.local_dining),
              title: Text('Items'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.insert_emoticon),
              title: Text('Champions'),
            ),
            new BottomNavigationBarItem(
                icon: Icon(Icons.info),
                title: Text('Info')
            )

          ]
      ),
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      if(index == 2){
        _showDialog();
      } else {
        _currentIndex = index;
      }
    });
  }

  void _showDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("TFBuddy"),
          content: new Text("TFBuddy isn’t endorsed by Riot Games and doesn’t reflect the views or opinions of Riot Games or anyone officially involved in producing or managing League of Legends. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc. League of Legends © Riot Games, Inc."),
          actions: <Widget>[
            new FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: new Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
