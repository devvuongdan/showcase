// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';

import 'src/src.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () async {
              createTutorial();
              Future.delayed(Duration.zero, showTutorial);
            }),
            body: SingleChildScrollView(
              key: keys[0],
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                children: [
                  Container(
                    key: keys[1],
                    height: 200,
                    width: double.infinity,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            key: keys[7],
                            height: 40,
                            width: 40,
                            color: Colors.blueAccent,
                          ),
                          Container(
                            key: keys[6],
                            height: 40,
                            width: 40,
                            color: Colors.blueAccent,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: 160,
                      width: double.infinity,
                      color: Colors.greenAccent,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Container(
                            key: keys[2],
                            height: 150,
                            width: 150,
                            color: Colors.blueGrey,
                          ),
                          Row(
                            key: keys[3],
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                color: Colors.redAccent,
                              ),
                              Container(
                                height: 150,
                                width: 150,
                                color: Colors.white10,
                              ),
                              Container(
                                height: 150,
                                width: 150,
                                color: Colors.amber,
                              )
                            ],
                          )
                        ],
                      )),
                  Container(
                    key: keys[4],
                    height: 100,
                    width: double.infinity,
                    color: Colors.blue,
                  ),
                  Container(
                    key: keys[5],
                    height: 300,
                    width: double.infinity,
                    color: Colors.yellowAccent,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: _padding,
        )
      ],
    );
  }

  double _padding = 0;

  late TutorialCoachMark tutorialCoachMark;

  List<GlobalKey> keys = [
    GlobalKey(debugLabel: "one"),
    GlobalKey(debugLabel: "two"),
    GlobalKey(debugLabel: "three"),
    GlobalKey(debugLabel: "four"),
    GlobalKey(debugLabel: "five"),
    GlobalKey(debugLabel: "six"),
    GlobalKey(debugLabel: "seven"),
    GlobalKey(debugLabel: "eight"),
  ];

  void showTutorial() {
    setState(() {
      _padding = 300;
    });
    tutorialCoachMark.show(context: context);
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: Colors.black,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.5,
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onFinish: () {},
      onClickTarget: (target) {},
      onClickTargetWithTapPosition: (target, tapDetails) {},
      onClickOverlay: (target) {},
      onSkip: () {
        return true;
      },
      onClickPre: (p0) {
        final TargetFocus? targetX = p0;
        final int index = _createTargets()
            .indexWhere((element) => element.identify == targetX?.identify);
        if (index == 0) {
          setState(() {
            _padding = 0;
          });
          return;
        }
        final TargetFocus target = _createTargets()[index - 1];
        if (target.keyTarget?.currentContext != null) {
          Scrollable.ensureVisible(
            target.keyTarget!.currentContext!,
            alignment: 0.5,
            duration: const Duration(milliseconds: 250),
            curve: Curves.linear,
          );
        }
      },
      onClickNext: (p0) {
        final TargetFocus? targetX = p0;
        final int index = _createTargets()
            .indexWhere((element) => element.identify == targetX?.identify);
        if (index == _createTargets().length - 1) {
          setState(() {
            _padding = 0;
          });
          return;
        }
        final TargetFocus target = _createTargets()[index + 1];
        if (target.keyTarget?.currentContext != null) {
          Scrollable.ensureVisible(
            target.keyTarget!.currentContext!,
            alignment: 0.5,
            duration: const Duration(milliseconds: 250),
            curve: Curves.linear,
          );
        }
      },
    );
  }

  List<TargetFocus> _createTargets() {
    return [
      TargetFocus(
        identify: "0",
        keyTarget: keys[0],
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        activeHand: false,
        contents: [
          TargetContent(),
        ],
      ),
      TargetFocus(
        identify: "1",
        keyTarget: keys[1],
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        activeHand: false,
        contents: [
          TargetContent(),
        ],
      ),
      TargetFocus(
        identify: "2",
        keyTarget: keys[2],
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(),
        ],
      ),
      TargetFocus(
        identify: "3",
        keyTarget: keys[3],
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(),
        ],
      ),
      TargetFocus(
        identify: "4",
        keyTarget: keys[4],
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(),
        ],
      ),
      TargetFocus(
        identify: "5",
        keyTarget: keys[5],
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(),
        ],
      ),
      TargetFocus(
        identify: "6",
        keyTarget: keys[6],
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        activeHand: false,
        contents: [
          TargetContent(),
        ],
      ),
      TargetFocus(
        identify: "7",
        keyTarget: keys[7],
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        activeHand: false,
        contents: [
          TargetContent(),
        ],
      ),
    ];
  }
}
