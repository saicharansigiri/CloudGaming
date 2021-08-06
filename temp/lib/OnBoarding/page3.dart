import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OnPage3 extends StatelessWidget {
  OnPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Stack(
            children: [
              Positioned(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.height * 0.05,
                //bottom: MediaQuery.of(context).size.height * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                ),
              ),
              Positioned(
                child: Image.asset(
                  'assets/images/remote.png',
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.30,
          child: AutoSizeText(
            "WE PROVIDE \n BEST GAMING EXPERIENCE",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient),
          ),
        ),
      ],
    );
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color.fromRGBO(251, 106, 25, 1), Colors.redAccent],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
