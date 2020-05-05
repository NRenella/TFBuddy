import 'package:flutter/material.dart';
import 'package:tfbuddy/champInfo.dart';

void main() => runApp(ChampionsPage());

class ChampionsPage extends StatefulWidget {

  @override
  _ChampionsPageState createState() => _ChampionsPageState();
}

class _ChampionsPageState extends State<ChampionsPage> {

  void updateImage(){
    setState(() {

        _imageToShow = new AssetImage('assets/' + _traitsOrigins[selectedOne] + '.png');
        _TOName = Text(_traitsOriginsNames[selectedOne], style: TextStyle(
          fontFamily: 'Helvetica',
          color: Colors.white,
          fontSize: 34,
        ),);
        _TODes = Text(_traitsOriginsDes[selectedOne], style: TextStyle(
          fontFamily: 'Helvetica',
          color: Colors.white,
          fontSize: 16,
        ),);


    });
  }


  AssetImage _imageToShow;
  Text _TOName;
  Text _TODes;

  List<bool> _selections1 = List.generate(6, (_) => false);
  List<bool> _selections2 = List.generate(6, (_) => false);
  List<bool> _selections3 = List.generate(6, (_) => false);
  List<bool> _selections4 = List.generate(5, (_) => false);


  List<String> _traitsOriginsNames = List.generate(23, (_) => '');
  List<String> _traitsOrigins = List.generate(23, (_) => '');
  List<String> _traitsOriginsDes = List.generate(23, (_) => '');

  List<ChampPortait> _AllChamps = List.generate(53, (_) => null);
  List<ChampPortait> _gridView = List.generate(0, (_) => null);


  List<Container> displayContainers = List.generate(0, (_) => null);

  int selectedOne = -1;

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

