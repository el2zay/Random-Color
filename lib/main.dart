import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const TapboxA());
}

var randomColor = Color.fromRGBO(
    Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1.0);
var r = randomColor.red;
var g = randomColor.green;
var b = randomColor.blue;

class TapboxA extends StatefulWidget {
  const TapboxA({Key? key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            Color.fromRGBO(
                r = Random().nextInt(256), // Red color
                g = Random().nextInt(256), // Green color
                b = Random().nextInt(256), // Blue color
                1); // Opacity
          });
        },
        child: MaterialApp(
            home: RawKeyboardListener(
                autofocus: true,
                focusNode: FocusNode(),
                onKey: (event) {
                  if (event.isKeyPressed(LogicalKeyboardKey.space)) {
                    setState(() {
                      Color.fromRGBO(
                          r = Random().nextInt(256), // Red color
                          g = Random().nextInt(256), // Green color
                          b = Random().nextInt(256), // Blue color
                          1); // Opacity
                    });
                  }
                },
                child: Scaffold(
                    backgroundColor: Color.fromRGBO(r, g, b, 1),
                    body: Center(
                        child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              //Centrer le texte
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: InkWell(
                                    //Mettre un padding pour que le texte soit plus visible

                                    child: Text(
                                      'RGB : $r $g $b',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'RobotoLight',
                                        color: _color(),
                                      ),
                                    ),

                                    onTap: () {
                                      Clipboard.setData(
                                          ClipboardData(text: '$r $g $b'));
                                    },
                                    onDoubleTap: () {
                                      launch(
                                          'https://htmlcolorcodes.com/fr/rgb-a-hex/?r=$r&g=$g&b=$b');
                                    },
                                    onLongPress: () {
                                      launch(
                                          'https://htmlcolorcodes.com/fr/rgb-a-hex/?r=$r&g=$g&b=$b');
                                    },
                                  ),
                                )),
                                InkWell(
                                  child: Text(
                                      'HEX : ${r.toRadixString(16) + g.toRadixString(16) + b.toRadixString(16)}'
                                          .replaceAll('ff', '#'),
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'RobotoLight',
                                        color: _color(),
                                      ),
                                      textAlign: TextAlign.center),
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                        text: r.toRadixString(16) +
                                            g.toRadixString(16) +
                                            b
                                                .toRadixString(16)
                                                .replaceAll('ff', '#')));
                                  },
                                  onDoubleTap: () {
                                    launch(
                                        'https://htmlcolorcodes.com/fr/hex-a-rgb/?hex=${r.toRadixString(16) + g.toRadixString(16) + b.toRadixString(16)}'
                                            .replaceAll('ff', ''));
                                  },
                                  onLongPress: () {
                                    launch(
                                        'https://htmlcolorcodes.com/fr/hex-a-rgb/?hex=${r.toRadixString(16) + g.toRadixString(16) + b.toRadixString(16)}'
                                            .replaceAll('ff', ''));
                                  },
                                ),
                              ],
                            )))))));
  }
}

_color() {
  if (r + g + b >= 384) {
    return Colors.black;
  } else {
    return Colors.white;
  }
}
