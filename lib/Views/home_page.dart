import 'package:calculator_project/Views/units_converter_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/button.dart';
import '../Widgets/drop_down_items.dart';
import '../Style/colors.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePage();
}

class HomePage extends State<MyHomePage> {
  Color? clear = DefaultColors.clear;
  Color? Operation = DefaultColors.Operation;
  Color? font = DefaultColors.font;
  Color? background = DefaultColors.background;
  dynamic firstValue = "Color";
  String listNum = "";
  String op = "";
  List<String> listOp = [];
  static TextEditingController con = TextEditingController();
  static TextEditingController conRes = TextEditingController();
  void calculationOp() {
    bool isNegative = false;
    String results = "";
    List<num> nums = [];
    List<String> listNumbers = [];
    num res = 0;
    listNum = con.text;
    for (int i = 0; i < listNum.length; i++) {
      if (i == 0 && listNum[i] == '-') {
        isNegative = true;
        results = '0' + 'o';
      } else {
        if (listNum[i] == '%' ||
            listNum[i] == '÷' ||
            listNum[i] == '×' ||
            listNum[i] == '-' ||
            listNum[i] == '+') {
          results += 'o';
        } else {
          results += listNum[i];
        }
      }
    }
    listNumbers = results.split('o');
    listNumbers.forEach((element) {
      nums.add(num.parse(element));
    });
    for (int i = 0; i < nums.length - 1; i++) {
      if (i == 0) {
        if (isNegative) {
          res = -1 * nums[i];
        } else {
          res = nums[i];
        }
      }
      switch (listOp[i]) {
        case '%':
          {
            res = (res / 100) * nums[i + 1];
            res = num.parse(res.toStringAsFixed(10));
            break;
          }
        case '÷':
          {
            res = res / nums[i + 1];
            res = num.parse(res.toStringAsFixed(10));
            break;
          }
        case '×':
          {
            res = res * nums[i + 1];
            break;
          }
        case '-':
          {
            res = res - nums[i + 1];
            break;
          }
        case '+':
          {
            res = res + nums[i + 1];
            break;
          }
      }
    }
    conRes.text = res.toString();
  }

