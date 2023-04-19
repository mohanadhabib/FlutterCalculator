import 'package:calculator_project/Widgets/special_button.dart';
import 'package:flutter/material.dart';
import '../Style/colors.dart';
import '../Widgets/button.dart';

class UnitsConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(scaffoldBackgroundColor: ThemeColors.lightTheme),
      darkTheme: ThemeData(scaffoldBackgroundColor: ThemeColors.darkTheme),
      debugShowCheckedModeBanner: false,
      home: Converter(),
      title: 'Units Converter',
    );
  }
}

class Converter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ConverterOfUnits();
}

class ConverterOfUnits extends State<Converter> {
  Color? clear = DefaultColors.clear;
  Color? Operation = DefaultColors.Operation;
  Color? font = DefaultColors.font;
  Color? background = DefaultColors.background;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.055,
            bottom: MediaQuery.of(context).size.height * 0.035),
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.05),
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: MediaQuery.of(context).size.width * 0.075,
                    color: MyColors.greyFontColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03),
                child: Text(
                  "Units Converter",
                  style: TextStyle(
                    color: MyColors.greyFontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                        child: Button("7", UnitsColors.unitsFontColor,
                            UnitsColors.unitsBackgroundColor)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                        child: Button("8", UnitsColors.unitsFontColor,
                            UnitsColors.unitsBackgroundColor)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                        child: Button("9", UnitsColors.unitsFontColor,
                            UnitsColors.unitsBackgroundColor)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                      child: Tooltip(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(185, 0, 0, 0),
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.05)),
                          message: 'Remove',
                          child: SpecialButton(
                              Icon(Icons.remove_circle_rounded,
                                  color: UnitsColors.unitsOperationColor,
                                  size: 35),
                              UnitsColors.unitsOperationColor,
                              UnitsColors.unitsBackgroundColor)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.014),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                        child: Button("4", UnitsColors.unitsFontColor,
                            UnitsColors.unitsBackgroundColor)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                        child: Button("5", UnitsColors.unitsFontColor,
                            UnitsColors.unitsBackgroundColor)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                        child: Button("6", UnitsColors.unitsFontColor,
                            UnitsColors.unitsBackgroundColor)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                      child: Tooltip(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(185, 0, 0, 0),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.05)),
                        message: 'Clear',
                        child: Button(
                          "C",
                          UnitsColors.unitsClearColor,
                          UnitsColors.unitsBackgroundColor,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.014),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                        child: Button("1", UnitsColors.unitsFontColor,
                            UnitsColors.unitsBackgroundColor)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                        child: Button("2", UnitsColors.unitsFontColor,
                            UnitsColors.unitsBackgroundColor)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                        child: Button("3", UnitsColors.unitsFontColor,
                            UnitsColors.unitsBackgroundColor)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                      child: Tooltip(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(185, 0, 0, 0),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.05)),
                        message: 'Upward',
                        child: SpecialButton(
                          Icon(Icons.arrow_upward,
                              color: UnitsColors.unitsOperationColor, size: 35),
                          UnitsColors.unitsOperationColor,
                          UnitsColors.unitsBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                        child: Tooltip(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(185, 0, 0, 0),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.05)),
                      message: 'Negative',
                      child: Button("+/-", UnitsColors.unitsFontColor,
                          UnitsColors.unitsBackgroundColor),
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                        child: Button("0", UnitsColors.unitsFontColor,
                            UnitsColors.unitsBackgroundColor)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                        child: Tooltip(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(185, 0, 0, 0),
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.05)),
                            message: 'Point',
                            child: Button(".", UnitsColors.unitsFontColor,
                                UnitsColors.unitsBackgroundColor))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.50),
                    onTap: () {
                      setState(() {});
                    },
                    child: Center(
                      child: Tooltip(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(185, 0, 0, 0),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.05)),
                        message: 'Downward',
                        child: SpecialButton(
                          Icon(Icons.arrow_downward,
                              color: UnitsColors.unitsOperationColor, size: 35),
                          UnitsColors.unitsOperationColor,
                          UnitsColors.unitsBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
