import 'package:flutter/material.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          title: Text('TicTacToe'),
          backgroundColor: Colors.deepPurple,
        ),
        body: TicTacToePage(),
      ),
    ),
  );
}

class TicTacToePage extends StatefulWidget {
  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  List plist = [];
  List clist = [];
  Random random = Random();
  var xo1 = "     ";
  var xo2 = "     ";
  var xo3 = "     ";
  var xo4 = "     ";
  var xo5 = "     ";
  var xo6 = "     ";
  var xo7 = "     ";
  var xo8 = "     ";
  var xo9 = "     ";

  restart() {
    plist.clear();
    clist.clear();
    xo1 = xo2 = xo3 = xo4 = xo5 = xo6 = xo7 = xo8 = xo9 = "    ";
  }

  endgame(String s, String mes) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "$s",
      desc: "$mes",
      buttons: [
        DialogButton(
            child: Text(
              "Play again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            width: 120,
            onPressed: () {
              setState(() {
                restart();
                Navigator.pop(context);
              });
            })
      ],
    ).show();
  }

  moves(int p) {
    if (plist.contains(p) || clist.contains(p)) {
      print("Nothing Happened");
    } else {
      plist.add(p);
      if (plist.length != 5) {
        var c = random.nextInt(9) + 1;
        while (plist.contains(c) || clist.contains(c)) {
          c = random.nextInt(9) + 1;
        }
        clist.add(c);
      }

      print(plist);
      print(clist);

      pwin(int p, int q, int r) {
        if (plist.contains(p) && plist.contains(q) && plist.contains(r)) {
          endgame('You Won', 'Way to go Champ!');
          clist.removeLast();
        }
      }

      cwin(int a, int b, int c) {
        if (clist.contains(a) && clist.contains(b) && clist.contains(c)) {
          endgame('You Lost', 'Rome wasn\'t built in a day');
        }
      }

      pwin(1, 2, 3);
      pwin(4, 5, 6);
      pwin(7, 8, 9);
      pwin(1, 4, 7);
      pwin(2, 5, 8);
      pwin(3, 6, 9);
      pwin(1, 5, 9);
      pwin(3, 5, 7);

      cwin(1, 2, 3);
      cwin(4, 5, 6);
      cwin(7, 8, 9);
      cwin(1, 4, 7);
      cwin(2, 5, 8);
      cwin(3, 6, 9);
      cwin(1, 5, 9);
      cwin(3, 5, 7);

      if (plist.length == 5 && clist.length == 4) {
        endgame("Tied", "A Good effort tho!");
      }
    }
  }

  omove() {
    if (clist.contains(1)) {
      xo1 = "O";
    }
    if (clist.contains(2)) {
      xo2 = "O";
    }
    if (clist.contains(3)) {
      xo3 = "O";
    }
    if (clist.contains(4)) {
      xo4 = "O";
    }
    if (clist.contains(5)) {
      xo5 = "O";
    }
    if (clist.contains(6)) {
      xo6 = "O";
    }
    if (clist.contains(7)) {
      xo7 = "O";
    }
    if (clist.contains(8)) {
      xo8 = "O";
    }
    if (clist.contains(9)) {
      xo9 = "O";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 80),
                    padding: EdgeInsets.fromLTRB(10, 14, 10, 14),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                    )),
                onPressed: () {
                  moves(1);
                  setState(() {
                    if (plist.contains(1)) {
                      xo1 = "X";
                    }

                    omove();
                  });
                },
                child: Text('$xo1'),
              ),
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 80),
                    padding: EdgeInsets.fromLTRB(10, 14, 10, 14),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                    )),
                onPressed: () {
                  setState(() {
                    moves(2);
                    if (plist.contains(2)) {
                      xo2 = "X";
                    }

                    omove();
                  });
                },
                child: Text('$xo2'),
              ),
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 80),
                    padding: EdgeInsets.fromLTRB(10, 14, 10, 14),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                    )),
                onPressed: () {
                  setState(() {
                    moves(3);
                    if (plist.contains(3)) {
                      xo3 = "X";
                    }
                    omove();
                  });
                },
                child: Text('$xo3'),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 80),
                    padding: EdgeInsets.fromLTRB(10, 14, 10, 14),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                    )),
                onPressed: () {
                  setState(() {
                    moves(4);
                    if (plist.contains(4)) {
                      xo4 = "X";
                    }
                    omove();
                  });
                },
                child: Text('$xo4'),
              ),
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 80),
                    padding: EdgeInsets.fromLTRB(10, 14, 10, 14),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                    )),
                onPressed: () {
                  setState(() {
                    moves(5);
                    if (plist.contains(5)) {
                      xo5 = "X";
                    }
                    omove();
                  });
                },
                child: Text('$xo5'),
              ),
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 80),
                    padding: EdgeInsets.fromLTRB(10, 14, 10, 14),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                    )),
                onPressed: () {
                  setState(() {
                    moves(6);
                    if (plist.contains(6)) {
                      xo6 = "X";
                    }
                    omove();
                  });
                },
                child: Text('$xo6'),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 80),
                    padding: EdgeInsets.fromLTRB(10, 14, 10, 14),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                    )),
                onPressed: () {
                  setState(() {
                    moves(7);
                    if (plist.contains(7)) {
                      xo7 = "X";
                    }
                    omove();
                  });
                },
                child: Text('$xo7'),
              ),
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 80),
                    padding: EdgeInsets.fromLTRB(10, 14, 10, 14),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                    )),
                onPressed: () {
                  setState(() {
                    moves(8);
                    if (plist.contains(8)) {
                      xo8 = "X";
                    }
                    omove();
                  });
                },
                child: Text('$xo8'),
              ),
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 80),
                    padding: EdgeInsets.fromLTRB(10, 14, 10, 14),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                    )),
                onPressed: () {
                  setState(() {
                    moves(9);
                    if (plist.contains(9)) {
                      xo9 = "X";
                    }
                    omove();
                  });
                },
                child: Text('$xo9'),
              ),
            )
          ],
        ),
      ],
    );
  }
}
