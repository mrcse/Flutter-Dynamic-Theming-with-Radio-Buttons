import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanetsWeight extends StatefulWidget {
  final String name;
  final String weight;
  final int height;

  PlanetsWeight({@required this.name, @required this.weight, this.height});
  @override
  _PlanetsWeightState createState() =>
      _PlanetsWeightState(name: name, weight: weight, height: height);
}

class _PlanetsWeightState extends State<PlanetsWeight> {
  final String name;
  final String weight;
  final int height;

  _PlanetsWeightState(
      {@required this.name, @required this.weight, this.height});

  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC;
  int radioValue;
  bool switchValue = false;
  double _finalResult = 0.0;
  String _planetName = "Please Select an Option";

  void handleRadioValueChanged(int value) {
    /*
    Source: https://www.livescience.com/33356-weight-on-planets-mars-moon.html
      Mercury: 0.38
Venus: 0.91
Earth: 1.00
Mars: 0.38
Jupiter: 2.34
Saturn: 1.06
Uranus: 0.92
Neptune: 1.19
Pluto: 0.06
     */
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(weight, 0.06);
          _planetName = "Your Weight on Pluto is ";
          break;
        case 1:
          _finalResult = calculateWeight(weight, 0.38);
          _planetName = "Your Weight on Mars is ";

          break;
        case 2:
          _finalResult = calculateWeight(weight, 0.91);
          _planetName = "Your Weight on Vinus is ";
          break;
        case 3:
          _finalResult = calculateWeight(weight, 2.34);
          _planetName = "Your Weight on Jupiter is ";
          break;
        case 4:
          _finalResult = calculateWeight(weight, 0.92);
          _planetName = "Your Weight on Uranus is ";

          break;
        case 5:
          _finalResult = calculateWeight(weight, 1.19);
          _planetName = "Your Weight on Neptune is ";

          break;
        default:
          print("Nothing selected!");
      }

//      print("Value is ${radioValue.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.teal,
        textTheme: TextTheme(
            headline6: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        title: new Text("Weight Calculater"),
      ),
      body: new ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          new Text(
            "WelCome Back",
            style: myFont(),
            textAlign: TextAlign.center,
          ),
          new Text(
            name.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.pacifico(
                fontSize: 44, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          new Text(
            "I am here to Calculate Your Weight on Different Planets :). Please Select an Option",
            textAlign: TextAlign.center,
            style: myFont(),
          ),
          new Padding(padding: new EdgeInsets.all(5.0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //radiobuttons go here
              new Radio<int>(
                  activeColor: Colors.teal,
                  value: 0,
                  groupValue: radioValue,
                  onChanged: handleRadioValueChanged),
              new Text(
                "Pluto",
                style: myFont(),
              ),
              new Radio<int>(
                  activeColor: Colors.teal,
                  value: 1,
                  groupValue: radioValue,
                  onChanged: handleRadioValueChanged),
              new Text(
                "Mars",
                style: myFont(),
              ),
              new Radio<int>(
                  activeColor: Colors.teal,
                  value: 2,
                  groupValue: radioValue,
                  onChanged: handleRadioValueChanged),
              new Text(
                "Venus",
                style: myFont(),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //radiobuttons go here
              new Radio<int>(
                  activeColor: Colors.teal,
                  value: 3,
                  groupValue: radioValue,
                  onChanged: handleRadioValueChanged),
              new Text(
                "Jupiter",
                style: myFont(),
              ),
              new Radio<int>(
                  activeColor: Colors.teal,
                  value: 4,
                  groupValue: radioValue,
                  onChanged: handleRadioValueChanged),
              new Text(
                "Uranus",
                style: myFont(),
              ),
              new Radio<int>(
                  activeColor: Colors.teal,
                  value: 5,
                  groupValue: radioValue,
                  onChanged: handleRadioValueChanged),
              new Text(
                "Neptune",
                style: myFont(),
              ),
            ],
          ),
          new Padding(padding: EdgeInsets.all(20)),
          new Text(
            _planetName,
            textAlign: TextAlign.center,
            style: myFont(),
          ),
          new Text(
            "${_finalResult.toStringAsFixed(1)}",
            textAlign: TextAlign.center,
            style: GoogleFonts.pacifico(
                fontSize: 44, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          new Text(
            "And Unfortunately Your Height will be still $height cm......LoL xD",
            textAlign: TextAlign.center,
            style: myFont(),
          )
        ],
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong!");
      return int.parse("180") * 0.38; // give a default weight! Be creative!
    }
  }

  myFont() {
    return GoogleFonts.lato(
        fontSize: 20, color: Colors.teal, fontWeight: FontWeight.w700);
  }
}