            Container(
            margin: EdgeInsets.all(5.0),
            alignment: Alignment.centerLeft,
            child:
              Text(
                "Select A Trait or Origin:",
                style: TextStyle(
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
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/blademaster.png'),
                    ),
                  ),
                ),
                Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/blaster.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/brawler.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/celestial.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/chrono.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/cybernetic.png'),
                    ),
                  ),
                ),

              ],
              selectedBorderColor: Color(0xffD0A954),
              isSelected: _selections1,
              borderWidth: 4,
              onPressed: (int index){
                setState(() {
                  for(int i = 0; i < _selections2.length; i++){
                    _selections2[i] = false;
                  }
                  for(int i = 0; i < _selections3.length; i++){
                    _selections3[i] = false;
                  }
                  for(int i = 0; i < _selections4.length; i++){
                    _selections4[i] = false;
                  }
                  for(int i = 0; i < _selections1.length; i++){
                    if(i == index){
                      _selections1[i] = true;
                    } else{
                      _selections1[i] = false;
                    }
                  }

                  selectedOne = (index);
                  updateImage();
                  updateGrid();

                });
              },
            ),
            ToggleButtons(
              children: <Widget>[
                Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/darkstar.png'),
                    ),
                  ),
                ),
                Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/demolitionist.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/infiltrator.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/manareaver.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/mechpilot.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/mercenary.png'),
                    ),
                  ),
                ),

              ],
              selectedBorderColor: Color(0xffD0A954),
              isSelected: _selections2,
              borderWidth: 4,
              onPressed: (int index){
                setState(() {
                  for(int i = 0; i < _selections1.length; i++){
                    _selections1[i] = false;
                  }
                  for(int i = 0; i < _selections3.length; i++){
                    _selections3[i] = false;
                  }
                  for(int i = 0; i < _selections4.length; i++){
                    _selections4[i] = false;
                  }
                  for(int i = 0; i < _selections2.length; i++){
                    if(i == index){
                      _selections2[i] = true;
                    } else{
                      _selections2[i] = false;
                    }
                  }
                  selectedOne = (index + 6);
                  updateImage();
                  updateGrid();

                });
              },
            ),
            ToggleButtons(
              children: <Widget>[
                Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/mystic.png'),
                    ),
                  ),
                ),
                Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/protector.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/rebel.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/sniper.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/sorcerer.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/spacepirate.png'),
                    ),
                  ),
                ),

              ],
              selectedBorderColor: Color(0xffD0A954),
              isSelected: _selections3,
              borderWidth: 4,
              onPressed: (int index){
                setState(() {
                  for(int i = 0; i < _selections1.length; i++){
                    _selections1[i] = false;
                  }
                  for(int i = 0; i < _selections2.length; i++){
                    _selections2[i] = false;
                  }
                  for(int i = 0; i < _selections4.length; i++){
                    _selections4[i] = false;
                  }
                  for(int i = 0; i < _selections3.length; i++){
                    if(i == index){
                      _selections3[i] = true;
                    } else{
                      _selections3[i] = false;
                    }
                  }
                  selectedOne = (index + 12);
                  updateImage();
                  updateGrid();

                });
              },
            ),
            ToggleButtons(
              children: <Widget>[
                Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/starguardian.png'),
                    ),
                  ),
                ),
                Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/starship.png'),
                    ),
                  ),
                ),
                Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/valkyrie.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/vanguard.png'),
                    ),
                  ),
                ),Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/void.png'),
                    ),
                  ),
                ),
              ],
              selectedBorderColor: Color(0xffD0A954),
              isSelected: _selections4,
              borderWidth: 4,
              onPressed: (int index){
                setState(() {
                  for(int i = 0; i < _selections1.length; i++){
                    _selections1[i] = false;
                  }
                  for(int i = 0; i < _selections3.length; i++){
                    _selections3[i] = false;
                  }
                  for(int i = 0; i < _selections2.length; i++){
                    _selections2[i] = false;
                  }
                  for(int i = 0; i < _selections4.length; i++){
                    if(i == index){
                      _selections4[i] = true;
                    } else{
                      _selections4[i] = false;
                    }
                  }
                  selectedOne = (index + 18);
                  updateImage();
                  updateGrid();

                });
              },
            ),
            Container(
              height: 280,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: EdgeInsets.all(10.0),
              child: Column(
                  children: <Widget>[

                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5.5),
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
                          alignment: Alignment.center,
                          child:_TOName,
                        ),

                      ],
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.all(5.0),
                        child: _TODes
                    ),
                    new Expanded(
                      child: GridView.count(
                        crossAxisCount: 5,
                      children: displayContainers,
                    ),
                    )
                  ]
              ),
            ),
            ],
          ),
        ),
      )
    );
  }

  void updateGrid(){
    _gridView.clear();
    for(int i =0; i < _AllChamps.length; i++){
      if(_AllChamps[i].trait1 == selectedOne || _AllChamps[i].trait2 == selectedOne || _AllChamps[i].trait3 == selectedOne){
        _gridView.add(_AllChamps[i]);
      }
    }
    _buildGridTiles(_gridView.length);
  }

  void _buildGridTiles(numberOfTiles){
    List<Container> containers = new List<Container>.generate(numberOfTiles,
            (int index){
      final imageName = 'assets/' +_gridView[index].name + '.png';
      return new Container(
        width: 25,
        height: 25,
        child: new Image.asset(imageName),
      );
    });
    displayContainers = containers;
  }
  @override
  initState() {
    
    _imageToShow = AssetImage('assets/empty.png');
    _TOName =
        Text("Select A Trait or Origin", style: TextStyle(
          fontFamily: 'Helvetica',
          color: Colors.white,
          fontSize: 20,
        ),);
    _TODes = Text("", style: TextStyle(
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 16,
    ),);

    _traitsOriginsNames[0] = 'Blademaster';
    _traitsOriginsNames[1] = 'Blaster';
    _traitsOriginsNames[2] = 'Brawler';
    _traitsOriginsNames[3] = 'Celestial';
    _traitsOriginsNames[4] = 'Chrono';
    _traitsOriginsNames[5] = 'Cybernetic';
    _traitsOriginsNames[6] = 'Dark Star';
    _traitsOriginsNames[7] = 'Demolitionist';
    _traitsOriginsNames[8] = 'Infiltrator';
    _traitsOriginsNames[9] = 'Mana-Reaver';
    _traitsOriginsNames[10] = 'Mech-Pilot';
    _traitsOriginsNames[11] = 'Mercenary';
    _traitsOriginsNames[12] = 'Mystic';
    _traitsOriginsNames[13] = 'Protector';
    _traitsOriginsNames[14] = 'Rebel';
    _traitsOriginsNames[15] = 'Sniper';
    _traitsOriginsNames[16] = 'Sorcerer';
    _traitsOriginsNames[17] = 'Space Pirate';
    _traitsOriginsNames[18] = 'Star Guardian';
    _traitsOriginsNames[19] = 'Starship';
    _traitsOriginsNames[20] = 'Valkyrie';
    _traitsOriginsNames[21] = 'Vanguard';
    _traitsOriginsNames[22] = 'Void';

    _traitsOriginsDes[0] = 'Blademasters basic attack have a 30%(3), 60%(6), 100%(9) chance to trigger 2 additional attacks against their target.';
    _traitsOriginsDes[1] = 'Every fourth attacks from Blaster fire an additional 3(2), 6(4) shots at random enemies. These shots deal damage like basic attacks, apply on-hit effects and can critically strike.';
    _traitsOriginsDes[2] = 'Brawlers gain additional +300(2), +700(4) maximum health.';
    _traitsOriginsDes[3] = 'All allies heal based on 15%(2), 40%(4), 65%(6) damage dealt with spells and attacks.';
    _traitsOriginsDes[4] = 'All allies gain a bonus 15%(2), 35%(4), 75%(6) attack speed every 4 seconds.';
    _traitsOriginsDes[5] = 'Cybernetics with at least one item gain a bonus 350 health and 35 attack damage(3), 750 health and 75 attack damage(6).';
    _traitsOriginsDes[6] = 'When a Dark Star unit dies, all other Dark Star units gain a bonus +25(3), +35(6), +45(9)attack damage and spell power.';
    _traitsOriginsDes[7] = 'While at least 2 Demolitionists are in play, all Demolitionists spells stun for 1.5 seconds, once per spell cast.';
    _traitsOriginsDes[8] = 'Infiltrators gain a bonus 50%(2), 80%(4), 125% refreshing on takedown(6) attack speed for 6 seconds at the start of combat.';
    _traitsOriginsDes[9] = 'While at least 2 Mana-Reaver are in play, Mana-Reavers attacks increase the cost of their targets next spell cast by 40%.';
    _traitsOriginsDes[10] = 'While at least 3 Mech-Pilots are in play, at the start of combat, three random Mech-Pilots are merged into a Super-Mech until it dies. ';
    _traitsOriginsDes[11] = 'While a Mercenary is in play or on the Bench, players will have the opportunity to access the Spell Upgrades pool of their Mercenary, each upgrades only appears once purchased.';
    _traitsOriginsDes[12] = 'All allies gain a bonus 35(2), 105(4) magic resistance';
    _traitsOriginsDes[13] = 'Protectors gain a shield based on 20%(2), 30%(3), 45%(6) of maximum health for 4 seconds whenever they cast a spell. The shield doesnt stack.';
    _traitsOriginsDes[14] = 'At the start of combat, Rebels gain a 150(3), 225(6), 350(9) shield and 10%(3), 12%(6), 15%(9) bonus damage for each adjacent Rebel. The shield lasts for 8 seconds.';
    _traitsOriginsDes[15] = 'While at least 2 Snipers are in play, Snipers deal 15% increased damage for each hex of distance between themselves and their target.';
    _traitsOriginsDes[16] = 'All allies gain +20(2), +45(4), +80(6), +125(8) spell power.';
    _traitsOriginsDes[17] = 'Whenever a Space Pirate lands a killing blow on a champion there is a 50% for 1 gold(2), 50% chance for 1 gold and 20% chance for component item(4).';
    _traitsOriginsDes[18] = 'Whenever a Star Guardian casts a spell, 30(3), 60(6) mana is evenly distributed among all other Star Guardians.';
    _traitsOriginsDes[19] = 'Starships gain 20 mana per second, continuously maneuver around the board, and are immune to movement impairing effects, but cant basic attack.';
    _traitsOriginsDes[20] = 'While at least 2 Valkyries are in play, Valkyries basic attacks and spells always critically strike targets below 50% health.';
    _traitsOriginsDes[21] = 'Vanguards gain a bonus +60(2), +250(4) armor.';
    _traitsOriginsDes[22] = 'While at least 3 Void units are in play, basic attacks and Special Abilities from Void units deal true damage.';
    _traitsOrigins[0] = 'blademaster';
    _traitsOrigins[1] = 'blaster';
    _traitsOrigins[2] = 'brawler';
    _traitsOrigins[3] = 'celestial';
    _traitsOrigins[4] = 'chrono';
    _traitsOrigins[5] = 'cybernetic';
    _traitsOrigins[6] = 'darkstar';
    _traitsOrigins[7] = 'demolitionist';
    _traitsOrigins[8] = 'infiltrator';
    _traitsOrigins[9] = 'manareaver';
    _traitsOrigins[10] = 'mechpilot';
    _traitsOrigins[11] = 'mercenary';
    _traitsOrigins[12] = 'mystic';
    _traitsOrigins[13] = 'protector';
    _traitsOrigins[14] = 'rebel';
    _traitsOrigins[15] = 'sniper';
    _traitsOrigins[16] = 'sorcerer';
    _traitsOrigins[17] = 'spacepirate';
    _traitsOrigins[18] = 'starguardian';
    _traitsOrigins[19] = 'starship';
    _traitsOrigins[20] = 'valkyrie';
    _traitsOrigins[21] = 'vanguard';
    _traitsOrigins[22] = 'void';
    _AllChamps[0] = ChampPortait(name: 'ahri', trait1: 18, trait2: 16, trait3: -1);
    _AllChamps[1] = ChampPortait(name: 'annie', trait1: 10, trait2: 16, trait3: -1);
    _AllChamps[2] = ChampPortait(name: 'ashe', trait1: 15, trait2: 3, trait3: -1);
    _AllChamps[3] = ChampPortait(name: 'aurelionsol', trait1: 14, trait2: 19, trait3: -1);
    _AllChamps[4] = ChampPortait(name: 'blitzcrank', trait1: 4, trait2: 2, trait3: -1);
    _AllChamps[5] = ChampPortait(name: 'caitlyn', trait1: 15, trait2: 4, trait3: -1);
    _AllChamps[6] = ChampPortait(name: 'chogath', trait1: 2, trait2: 22, trait3: -1);
    _AllChamps[7] = ChampPortait(name: 'darius', trait1: 9, trait2: 17, trait3: -1);
    _AllChamps[8] = ChampPortait(name: 'ekko', trait1: 5, trait2: 8, trait3: -1);
    _AllChamps[9] = ChampPortait(name: 'ezreal', trait1: 1, trait2: 4, trait3: -1);
    _AllChamps[10] = ChampPortait(name: 'fizz', trait1: 8, trait2: 10, trait3: -1);
    _AllChamps[11] = ChampPortait(name: 'gangplank', trait1: 17, trait2: 7, trait3: 11);
    _AllChamps[12] = ChampPortait(name: 'garen', trait1: -1, trait2: -1, trait3: -1);
    _AllChamps[13] = ChampPortait(name: 'graves', trait1: 1, trait2: 17, trait3: -1);
    _AllChamps[14] = ChampPortait(name: 'irelia', trait1: 0, trait2: 5, trait3: 9);
    _AllChamps[15] = ChampPortait(name: 'jarvaniv', trait1: 13, trait2: 6, trait3: -1);
    _AllChamps[16] = ChampPortait(name: 'jayce', trait1: 17, trait2: 21, trait3: -1);
    _AllChamps[17] = ChampPortait(name: 'jhin', trait1: 6, trait2: 15, trait3: -1);
    _AllChamps[18] = ChampPortait(name: 'jinx', trait1: 1, trait2: 14, trait3: -1);
    _AllChamps[19] = ChampPortait(name: 'kaisa', trait1: 8, trait2: 20, trait3: -1);
    _AllChamps[20] = ChampPortait(name: 'karma', trait1: 6, trait2: 12, trait3: -1);
    _AllChamps[21] = ChampPortait(name: 'kassadin', trait1: 9, trait2: 3, trait3: -1);
    _AllChamps[22] = ChampPortait(name: 'kayle', trait1: 0, trait2: 20, trait3: -1);
    _AllChamps[23] = ChampPortait(name: 'khazix', trait1: 8, trait2: 22, trait3: -1);
    _AllChamps[24] = ChampPortait(name: 'leona', trait1: 21, trait2: 5, trait3: -1);
    _AllChamps[25] = ChampPortait(name: 'lucian', trait1: 1, trait2: 5, trait3: -1);
    _AllChamps[26] = ChampPortait(name: 'lulu', trait1: 12, trait2: 3, trait3: -1);
    _AllChamps[27] = ChampPortait(name: 'malphite', trait1: 2, trait2: 14, trait3: -1);
    _AllChamps[28] = ChampPortait(name: 'masteryi', trait1: 0, trait2: 14, trait3: -1);
    _AllChamps[29] = ChampPortait(name: 'missfortune', trait1: 1, trait2: 20, trait3: 11);
    _AllChamps[30] = ChampPortait(name: 'mordekaiser', trait1: 6, trait2: 21, trait3: -1);
    _AllChamps[31] = ChampPortait(name: 'neeko', trait1: 13, trait2: 18, trait3: -1);
    _AllChamps[32] = ChampPortait(name: 'poppy', trait1: 21, trait2: 18, trait3: -1);
    _AllChamps[33] = ChampPortait(name: 'rakan', trait1: 13, trait2: 3, trait3: -1);
    _AllChamps[34] = ChampPortait(name: 'rumble', trait1: 7, trait2: 10, trait3: -1);
    _AllChamps[35] = ChampPortait(name: 'shaco', trait1: 6, trait2: 8, trait3: -1);
    _AllChamps[36] = ChampPortait(name: 'shen', trait1: 0, trait2: 4, trait3: -1);
    _AllChamps[37] = ChampPortait(name: 'sona', trait1: 12, trait2: 14, trait3: -1);
    _AllChamps[38] = ChampPortait(name: 'soraka', trait1: 12, trait2: 18, trait3: -1);
    _AllChamps[39] = ChampPortait(name: 'syndra', trait1: 18, trait2: 16, trait3: -1);
    _AllChamps[40] = ChampPortait(name: 'thresh', trait1: 4, trait2: 9, trait3: -1);
    _AllChamps[41] = ChampPortait(name: 'twistedfate', trait1: 4, trait2: 16, trait3: -1);
    _AllChamps[42] = ChampPortait(name: 'lux', trait1: 6, trait2: 16, trait3: -1);
    _AllChamps[43] = ChampPortait(name: 'velkoz', trait1: 22, trait2: 16, trait3: -1);
    _AllChamps[44] = ChampPortait(name: 'vi', trait1: 2, trait2: 5, trait3: -1);
    _AllChamps[45] = ChampPortait(name: 'wukong', trait1: 4, trait2: 21, trait3: -1);
    _AllChamps[46] = ChampPortait(name: 'xayah', trait1: 0, trait2: 3, trait3: -1);
    _AllChamps[47] = ChampPortait(name: 'xerath', trait1: 6, trait2: 16, trait3: -1);
    _AllChamps[48] = ChampPortait(name: 'xinzhao', trait1: 13, trait2: 3, trait3: -1);
    _AllChamps[49] = ChampPortait(name: 'yasuo', trait1: 0, trait2: 14, trait3: -1);
    _AllChamps[50] = ChampPortait(name: 'ziggs', trait1: 14, trait2: 7, trait3: -1);
    _AllChamps[51] = ChampPortait(name: 'zoe', trait1: 18, trait2: 16, trait3: -1);
    _AllChamps[52] = ChampPortait(name: 'fiora', trait1: 0, trait2: 5, trait3: -1);

    

  }
}