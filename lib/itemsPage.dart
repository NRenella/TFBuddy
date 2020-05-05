import 'package:flutter/material.dart';

void main() => runApp(ItemsPage());

class ItemsPage extends StatefulWidget {

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {

  AssetImage _imageToShow;
  Text _itemDes;
  Text _itemName;

  void updateImage(){
    setState(() {
      if(topSelect != null && botSelect != null){
        if(int.parse(topSelect) > int.parse(botSelect)) {
          _imageToShow = new AssetImage('assets/' + botSelect + topSelect + '.png');
          _itemDes = Text(itemDescriptions[int.parse(botSelect)][int.parse(topSelect)], style: TextStyle(
            fontFamily: 'Helvetica',
            color: Colors.white,
            fontSize: 16,
          ),);
          _itemName = Text(itemNames[int.parse(botSelect)][int.parse(topSelect)], style: TextStyle(
            fontFamily: 'Helvetica',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),);
        } else {
          _imageToShow = new AssetImage('assets/' + topSelect + botSelect + '.png');
          _itemDes = Text(itemDescriptions[int.parse(topSelect)][int.parse(botSelect)], style: TextStyle(
            fontFamily: 'Helvetica',
            color: Colors.white,
            fontSize: 16,
          ),);
          _itemName = Text(itemNames[int.parse(topSelect)][int.parse(botSelect)], style: TextStyle(
            fontFamily: 'Helvetica',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),);
        }
      }
    });
  }

  String topSelect;
  String botSelect;

  List<bool> _selectionsTOP1 = List.generate(5, (_) => false);
  List<bool> _selectionsBOT1 = List.generate(4, (_) => false);

  List<bool> _selectionsTOP2 = List.generate(5, (_) => false);
  List<bool> _selectionsBOT2 = List.generate(4, (_) => false);

  int lastSelected = -1;

  var itemDescriptions = List.generate(10, (i) => List(10), growable: false);
  var itemNames = List.generate(10, (i) => List(10), growable: false);

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

                    //Color(0xff90ccf4)
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
                  Text("Select Item 1:                          ", style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  ),
                ),


        ]
              ),

              ToggleButtons(
                children: <Widget>[
                  Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/01.png'),
                      ),
                    ),
                  ),
                  Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/02.png'),
                      ),
                    ),
                  ),Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/03.png'),
                      ),
                    ),
                  ),Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/04.png'),
                      ),
                    ),
                  ),Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/05.png'),
                      ),
                    ),
                  ),
                ],
                selectedBorderColor: Color(0xffD0A954),
                isSelected: _selectionsTOP1,
                borderWidth: 4,
                onPressed: (int index){
                  setState(() {
                    for(int i = 0; i < _selectionsBOT1.length; i++){
                      _selectionsBOT1[i] = false;
                    }
                    for(int i = 0; i < _selectionsTOP1.length; i++){
                      if(i == index){
                        _selectionsTOP1[i] = true;
                      } else{
                        _selectionsTOP1[i] = false;
                      }
                    }

                    topSelect = (index + 1).toString();
                    updateImage();
                  });
                },
              ),
              ToggleButtons(
                children: <Widget>[

                  Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/06.png'),
                      ),
                    ),
                  ),Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/07.png'),
                      ),
                    ),
                  ),Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/08.png'),
                      ),
                    ),
                  ),Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/09.png'),
                      ),
                    ),
                  ),
                ],
                selectedBorderColor: Color(0xffD0A954),
                isSelected: _selectionsBOT1,
                borderWidth: 4,
                onPressed: (int index){
                  setState(() {
                    for(int i = 0; i < _selectionsTOP1.length; i++){
                      _selectionsTOP1[i] = false;
                    }
                    for(int i = 0; i < _selectionsBOT1.length; i++){
                      if(i == index){
                        _selectionsBOT1[i] = true;
                      } else{
                        _selectionsBOT1[i] = false;
                      }
                    }
                    topSelect = (index + 6).toString();
                    updateImage();
                  });
                },
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                alignment: Alignment.centerLeft,
                child:
                Text("Select Item 2:", style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
                ),
              ),
              ToggleButtons(
                children: <Widget>[
                  Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/01.png'),
                      ),
                    ),
                  ),
                  Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/02.png'),
                      ),
                    ),
                  ),Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/03.png'),
                      ),
                    ),
                  ),Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/04.png'),
                      ),
                    ),
                  ),Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/05.png'),
                      ),
                    ),
                  ),
                ],
                selectedBorderColor: Color(0xffD0A954),
                isSelected: _selectionsTOP2,
                borderWidth: 4,
                onPressed: (int index){
                  setState(() {
                    for(int i = 0; i < _selectionsBOT2.length; i++){
                      _selectionsBOT2[i] = false;
                    }
                    for(int i = 0; i < _selectionsTOP2.length; i++){
                      if(i == index){
                        _selectionsTOP2[i] = true;
                      } else{
                        _selectionsTOP2[i] = false;
                      }
                    }
                    botSelect = (index + 1).toString();
                    updateImage();
                  });
                },
              ),
              ToggleButtons(
                children: <Widget>[

                  Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/06.png'),
                      ),
                    ),
                  ),Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/07.png'),
                      ),
                    ),
                  ),Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/08.png'),
                      ),
                    ),
                  ),Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/09.png'),
                      ),
                    ),
                  ),
                ],
                selectedBorderColor: Color(0xffD0A954),
                isSelected: _selectionsBOT2,
                borderWidth: 4,
                onPressed: (int index){
                  setState(() {
                    for(int i = 0; i < _selectionsTOP2.length; i++){
                      _selectionsTOP2[i] = false;
                    }
                    for(int i = 0; i < _selectionsBOT2.length; i++){
                      if(i == index){
                        _selectionsBOT2[i] = true;
                      } else{
                        _selectionsBOT2[i] = false;
                      }
                    }
                    botSelect = (index + 6).toString();
                    updateImage();
                  });
                },
              ),

              Container(
                height: 210,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Container(
                        width: 65.0,
                        height: 65.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: _imageToShow,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        alignment: Alignment.centerLeft,
                        child:_itemName,
                      ),

                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.all(5.0),
                          child: _itemDes
                      ),
                    ]
                ),
              ),

            ],
          ),
        ),
      ),
    );
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

  @override
  initState(){
    _imageToShow = AssetImage('assets/empty.png');
    _itemDes = Text("Select two items to see what they build into!", style: TextStyle(
      fontFamily: 'Helvetica',
      color: Colors.white,
      fontSize: 20,
    ),);
    _itemName = Text("", style: TextStyle(
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 16,
    ),);
    itemNames[1][1] = "Deathblade";
    itemNames[1][2] = "Giant Slayer";
    itemNames[1][3] = "Hextech Gunblade";
    itemNames[1][4] = "Spear of Shojin";
    itemNames[1][5] = "Guardian Angel";
    itemNames[1][6] = "Bloodthirster";
    itemNames[1][7] = "Zeke's Convergence";
    itemNames[1][8] = "Blade of the Ruined King";
    itemNames[1][9] = "Infinity Edge";
    itemNames[2][2] = "Rapidfire Cannon";
    itemNames[2][3] = "Guinsoo's Rageblade";
    itemNames[2][4] = "Statikk's Shiv";
    itemNames[2][5] = "Titan's Resolve";
    itemNames[2][6] = "Runaan's Hurricane";
    itemNames[2][7] = "Zz'Rot Portal";
    itemNames[2][8] = "Infiltrator's Talons";
    itemNames[2][9] = "Last Whisper";
    itemNames[3][3] = "Rabadon's Deathcap";
    itemNames[3][4] = "Luden's Echo";
    itemNames[3][5] = "Locket of the Iron Solari";
    itemNames[3][6] = "Ionic Spark";
    itemNames[3][7] = "Morellonomicon";
    itemNames[3][8] = "Demolitionist's Charge";
    itemNames[3][9] = "Jeweled Gauntlet";
    itemNames[4][4] = "Seraph's Embrace";
    itemNames[4][5] = "Frozen Heart";
    itemNames[4][6] = "Chalice of Favor";
    itemNames[4][7] = "Redemption";
    itemNames[4][8] = "Star Guardian's Charm";
    itemNames[4][9] = "Hand of Justice";
    itemNames[5][5] = "Bramble Vest";
    itemNames[5][6] = "Sword Breaker";
    itemNames[5][7] = "Red Buff";
    itemNames[5][8] = "Rebel's Medal";
    itemNames[5][9] = "Shroud of Stillness";
    itemNames[6][6] = "Dragon's Claw";
    itemNames[6][7] = "Zephyr";
    itemNames[6][8] = "Celestial Orb";
    itemNames[6][9] = "Quicksilver";
    itemNames[7][7] = "Warmog's Armor";
    itemNames[7][8] = "Protector's Chestguard";
    itemNames[7][9] = "Trap Claw";
    itemNames[8][8] = "Force of Nature";
    itemNames[8][9] = "Dark Star's Heart";
    itemNames[9][9] = "Thief's Gloves";
    itemDescriptions[1][1] = "Contributing to a kill grants +15 Attack Damage for the remainder of combat. This effect can stack any number of times (starting at 2.0).";
    itemDescriptions[1][2] = "The wearer's Basic Attacks deal an additional 12% of the target's current Health as physical damage.";
    itemDescriptions[1][3] = "Basic Attacks and spells heal the wearer for 25% of the damage dealt.";
    itemDescriptions[1][4] = "After casting their spell, the wearer's Basic Attacks restore 18% of their max Mana on-hit.";
    itemDescriptions[1][5] = "Prevents the wearer's first death, placing them in stasis instead. After 2 seconds, they return with 400 Health and shed all negative effects.";
    itemDescriptions[1][6] = "Basic Attacks heal the wearer for 35% of the damage dealt.";
    itemDescriptions[1][7] = "When combat begins, the wearer and all allies within 2 hexes in the same row gain +18% Attack Speed for the rest of combat.";
    itemDescriptions[1][8] = "The wearer gains the Blademaster trait. [Unique - Only One Per Champion]";
    itemDescriptions[1][9] = "Grants +100% Critical Strike Damage.";
    itemDescriptions[2][2] = "Gain 100% Attack Range.";
    itemDescriptions[2][3] = "Basic Attacks grant +5% bonus Attack Speed for the rest of combat. This effect can stack any number of times.";
    itemDescriptions[2][4] = "Every third Basic Attack from the wearer deals 80 magic damage to 3/4/5 enemies.(Based on Star Level)";
    itemDescriptions[2][5] = "When the wearer takes damage or inflicts a critical hit, they gain a 2% stacking damage bonus. Stacks up to 50 times, at which point the wearer gains 25 Armor and Magic Resistance, and increases in size.";
    itemDescriptions[2][6] = "Basic Attacks fire a bolt at another nearby enemy, dealing 70% of the wearer's Attack Damage and applying on-hit effects.";
    itemDescriptions[2][7] = "When the wearer dies, a Construct with 1000/2000/4000 Health arises to continue the fight.(Based on Star Level)";
    itemDescriptions[2][8] = "The wearer gains the Infiltrator trait. [Unique - Only One Per Champion]";
    itemDescriptions[2][9] = "When the wearer inflicts a critical hit, the target's Armor is reduced by 90% for 3 seconds. This effect does not stack. [Unique - Only One Per Champion]";
    itemDescriptions[3][3] = "Grants +50% Spell Power Amplification. (All sources of Spell Power are 50% more effective)";
    itemDescriptions[3][4] = "When the wearer casts their spell, the first target dealt magic damage and up to 3 nearby enemies are dealt an additional 150.0/175.0/225 magic damage.(Based on Star Level)";
    itemDescriptions[3][5] = "When combat begins, the wearer and all allies within 2 hexes in the same row gain a shield that blocks 250.0/275.0/350 damage for 8 seconds.(Based on Star Level)";
    itemDescriptions[3][6] = "Enemies within 2 hexes have their Magic Resist reduced by 50% (does not stack). When they cast a spell, they are zapped taking magic damage equal to 225% of their max Mana.";
    itemDescriptions[3][7] = "When the wearer deals damage with their spell, they burn the target, dealing 27% of the target's Maximum Health as true damage over 10 seconds and reducing healing by 30% for the duration of the burn. [Unique - Only One Per Champion]";
    itemDescriptions[3][8] = "The wearer gains the Demolitionist trait. [Unique - Only One Per Champion]";
    itemDescriptions[3][9] = "Your spells can inflict critical hits. [Unique - Only One Per Champion]";
    itemDescriptions[4][4] = "After casting their spell, the wearer gains 20 Mana.";
    itemDescriptions[4][5] = "Reduces the Attack Speed of nearby enemies by 40%. Each Frozen Heart a champion carries beyond the first increases the radius of this effect.";
    itemDescriptions[4][6] = "When the wearer casts a spell, restores 10 mana to allies within 2 hexes.";
    itemDescriptions[4][7] = "When the wearer dies, allies are healed for 800 Health.";
    itemDescriptions[4][8] = "The wearer gains the Star Guardian trait. [Unique - Only One Per Champion]";
    itemDescriptions[4][9] = "At the beginning of each planning phase, the wearer gains one of the following: * Basic attacks and spells deal +50% Damage * Basic attacks heal 50 Health on-hit";
    itemDescriptions[5][5] = "Negates bonus damage from incoming critical hits. On being hit by a Basic Attack, deal 80/120/160 magic damage to all nearby enemies once every 2.5 seconds.(Based on Star Level)";
    itemDescriptions[5][6] = "The wearer's Basic Attacks have a 25% chance to disarm the target for 3 seconds, preventing that enemy from making Basic Attacks.";
    itemDescriptions[5][7] = "Wearer's Basic Attacks burn the target on-hit, dealing 27% of the target's Maximum Health as true damage over 10 seconds and reducing healing by 30% for the duration of the burn. [Unique - Only One Per Champion]";
    itemDescriptions[5][8] = "The wearer gains the Rebel trait. [Unique - Only One Per Champion]";
    itemDescriptions[5][9] = "When combat begins, shoots a beam straight ahead that delays affected enemies' first spellcast, increasing their max Mana by 40% until they cast. [Unique - Only One Per Champion]";
    itemDescriptions[6][6] = "Reduces incoming magic damage by 50%.";
    itemDescriptions[6][7] = "When combat begins, the wearer summons a whirlwind on the opposite side of the arena that removes the closest enemy from combat for 5 seconds. [Unique - Only One Per Champion]";
    itemDescriptions[6][8] = "The wearer gains the Celestial trait. [Unique - Only One Per Champion]";
    itemDescriptions[6][9] = "The wearer is immune to crowd control for the first 15 seconds of combat. [Unique - Only One Per Champion]";
    itemDescriptions[7][7] = "The wearer regenerates 5% of their missing Health, but not more than 150 HP, per second.";
    itemDescriptions[7][8] = "The wearer gains the Protector trait. [Unique - Only One Per Champion]";
    itemDescriptions[7][9] = "Blocks the first enemy spell that hits the wearer, and stuns the spell's caster for 4 seconds.";
    itemDescriptions[8][8] = "Wearer's team gains +1 maximum team size.";
    itemDescriptions[8][9] = "The wearer gains the Dark Star trait. [Unique - Only One Per Champion]";
    itemDescriptions[9][9] = "At the beginning of each planning phase, the wearer equips 2 temporary items. Temporary items increase in power based on your player level. [Consumes Three Item Slots]";

  }
}