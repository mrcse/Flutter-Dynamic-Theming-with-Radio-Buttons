import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weight_app/appUI/calculator.dart';

class WeightCal extends StatefulWidget {
  @override
  _WeightCalState createState() => _WeightCalState();
}

class _WeightCalState extends State<WeightCal> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  var height = 160.0;



  @override
  Widget build(BuildContext context) {
    List _list=new List();
    _list=AdaptiveTheme.of(context).getModes;
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.teal,
        textTheme: TextTheme(
            headline6: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        title: new Text("Weight Calculater "),
      ),
      drawer: new SafeArea(
        child: new Drawer(
            child: new ListView(
          children: [
            new DrawerHeader(
                child: new Container(
              width: 20,
              height: 20,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(color: Colors.teal),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_960_720.jpg'),
                      fit: BoxFit.contain)),
            )),
            new SizedBox(
              height: 16,
              child: new Divider(
                color: Colors.teal,
              ),
            ),
            new ListTile(
              title: new Text(
                "Select Theme",
                style: new TextStyle(fontSize: 18),
              ),
              onTap: () => debugPrint("Theme"),
            ),
            new ListTile(
              title: new Text("Default"),
              leading: _list[0]
                  ? Icon(
                      Icons.radio_button_on,
                      color: Colors.teal,
                    )
                  : Icon(
                      Icons.radio_button_off,
                      color: Colors.teal,
                    ),
              onTap: () {
                setState(() {

                  AdaptiveTheme.of(context).setSystem();
                  debugPrint("${AdaptiveTheme.of(context)}");
                  Navigator.pop(context);
                });
              },
            ),
            new ListTile(
              title: new Text("Light Mode"),
              leading: _list[1]
                  ? Icon(Icons.radio_button_on, color: Colors.teal)
                  : Icon(
                      Icons.radio_button_off,
                      color: Colors.teal,
                    ),
              onTap: () {
                setState(() {

                  AdaptiveTheme.of(context).setLight();
                  debugPrint("${AdaptiveTheme.of(context)}");
                  Navigator.pop(context);
                });
              },
            ),
            new ListTile(
              title: new Text("Dark Mode"),
              leading: _list[2]
                  ? Icon(
                      Icons.radio_button_on,
                      color: Colors.teal,
                    )
                  : Icon(
                      Icons.radio_button_off,
                      color: Colors.teal,
                    ),
              onTap: () {
                setState(() {

                  AdaptiveTheme.of(context).setDark();
                  Navigator.pop(context);


                });
              },
            )
          ],
        )),
      ),
      body: new ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          new Text(
            "WelCome",
            textAlign: TextAlign.center,
            style: GoogleFonts.pacifico(
                fontSize: 44, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          new Text("Please Enter Your Information",
              textAlign: TextAlign.center, style: myFont()),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Column(
                children: [
                  new TextField(
                    controller: _nameController,
                    style: myFont(),
                    cursorColor: Colors.teal,
                    decoration: new InputDecoration(
                        labelText: "Enter Your Name",
                        hintText: "e.g Jamshid Ali",
                        icon: new Icon(
                          Icons.person_outline,
                          color: Colors.teal,
                          size: 30,
                        )),
                  ),
                  new SizedBox(
                    height: 20,
                  ),
                  new TextField(
                    controller: _weightController,
                    style: myFont(),
                    cursorColor: Colors.teal,
                    decoration: new InputDecoration(
                        labelText: "Weight on Earth(kg)",
                        hintText: "e.g 65",
                        icon: new Icon(
                          Icons.subject_outlined,
                          color: Colors.teal,
                          size: 30,
                        )),
                  ),
                  new SizedBox(
                    height: 20,
                  ),
                  new Text(
                    "Height",
                    style: myFont(),
                    textAlign: TextAlign.left,
                  ),
                  new Text(
                    "${height.round()} cm",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pacifico(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                  ),
                  new Slider(
                    value: height.toDouble(),
                    min: 80.0,
                    max: 260.0,
                    activeColor: Colors.teal,
                    inactiveColor: Colors.teal.shade100,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                  new Container(
                    height: 60,
                    width: 300,
                    padding: EdgeInsets.only(top: 15),
                    margin: EdgeInsets.only(left: 30, right: 30, top: 40),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        gradient: LinearGradient(
                          colors: [
                            Colors.teal,
                            Colors.teal,
                            Colors.teal.shade400,
                            Colors.teal.shade100
                          ],
                          begin: Alignment.centerLeft,
                        )),
                    child: new GestureDetector(
                      onTap: () {
                        if (_nameController.text.isEmpty ||
                            _weightController.text.isEmpty) {
                          debugPrint("${_nameController.text}\n");
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PlanetsWeight(
                              name: _nameController.text,
                              weight: _weightController.text,
                              height: height.round(),
                            );
                          }));
                        }
                      },
                      child: new Text(
                        "Calculate",
                        textAlign: TextAlign.center,
                        style:
                            GoogleFonts.lato(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  new Container(
                    height: 60,
                    width: 300,
                    padding: EdgeInsets.only(top: 15),
                    margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        gradient: LinearGradient(
                          colors: [
                            Colors.teal,
                            Colors.teal,
                            Colors.teal.shade400,
                            Colors.teal.shade100
                          ],
                          begin: Alignment.centerLeft,
                        )),
                    child: new GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: new Text(
                        "Exit",
                        textAlign: TextAlign.center,
                        style:
                            GoogleFonts.lato(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  myFont() {
    return GoogleFonts.lato(
        fontSize: 20, color: Colors.teal, fontWeight: FontWeight.w700);
  }
}
