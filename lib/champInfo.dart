import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChampPortait extends StatelessWidget{
  final String name;
  final int trait1;
  final int trait2;
  final int trait3;

  ChampPortait({
    @required this.name,
    @required this.trait1,
    @required this.trait2,
    @required this.trait3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.0,
      height: 65.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/'+ name +'.png'),
        ),
      ),
    );
  }
}