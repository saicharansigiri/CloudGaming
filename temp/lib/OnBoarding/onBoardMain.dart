import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloudgaming/OnBoarding/page1.dart';
import 'package:cloudgaming/OnBoarding/page2.dart';
import 'package:cloudgaming/OnBoarding/page3.dart';
import 'package:cloudgaming/pages/AuthWrapper.dart';
import 'package:flutter/material.dart';

class MyOnBoard extends StatefulWidget {
  const MyOnBoard({Key? key}) : super(key: key);

  @override
  _MyOnBoardState createState() => _MyOnBoardState();
}

class _MyOnBoardState extends State<MyOnBoard> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF000428), Color(0xFF004e92)],
            )),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthWrapper()),
                          (route) => false,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        OnPage1(),
                        OnPage2(),
                        OnPage3(),
                      ],
                      physics: ClampingScrollPhysics(),
                    ),
                  ),
                  _indicator(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _currentPage == 2
                  ? _getStarted()
                  : SizedBox(
                      width: 25,
                      height: 25,
                    ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getStarted() {
    return Container(
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AutoSizeText(
              "Get Started",
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
            Icon(
              Icons.arrow_forward,
              size: 17,
            ),
          ],
        ),
        onPressed: () {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute(builder: (context) => AuthWrapper()),
            (route) => false,
          );
        },
      ),
    );
  }

  Row _indicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          height: 8,
          width: _currentPage == 0 ? 24 : 16,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          duration: Duration(milliseconds: 150),
          child: Container(
            color: _currentPage == 0 ? Colors.red : Colors.white,
            width: 12,
            height: 12,
          ),
        ),
        SizedBox(width: 8),
        AnimatedContainer(
          height: 8,
          width: _currentPage == 1 ? 24 : 16,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          duration: Duration(milliseconds: 150),
          child: Container(
            color: _currentPage == 1 ? Colors.red : Colors.white,
            width: 12,
            height: 12,
          ),
        ),
        SizedBox(width: 8),
        AnimatedContainer(
          height: 8,
          width: _currentPage == 2 ? 24 : 16,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          duration: Duration(milliseconds: 150),
          child: Container(
            color: _currentPage == 2 ? Colors.red : Colors.white,
            width: 12,
            height: 12,
          ),
        ),
      ],
    );
  }
}
