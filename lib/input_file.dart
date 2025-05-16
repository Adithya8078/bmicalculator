import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helo_world/calculatior.dart';
import 'package:helo_world/resultpage.dart';
import 'Appdataaa.dart';
import 'resuabledata.dart';
import 'bottom.dart';

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

const reusablecolor = Color(0xFF111328);
const newcolor = Color(0xFF1D1F33);

class _MyappState extends State<Myapp> {
  @override
  int height = 180;
  int weight = 75;
  int age = 15;
  Color malecolor = reusablecolor;
  Color femalecolor = reusablecolor;
  void usecolor(int gender) {
    if (gender == 1) {
      if (malecolor == reusablecolor) {
        malecolor = newcolor;
        femalecolor = reusablecolor;
      } else {
        malecolor = reusablecolor;
      }
    }
    if (gender == 2) {
      if (femalecolor == reusablecolor) {
        femalecolor = newcolor;
        malecolor = reusablecolor;
      } else {
        femalecolor = reusablecolor;
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          usecolor(1);
                        });
                      },
                      child: Reusable(
                        cardchild: Appnew(
                          poda: FontAwesomeIcons.mars,
                          data: 'Male',
                        ),
                        kcolor: malecolor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          usecolor(2);
                        });
                      },
                      child: Reusable(
                        cardchild: Appnew(
                          poda: FontAwesomeIcons.venus,
                          data: 'Female',
                        ),
                        kcolor: femalecolor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Reusable(
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Center(
                    child: Text(
                      "Height",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 50.0),
                      ),
                      Text("cm"),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0)),
                    child: Slider(
                      value: height.toDouble(),
                      max: 210,
                      min: 90,
                      activeColor: Colors.greenAccent,
                      inactiveColor: Colors.grey,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              kcolor: reusablecolor,
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Reusable(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 50.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    kcolor: reusablecolor,
                  )),
                  Expanded(
                      child: Reusable(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 50,
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ])
                      ],
                    ),
                    kcolor: reusablecolor,
                  ))
                ],
              ),
            ),
            Bottombutton(
              data: 'Calculate',
              onpressed: () {
                Calculator calc=Calculator(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Resultpage(
                    actualbmiresultvalue: calc.bmicalculator(),
                    bmiresult: calc.getresult(),
                    interpretation: calc.giveoutput(),
                  )),
                );
              },
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onpressed});
  final IconData icon;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF1A1D3E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}
