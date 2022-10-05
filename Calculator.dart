import 'package:flutter.dart';

class Calculator extends StatefulWidget {
    const Calculator({Key? key}) : super(key: key);

    @override
    State<Calculator> createState() => _Calculator();
}

class _CalculatorState extends State<Calculator> {
    Widget numButton(String btnText, Color btnColor, Color txtColor) {
        return ElevateButton(
            onPressed: () {
                calculate(btnText);
            },
            child: Text(
                btnText,
                style: TextStyle(
                    fontSize: 30,
                    color: txtColor,
                ),
            ),
            style: ElevateButton.styleFrom(
                fixedSize: Size(70, 70),
                shape: Circleborder(),
                primary: btnColor,
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                tittle: Text("Calculator"),
                backgroundColor: Colors.black,
            ),
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                    mainAxisAlignment: mainAxisAlignment.end,
                    children: [
                        Row(
                            mainAxisAlignment: mainAxisAlignment.end,
                            children: [
                                Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                        text,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.white, fontSize: 80),
                                    ),
                                ),
                            ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                numButton("C", Colors.grey, Colors.black),
                                numButton("+/-", Colors.grey, Colors.black),
                                numButton("%", Colors.grey, Colors.black),
                                numButton("/", Colors.grey, Colors.black),
                            ],
                        ),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                numButton("7", (Colors.grey[850])!, Colors.white),
                                numButton("8", (Colors.grey[850])!, Colors.white),
                                numButton("9", (Colors.grey[850])!, Colors.white),
                                numButton("x", Colors.orange, Colors.white),
                            ],
                        ),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                                numButton("4", (Colors.grey[850])!, Colors.white),
                                numButton("5", (Colors.grey[850])!, Colors.white),
                                numButton("6", (Colors.grey[850])!, Colors.white),
                                numButton("-", Colors.orange, Colors.white),
                            ],
                        ),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                                numButton("1", (Colors.grey[850])!, Colors.white),
                                numButton("2", (Colors.grey[850])!, Colors.white),
                                numButton("3", (Colors.grey[850])!, Colors.white),
                                numButton("+", Colors.orange, Colors.white),
                            ],
                        ),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                ElevateButton(
                                    onPressed: () {},
                                    child: Padding(
                                        padding: const EdgeInsets.formLTRB(28, 12, 90, 12),
                                        child: Text(
                                            "0",
                                            style: TextStyle(
                                                fontSize:35,
                                                color: Colors.white,
                                            ),
                                        ),
                                    ),
                                    style: ElevateButton.styleFrom(
                                        shape: StadiumBorder(),
                                        primary: (colors.grey[850])!,
                                    ),
                                ),
                                numButton(".", (colors.grey[850])!, Colors.white),
                                numButton("=", Colors.orange,Colors.white),
                            ],
                        ),
                        SizedBox(height: 10),
                    ],
                ),            
            ),
        ),
    },
},

int firstNumber = 0,
int secondNumber = 0,
String result = "",
String operation ="",

void calculate(String btnText) {
    if (btnText == "C") {
        result = "";
        text = "";
        firstNumber = 0;
        secondNumber = 0;
    } else if (btnText == "+" ||
    btnText == "-" ||
    btnText == "x" ||
    btnText == "/") {
        firstNumber = int.parse(text),
        result = "";
        operation = btnText;
    } else if (btnText == "=") {
        secondNumber = int.parse(text);
        if (operation == "+") {
            result = (firstNumber + secondNumber).toString();
        }
        if (operation == "-") {
            result = (firstNumber - secondNumber).toString();
        }
        if (operation == "x"){
            result = (firstNumber * secondNumber).toString();
        }
        if (operation == "/") {
            result = (firstNumber ~/ secondNumber).toString();
        }
    } else {
        result = int.parse(text + btnText).toString();
    }

    setState(() {
        text = result;
    });
}