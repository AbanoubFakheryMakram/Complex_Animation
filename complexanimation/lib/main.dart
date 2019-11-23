import 'package:complexanimation/pages/FirstPage.dart';
import 'package:complexanimation/pages/PageThree.dart';
import 'package:complexanimation/pages/PageTwo.dart';
import 'package:complexanimation/provider/indexNotifier.dart';
import 'package:complexanimation/provider/offsetNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());






/*
 * 
 * ? >>>>>>>>>>>>>>>> Read Guide class
 * 
 */






class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => OffsetNotifier(pageController),
      child: ChangeNotifierProvider(
        builder: (_) => IndexNotifier(),
        child: Scaffold(
          backgroundColor: Color(0xfff2f2f2),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 22.0, left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Hops',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w800)),
                    Stack(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.shopping_basket),
                          onPressed: () {},
                        ),
                        Positioned(
                          right: 10,
                          bottom: 8,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (pageIndex) {
                    Provider.of<IndexNotifier>(context).index =
                        pageIndex; // give the current page index to index provider
                  },
                  children: <Widget>[
                    FirstPage(),
                    PageTwo(),
                    ThirdPage(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
