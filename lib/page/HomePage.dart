import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gz_consultancy/globals/globals.dart' as globals;
import 'package:gz_consultancy/hexColor/hexColor.dart';
import 'package:gz_consultancy/widgets/NavigationDrawerWidget/NavigationDrawerWidget.dart';
import 'package:gz_consultancy/widgets/other/MyCustomScrollBehavior.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Timer? _timer;
  int _k = 0;
  final int _animationDuration = 4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _distAnimation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height11 = MediaQuery.of(context).size.height * 0.1;
    double height80 = MediaQuery.of(context).size.height * 0.80;
    double height82 = MediaQuery.of(context).size.height * 0.82;
    double width3 = MediaQuery.of(context).size.width * 0.03;
    double width5 = MediaQuery.of(context).size.width * 0.05;
    double width100 = MediaQuery.of(context).size.width * 1;

    Animation distAnimation = Tween(begin: 4.0, end: 20.0).animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.easeIn));
    if (_k % 2 == 0) {
      _animationController!.forward();
    } else {
      _animationController!.reverse();
    }
    return AnimatedBuilder(
        animation: _animationController!,
        builder: (BuildContext context, widget) {
          return Scaffold(
            drawer: NavigationDrawerWidget(distAnimation: distAnimation),
            backgroundColor: HexColor('#101010'),
            body:
                /////////////////////////////////////
                //Desktop//
                /////////////////////////////////////
                Builder(builder: (context) {
              return Column(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: HexColor('#FFFFFFFF'),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(12.0),
                        bottomLeft: Radius.circular(12.0),
                      ),
                    ),
                    child: ScrollConfiguration(
                      behavior: MyCustomScrollBehavior(),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: ScrollController(),
                        child: SizedBox(
                          width: width100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset(
                                    'Assets/HomePage/gzLogo.png',
                                    fit: BoxFit.contain,
                                    height: height11,
                                    width: 150,
                                  ),
                                ],
                              ),
                              // TabBar Button
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 520,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            'Home',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700,
                                              fontSize: 28,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: const Text(
                                            'Contacts',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: const Text(
                                            'Services',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () =>
                                              Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  '/AboutPage',
                                                  (route) => false),
                                          child: const Text(
                                            'About',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Scaffold.of(context).openDrawer();
                                          },
                                          child: const Center(
                                            child: Icon(
                                              Icons.menu,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width3,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: distAnimation.value,
                  ),
                  // SizedBox(
                  //   height: _dist,
                  // ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(32.0),
                        topLeft: Radius.circular(32.0),
                      ),
                      child: SizedBox(
                        height: height80 + distAnimation.value,
                        width: width100 - distAnimation.value,
                        child: ScrollConfiguration(
                          behavior: MyCustomScrollBehavior(),
                          child: ListView(
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(32.0),
                                    topLeft: Radius.circular(32.0),
                                    bottomRight: Radius.circular(32.0),
                                    bottomLeft: Radius.circular(32.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        'Assets/HomePage/finance.jpeg',
                                        fit: BoxFit.cover,
                                        height: height80 + distAnimation.value,
                                        width:
                                            width100 * 1 - distAnimation.value,
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        height: height80 + distAnimation.value,
                                        width: width100 - distAnimation.value,
                                        padding: EdgeInsets.only(
                                          left: width5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: distAnimation.value,
                              ),
                              Container(
                                height: 600,
                                width: width100,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(8.0),
                                child: ScrollConfiguration(
                                  behavior: MyCustomScrollBehavior(),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    controller: ScrollController(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 600,
                                          width: 400,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            color: Colors.grey.shade100,
                                          ),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                child: Image.asset(
                                                  'Assets/HomePage/gzLogo.png',
                                                  height: 400,
                                                  width: 400,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Center(
                                                  child: Text(
                                                    "Create Web",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: distAnimation.value,
                                        ),
                                        Container(
                                          height: 600,
                                          width: 500,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            color: Colors.grey.shade100,
                                          ),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                child: Image.asset(
                                                  'Assets/HomePage/sale-and-marketing.jpg',
                                                  height: 400,
                                                  width: 500,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Center(
                                                  child: Text(
                                                    "Marketing & Sales Training",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: distAnimation.value,
                                        ),
                                        Container(
                                          height: 600,
                                          width: 400,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              color: Colors.grey.shade100),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                child: Image.asset(
                                                  'Assets/HomePage/insta.png',
                                                  height: 400,
                                                  width: 400,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Center(
                                                  child: Text(
                                                    "Create & Manage Instagram",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: distAnimation.value,
                              ),
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(32.0),
                                  topLeft: Radius.circular(32.0),
                                  bottomRight: Radius.circular(32.0),
                                  bottomLeft: Radius.circular(32.0),
                                ),
                                child: Container(
                                  height: height82,
                                  width: width100,
                                  color: HexColor('#2ca9e3'),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '  Build a \n     Kwik Code',
                                        style: TextStyle(
                                            color: globals.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 90),
                                      ),
                                      const Text(
                                        ' Computer science involves the study of computation, automation,\n'
                                        ' and information. Computer science spanstheoretical disciplines\n '
                                        '(such as algorithms, theory of computation, and information theory) \n'
                                        ' to practical disciplines (including the design and implementation of\n '
                                        'hardware and software). Computer science is generally considered\n'
                                        ' [by whom?] an area of academic researchs and distinct from computer \n'
                                        ' programming.\n',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: distAnimation.value,
                              ),
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(32.0),
                                  topLeft: Radius.circular(32.0),
                                  bottomRight: Radius.circular(32.0),
                                  bottomLeft: Radius.circular(32.0),
                                ),
                                child: Container(
                                  height: height82,
                                  width: width100,
                                  color: HexColor('#222222'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          );
        });
  }

  // Future<void> distAnimation() async {
  //   Timer timer =
  //       Timer.periodic(const Duration(milliseconds: 60), (Timer t) async {
  //     // while (play != false) {
  //     //   await Future.delayed(const Duration(milliseconds: 100));
  //     print("60msec gone!!");
  //     if (k % 2 == 0) {
  //       if (mounted) {
  //         setState(() {
  //           _dist += 0.25;
  //         });
  //       }
  //       if (_dist == max) {
  //         k++;
  //         min = Random().nextInt(3) + 4;
  //         //
  //         print(min);
  //         //
  //         // play = false;
  //         // await Future.delayed(const Duration(milliseconds: 200));
  //         // play = false;
  //       }
  //     } else {
  //       if (mounted) {
  //         setState(() {
  //           _dist -= 0.25;
  //         });
  //       }
  //       if (_dist == min) {
  //         k++;
  //         max = Random().nextInt(5) + 15;
  //         //
  //         print(max);
  //         //
  //         // play = false;
  //         // await Future.delayed(const Duration(milliseconds: 200));
  //         // play = false;
  //       }
  //       //}
  //     }
  //   });
  // }

  void _distAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: _animationDuration));
    _timer =
        Timer.periodic(Duration(seconds: _animationDuration), (Timer t) async {
      setState(() {
        _k++;
        debugPrint('$_animationDuration Second');
      });
    });
  }
}
