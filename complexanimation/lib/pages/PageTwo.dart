import 'package:complexanimation/provider/offsetNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              // ! this container is holding the background color and the image in center
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(alignment: Alignment.center, children: <Widget>[
                Consumer<OffsetNotifier>(
                  builder: (context, notifier, child) {
                    double multipler;
                    if (notifier.page <= 1.0) {
                      multipler = math.max(0, 4 * notifier.page - 3);
                    } else {
                      multipler = math.max(0, 1 - (4 * notifier.page - 4));
                    }
                    return Transform.scale(
                      scale: multipler,
                      child: child,
                    );
                  },
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
                      double multipler;
                      if (notifier.page <= 1.0) {
                        multipler = math.max(0, 4 * notifier.page - 3);
                      } else {
                        multipler = math.max(0, 1 - (4 * notifier.page - 4));
                      }
                      return Transform.translate(
                        offset: Offset(0, -50 * (1 - multipler)),
                        child: Opacity(
                          opacity: multipler,
                          child: child,
                        ),
                      );
                    },
                    child: Image.asset('assets/images/2.png')),
              ])),
          SizedBox(
            height: 20,
          ),

           /*
               ! the child that will placed here
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
           
        ]);
  }
}