  void ColorOp(dynamic x) {
    firstValue = x;
    switch (firstValue) {
      case "Color":
        {
          font = DefaultColors.font;
          background = DefaultColors.background;
          Operation = DefaultColors.Operation;
          clear = DefaultColors.clear;
          break;
        }

      case "Blue":
        {
          font = MyColors.blueFontColor;
          background = MyColors.blueBackgroundColor;
          Operation = MyColors.blueOperationColor;
          clear = MyColors.blueClearColor;
          break;
        }
      case "Green":
        {
          font = MyColors.greenFontColor;
          background = MyColors.greenBackgroundColor;
          Operation = MyColors.greenOperationColor;
          clear = MyColors.greenClearColor;
          break;
        }
      case "Red":
        {
          font = MyColors.redFontColor;
          background = MyColors.redBackgroundColor;
          Operation = MyColors.redOperationColor;
          clear = MyColors.redClearColor;
          break;
        }
      case "Yellow":
        {
          font = MyColors.yellowFontColor;
          background = MyColors.yellowBackgroundColor;
          Operation = MyColors.yellowOperationColor;
          clear = MyColors.yellowClearColor;
          break;
        }
      case "Purple":
        {
          font = MyColors.purpleFontColor;
          background = MyColors.purpleBackgroundColor;
          Operation = MyColors.purpleOperationColor;
          clear = MyColors.purpleClearColor;
          break;
        }
      case "Orange":
        {
          font = MyColors.orangeFontColor;
          background = MyColors.orangeBackgroundColor;
          Operation = MyColors.orangeOperationColor;
          clear = MyColors.orangeClearColor;
          break;
        }
      case "Teal":
        {
          font = MyColors.tealFontColor;
          background = MyColors.tealBackgroundColor;
          Operation = MyColors.tealOperationColor;
          clear = MyColors.tealClearColor;
          break;
        }
      case "Grey":
        {
          font = MyColors.greyFontColor;
          background = MyColors.greyBackgroundColor;
          Operation = MyColors.greyOperationColor;
          clear = MyColors.greyClearColor;
          break;
        }
    }
    setState(() {
      UnitsColors.unitsFontColor = font!;
      UnitsColors.unitsBackgroundColor = background!;
      UnitsColors.unitsOperationColor = Operation!;
      UnitsColors.unitsClearColor = clear!;
      setcolors();
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getColors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
            bottom: MediaQuery.of(context).size.height * 0.035),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.10),
              child: TextField(
                controller: con,
                keyboardType: TextInputType.none,
                decoration: InputDecoration(border: InputBorder.none),
                style: TextStyle(
                  fontSize: 50,
                  color: font,
                ),
                cursorHeight: 50,
                textAlign: TextAlign.right,
                cursorColor: font,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.015,
                  right: MediaQuery.of(context).size.width * 0.10),
              child: TextField(
                controller: conRes,
                enabled: false,
                readOnly: true,
                keyboardType: TextInputType.none,
                decoration: InputDecoration(border: InputBorder.none),
                style: TextStyle(
                  fontSize: 20,
                  color: Operation,
                ),
                cursorHeight: 20,
                textAlign: TextAlign.right,
                cursorColor: Operation,
              ),
            ),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.025,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.40),
                          color: UnitsColors.unitsBackgroundColor),
                      child: Center(
                        child: DropdownButton(
                          alignment: AlignmentDirectional.center,
                          icon: Icon(Icons.arrow_drop_down_rounded,
                              color: Colors.black),
                          dropdownColor: UnitsColors.unitsBackgroundColor,
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.15),
                          underline: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                          ),
                          value: firstValue,
                          items: [
                            DropdownMenuItem(
                              child: DropDownItems(title: "Color"),
                              value: "Color",
                            ),
                            DropdownMenuItem(
                              child: DropDownItems(title: "Blue"),
                              value: "Blue",
                            ),
                            DropdownMenuItem(
                                child: DropDownItems(title: "Green"),
                                value: "Green"),
                            DropdownMenuItem(
                                child: DropDownItems(title: "Red"),
                                value: "Red"),
                            DropdownMenuItem(
                                child: DropDownItems(title: "Yellow"),
                                value: "Yellow"),
                            DropdownMenuItem(
                                child: DropDownItems(title: "Purple"),
                                value: "Purple"),
                            DropdownMenuItem(
                                child: DropDownItems(title: "Orange"),
                                value: "Orange"),
                            DropdownMenuItem(
                                child: DropDownItems(title: "Teal"),
                                value: "Teal"),
                            DropdownMenuItem(
                                child: DropDownItems(title: "Grey"),
                                value: "Grey"),
                          ],
                          onChanged: (v) {
                            setState(() {
                              ColorOp(v);
                            });
                          },
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.025),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Converter()));
                        });
                      },
                      child: Center(
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Text("Units Converter",
                            style: TextStyle(
                                color: Color.fromARGB(255, 53, 53, 53),
                                fontSize: 17.5,
                                fontWeight: FontWeight.bold)),
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            color: UnitsColors.unitsBackgroundColor,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.35)),
                      ))),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
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
                        setState(() {
                          listNum = "";
                          listOp = [];
                          con.clear();
                          conRes.clear();
                        });
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
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.50),
                      onTap: () {
                        setState(() {
                          con.text += "(";
                        });
                      },
                      child: Center(
                        child: Tooltip(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(185, 0, 0, 0),
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.05)),
                          message: 'Brackets',
                          child: Button(
                            "()",
                            UnitsColors.unitsOperationColor,
                            UnitsColors.unitsBackgroundColor,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.50),
                      onTap: () {
                        setState(() {
                          listNum = con.text;
                          op = "%";
                          con.text += "%";
                          listOp.add(op);
                        });
                      },
                      child: Center(
                        child: Tooltip(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(185, 0, 0, 0),
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.05)),
                          message: 'Percentage',
                          child: Button(
                            "%",
                            UnitsColors.unitsOperationColor,
                            UnitsColors.unitsBackgroundColor,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.50),
                      onTap: () {
                        setState(() {
                          listNum = con.text;
                          op = "÷";
                          con.text += "÷";
                          listOp.add(op);
                        });
                      },
                      child: Center(
                        child: Tooltip(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(185, 0, 0, 0),
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.05)),
                          message: 'Division',
                          child: Button(
                            "÷",
                            UnitsColors.unitsOperationColor,
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
                        setState(() {
                          con.text += "7";
                        });
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
                        setState(() {
                          con.text += "8";
                        });
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
                        setState(() {
                          con.text += "9";
                        });
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
                        setState(() {
                          listNum = con.text;
                          op = "×";
                          con.text += "×";
                          listOp.add(op);
                        });
                      },
                      child: Center(
                        child: Tooltip(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(185, 0, 0, 0),
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.05)),
                          message: 'Multiplication',
                          child: Button(
                            "×",
                            UnitsColors.unitsOperationColor,
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
                        setState(() {
                          con.text += "4";
                        });
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
                        setState(() {
                          con.text += "5";
                        });
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
                        setState(() {
                          con.text += "6";
                        });
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
                        setState(() {
                          listNum = con.text;
                          op = "-";
                          con.text += "-";
                          listOp.add(op);
                        });
                      },
                      child: Center(
                        child: Tooltip(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(185, 0, 0, 0),
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.05)),
                          message: 'Minus',
                          child: Button(
                            "-",
                            UnitsColors.unitsOperationColor,
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
                        setState(() {
                          con.text += "1";
                        });
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
                        setState(() {
                          con.text += "2";
                        });
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
                        setState(() {
                          con.text += "3";
                        });
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
                        setState(() {
                          listNum = con.text;
                          op = "+";
                          con.text += "+";
                          listOp.add(op);
                        });
                      },
                      child: Center(
                        child: Tooltip(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(185, 0, 0, 0),
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.05)),
                          message: 'Plus',
                          child: Button(
                            "+",
                            UnitsColors.unitsOperationColor,
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
                        setState(() {
                          listNum = con.text;
                          op = "-";
                          con.text += "-";
                          listOp.add(op);
                        });
                      },
                      child: Center(
                          child: Tooltip(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(185, 0, 0, 0),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.05)),
                        message: 'Negative',
                        child: Button(
                          "+/-",
                          UnitsColors.unitsFontColor,
                          UnitsColors.unitsBackgroundColor,
                        ),
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
                        setState(() {
                          con.text += "0";
                        });
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
                        setState(() {
                          con.text += ".";
                        });
                      },
                      child: Center(
                          child: Tooltip(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(185, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width *
                                          0.05)),
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
                        setState(() {
                          calculationOp();
                        });
                      },
                      child: Center(
                        child: Tooltip(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(185, 0, 0, 0),
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.05)),
                          message: 'Equal',
                          child: Button(
                            "=",
                            Colors.white,
                            UnitsColors.unitsOperationColor,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void setcolors() async {
  int font = UnitsColors.unitsFontColor.value;
  int background = UnitsColors.unitsBackgroundColor.value;
  int clear = UnitsColors.unitsClearColor.value;
  int operation = UnitsColors.unitsOperationColor.value;
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setInt('font', font);
  pref.setInt('background', background);
  pref.setInt('clear', clear);
  pref.setInt('operation', operation);
}

void getColors() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  UnitsColors.unitsFontColor = pref.getInt('font') as Color;
  UnitsColors.unitsBackgroundColor = pref.getInt('background') as Color;
  UnitsColors.unitsClearColor = pref.getInt('clear') as Color;
  UnitsColors.unitsOperationColor = pref.getInt('operation') as Color;
}
