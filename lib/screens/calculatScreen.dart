import 'package:calculator/componentes/button.dart';
import 'package:flutter/material.dart';

class calculaScreen extends StatefulWidget {
  const calculaScreen({super.key});

  @override
  State<calculaScreen> createState() => _calculaScreenState();
}

class _calculaScreenState extends State<calculaScreen> {
  String currentInput = '';
  String previoustInput = '';
  String operator = '';
  bool isDecimalEntered = false;
  String output = '';
  void handleNUmberClick({required String number}) {
    if (currentInput.isEmpty) {
      currentInput = number;
    } else {
      currentInput += number;
    }
    setState(() {});
  }

  void calculat() {
    if (currentInput.isNotEmpty && previoustInput.isNotEmpty) {
      double result = 0.0;
      double num1 = 0.0;
      double num2 = 0.0;
      num2 = double.parse(currentInput);
      num1 = double.parse(previoustInput);
      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 != 0) {
            result = num1 / num2;
          } else {
            currentInput = 'Error';
            previoustInput = '';
            operator = '';
            setState(() {});
            return;
          }
          break;
        case '%':
          result = num1 % num2;
          break;
      }

      currentInput = result.toString();
      previoustInput = '';
      operator = '';
      setState(() {});
    }
  }

  void handleoperatorrClick({required String newoperator}) {
    if (previoustInput.isNotEmpty) {
      calculat();
    }
    if (operator.isEmpty) {
      previoustInput = currentInput;
    }
    operator = newoperator;
    currentInput = '';
    setState(() {});
  }

  void back() {
    if (currentInput.isNotEmpty) {
      currentInput = currentInput.substring(0, currentInput.length - 1);
    }
    
    setState(() {});
  }

  void clear() {
    currentInput = '';
    previoustInput = '';
    operator = '';
    setState(() {});
  }

  void handeldecimal() {
    if (!isDecimalEntered) {
      if (!currentInput.contains('.')) {
        currentInput += '.';
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:  Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.withOpacity(0.0),
              Colors.blue.withOpacity(0.4),
              Colors.blue.withOpacity(0.7),
              Colors.blue.withOpacity(0.9),
              Colors.blue.withOpacity(0.9),
              Colors.blue.withOpacity(0.5),
              // Colors.blue.withOpacity(0.10)
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  height: 120,
                  child: Text(
                    previoustInput + operator + currentInput,
                    style: const TextStyle(color: Colors.grey, fontSize: 70),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: 120,
                  child: Text(
                    currentInput,
                    style: const TextStyle(color: Colors.black, fontSize: 70),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    button(
                      color: Colors.white.withOpacity(0.4),
                      onTap: () {
                        clear();
                      },
                      height: 65,
                      width: 70,
                      char: 'Ac',
                      charcolor: Colors.red.withOpacity(0.7),
                    ),
                    button(
                      color: Colors.white.withOpacity(0.4),
                      onTap: () {
                        back();
                      },
                      height: 65,
                      width: 70,
                      char: 'B',
                      charcolor: Colors.blue.withOpacity(0.7),
                    ),
                    button(
                      color: Colors.white.withOpacity(0.4),
                      onTap: () {
                        handleoperatorrClick(newoperator: '/');
                      },
                      height: 65,
                      width: 70,
                      char: '/',
                      charcolor: Colors.blue.withOpacity(0.7),
                    ),
                    button(
                      color: Colors.white.withOpacity(0.4),
                      onTap: () {
                        handleoperatorrClick(newoperator: '*');
                      },
                      height: 65,
                      width: 70,
                      char: '*',
                      charcolor: Colors.blue.withOpacity(0.7),
                    ),
                  ],
                ),
                Row(
                  children: [
                    button(
                      color: Colors.white.withOpacity(0.4),
                      onTap: () {
                        handleNUmberClick(number: '7');
                      },
                      height: 65,
                      width: 70,
                      char: '7',
                      charcolor: Colors.white.withOpacity(0.7),
                    ),
                    button(
                      color: Colors.white.withOpacity(0.4),
                      onTap: () {
                        handleNUmberClick(number: '8');
                      },
                      height: 65,
                      width: 70,
                      char: '8',
                      charcolor: Colors.white.withOpacity(0.7),
                    ),
                    button(
                      color: Colors.white.withOpacity(0.4),
                      onTap: () {
                        handleNUmberClick(number: '9');
                      },
                      height: 65,
                      width: 70,
                      char: '9',
                      charcolor: Colors.white.withOpacity(0.7),
                    ),
                    button(
                      color: Colors.white.withOpacity(0.4),
                      onTap: () {
                        handleoperatorrClick(newoperator: '-');
                      },
                      height: 65,
                      width: 70,
                      char: '-',
                      charcolor: Colors.blue.withOpacity(0.7),
                    ),
                  ],
                ),
                Row(
                  children: [
                    button(
                      onTap: () {
                        handleNUmberClick(number: '4');
                      },
                      height: 65,
                      width: 70,
                      char: '4',
                      color: Colors.white.withOpacity(0.4),
                      charcolor: Colors.white.withOpacity(0.7),
                    ),
                    button(
                      onTap: () {
                        handleNUmberClick(number: '5');
                      },
                      height: 65,
                      width: 70,
                      char: '5',
                      color: Colors.white.withOpacity(0.4),
                      charcolor: Colors.white.withOpacity(0.7),
                    ),
                    button(
                      onTap: () {
                        handleNUmberClick(number: '6');
                      },
                      height: 65,
                      width: 70,
                      char: '6',
                      color: Colors.white.withOpacity(0.4),
                      charcolor: Colors.white.withOpacity(0.7),
                    ),
                    button(
                      onTap: () {
                        handleoperatorrClick(newoperator: '+');
                      },
                      height: 65,
                      width: 70,
                      char: '+',
                      color: Colors.white.withOpacity(0.4),
                      charcolor: Colors.white.withOpacity(0.7),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            button(
                              color: Colors.white.withOpacity(0.4),
                              onTap: () {
                                handleNUmberClick(number: '1');
                              },
                              height: 65,
                              width: 70,
                              char: '1',
                              charcolor: Colors.white.withOpacity(0.7),
                            ),
                            button(
                              color: Colors.white.withOpacity(0.4),
                              onTap: () {
                                handleNUmberClick(number: '2');
                              },
                              height: 65,
                              width: 70,
                              char: '2',
                              charcolor: Colors.white.withOpacity(0.7),
                            ),
                            button(
                              color: Colors.white.withOpacity(0.4),
                              onTap: () {
                                handleNUmberClick(number: '3');
                              },
                              height: 65,
                              width: 70,
                              char: '3',
                              charcolor: Colors.white.withOpacity(0.7),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            button(
                              color: Colors.white.withOpacity(0.4),
                              onTap: () {
                                handleNUmberClick(number: '0');
                              },
                              height: 65,
                              width: 160,
                              char: '0',
                              charcolor: Colors.white.withOpacity(0.7),
                            ),
                            button(
                              color: Colors.white.withOpacity(0.4),
                              onTap: () {
                                handeldecimal();
                              },
                              height: 65,
                              width: 70,
                              char: '.',
                              charcolor: Colors.white.withOpacity(0.7),
                            ),
                          ],
                        ),
                      ],
                    ),
                    button(
                        color: Colors.blue.withOpacity(0.8),
                        onTap: () {
                          calculat();
                        },
                        height: 160,
                        charcolor: Colors.white,
                        width: 70,
                        char: '=')
                  ],
                )
              ],
            ),
          ),
        ),
      
    );
  }
}
