import 'package:complexanimation/provider/offsetNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            // ! this container is holding the background color and the image in center
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Consumer<OffsetNotifier>(
                  builder: (context, notifier, child) {
                    return Transform.scale(
                        scale: math.max(0, 1 - (1 - (4 * notifier.page - 7))),
                        child: Opacity(
                          child: child,
                          opacity: math.max(
                            0,
                            math.max(0, 1 - (notifier.page)),
                          ),
                        ));
                  },

                  /*
                      ! the child that placed here
                      just a color background with specific size
                      it's animation is the scale with small opacity
                  */
                  child: Container(
                    width: MediaQuery.of(context).size.width * .7,
                    height: MediaQuery.of(context).size.width * .7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Consumer<OffsetNotifier>(
                  builder: (context, notifier, child) {
                    return Transform(
                      transform: Matrix4.translationValues(
                          0, 100 * (1 - (4 * notifier.page - 7)), 0)
                        ..rotateZ((-math.pi / 2) * 2 * notifier.page),
                      alignment: FractionalOffset.center,
                      child: child,
                    );
                  },

                  /*
                      ! the child that placed here
                      it's animation is the rotation
                  */
                  child: RotatedBox(
                    quarterTurns: 4,
                    child: Image.asset(
                      'assets/images/3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
            /*
                ! the child will placed here
                it's animation is the opacity
            */

// Add some widgets here
          Column(
            children: <Widget>[
              Text('Zumiem',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 26)),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                    'Narrow boards are easier to flip while wider boards are more stable, but there are no hard and fast rules to skateboarding.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
