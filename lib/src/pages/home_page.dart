import 'package:flutter/material.dart';

import 'package:swipedetector/swipedetector.dart';
import 'package:swipedetector/swipedetector.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isOpenNav = false;
  double _marginHorizontal = 100.0;
  double _marginVertical = 30.0;
  bool _swipeDownAction = false;
  double _height = 80;
  double _width = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Center(
            child: Column(
          children: [Text('Hola')],
        )),
        bottomNavigationBar: SwipeDetector(
            onSwipeDown: _isOpenNav ? _onSwipeDown : null,
            swipeConfiguration: SwipeConfiguration(
              verticalSwipeMinVelocity: 100.0,
              verticalSwipeMinDisplacement: 50.0,
              verticalSwipeMaxWidthThreshold:100.0,
            ),
            child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInCubic,
                height: _height,
                width: _width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.0),
                    color: Color(0xFF4C65F6),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFAE52FF),
                          Color(0xFF4C65F6),
                        ])),
                margin:
                    EdgeInsets.symmetric(horizontal: _marginHorizontal, vertical: _marginVertical),
                child: (_isOpenNav) ? _contentCardNav() : _contentBottomNav())));
  }

  Widget _contentBottomNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.copy,
          color: Colors.white,
        ),
        RawMaterialButton(
            onPressed: _openNav,
            constraints: BoxConstraints.expand(width: 50.0, height: 50.0),
            child: Icon(
              Icons.arrow_upward,
              size: 30.0,
            ),
            fillColor: Colors.white,
            shape: CircleBorder()),
        CircleAvatar(
          backgroundImage: AssetImage('assets/img/person4.png'),
        )
      ],
    );
  }

  Widget _contentCardNav() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Expanded(
            child: Container(
          height: 170,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image(image: AssetImage('assets/img/img2.png'), height: 160),
              )
            ],
          ),
        )),
        Expanded(
            child: Column(
          children: [
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'List Country',
                    style: TextStyle(color: Colors.white24, fontSize: 18.0),
                  )),
            ),
            Expanded(
              child: Text(
                'Bloody Tear',
                style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            )
          ],
        )),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.shuffle,
                  color: Colors.white,
                  size: 36,
                ),
                Icon(Icons.pause, color: Colors.white, size: 36),
                Icon(Icons.repeat, color: Colors.white, size: 36),
              ],
            ))
          ],
        ))
      ],
    );
  }

  _openNav() {
    setState(() {
      _isOpenNav = true;
      _swipeDownAction = true;
      _marginHorizontal = 0;
      _marginVertical = 0;
      _height = 400;
      _width = 400;
    });
  }

  _onSwipeDown() {
    setState(() {
      _isOpenNav = false;
      _swipeDownAction = false;
      _marginHorizontal = 100.0;
      _marginVertical = 30.0;
      _height = 80;
      _width = 200;
    });
  }
}
