import 'package:calculator_project/Style/colors.dart';
import 'package:calculator_project/Views/home_page.dart';
import 'package:flutter/material.dart';

class Operations {
  HomePage home = HomePage();
  Color? clear = DefaultColors.clear;
  Color? Operation = DefaultColors.Operation;
  Color? font = DefaultColors.font;
  Color? background = DefaultColors.background;
  void calculationOp() {
    String results = "";
    List<double> nums = [];
    List<String> listNumbers = [];
    double res = 0;
    home.listNum = HomePage.con.text;
    for (int i = 0; i < home.listNum.length; i++) {
      if (home.listNum[i] == '%' ||
          home.listNum[i] == '÷' ||
          home.listNum[i] == '×' ||
          home.listNum[i] == '-' ||
          home.listNum[i] == '+') {
        results += 'o';
      } else {
        results += home.listNum[i];
      }
    }
    listNumbers = results.split('o');
    listNumbers.forEach((element) {
      nums.add(double.parse(element));
    });
    for (int i = 0; i < nums.length - 1; i++) {
      if (i == 0) {
        res = nums[i];
      }
      switch (home.listOp[i]) {
        case '%':
          {
            res = (res / 100) * nums[i + 1];
            break;
          }
        case '÷':
          {
            res = res / nums[i + 1];
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
    HomePage.conRes.text = res.toString();
  }

  void ColorOp(dynamic x) {
    home.firstValue = x;
    switch (home.firstValue) {
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
  }
}
