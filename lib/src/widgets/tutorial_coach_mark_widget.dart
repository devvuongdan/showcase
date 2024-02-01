import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../src.dart';

class TutorialCoachMarkWidget extends StatefulWidget {
  const TutorialCoachMarkWidget({
    Key? key,
    required this.targets,
    this.finish,
    this.paddingFocus = 10,
    this.clickTarget,
    this.onClickTargetWithTapPosition,
    this.clickOverlay,
    this.alignSkip = Alignment.bottomRight,
    this.textSkip = "SKIP",
    this.onClickSkip,
    this.colorShadow = Colors.black,
    this.opacityShadow = 0.8,
    this.textStyleSkip = const TextStyle(color: Colors.white),
    this.hideSkip = false,
    this.focusAnimationDuration,
    this.unFocusAnimationDuration,
    this.pulseAnimationDuration,
    this.pulseVariation,
    this.pulseEnable = true,
    this.skipWidget,
    this.rootOverlay = false,
    this.showSkipInLastTarget = false,
    this.imageFilter,
    this.onClickNext,
    this.onClickPre,
  })  : assert(targets.length > 0),
        super(key: key);

  final List<TargetFocus> targets;
  final FutureOr Function(TargetFocus)? clickTarget;
  final FutureOr Function(TargetFocus, TapDownDetails)?
      onClickTargetWithTapPosition;
  final FutureOr Function(TargetFocus)? clickOverlay;
  final Function()? finish;
  final Color colorShadow;
  final double opacityShadow;
  final double paddingFocus;
  final Function()? onClickSkip;
  final AlignmentGeometry alignSkip;
  final String textSkip;
  final TextStyle textStyleSkip;
  final bool hideSkip;
  final Duration? focusAnimationDuration;
  final Duration? unFocusAnimationDuration;
  final Duration? pulseAnimationDuration;
  final Tween<double>? pulseVariation;
  final bool pulseEnable;
  final Widget? skipWidget;
  final bool rootOverlay;
  final bool showSkipInLastTarget;
  final ImageFilter? imageFilter;
  final FutureOr<void> Function(TargetFocus?)? onClickNext;
  final FutureOr<void> Function(TargetFocus?)? onClickPre;

  @override
  TutorialCoachMarkWidgetState createState() => TutorialCoachMarkWidgetState();
}

class TutorialCoachMarkWidgetState extends State<TutorialCoachMarkWidget>
    implements TutorialCoachMarkController {
  final GlobalKey<AnimatedFocusLightState> _focusLightKey = GlobalKey();
  bool showContent = false;
  TargetFocus? currentTarget;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                AnimatedFocusLight(
                  key: _focusLightKey,
                  targets: widget.targets,
                  finish: widget.finish,
                  paddingFocus: widget.paddingFocus,
                  colorShadow: widget.colorShadow,
                  opacityShadow: widget.opacityShadow,
                  focusAnimationDuration: widget.focusAnimationDuration,
                  unFocusAnimationDuration: widget.unFocusAnimationDuration,
                  pulseAnimationDuration: widget.pulseAnimationDuration,
                  pulseVariation: widget.pulseVariation,
                  pulseEnable: widget.pulseEnable,
                  rootOverlay: widget.rootOverlay,
                  imageFilter: widget.imageFilter,
                  showContent: showContent,
                  focus: (target) {
                    setState(() {
                      currentTarget = target;
                      showContent = true;
                    });
                  },
                  removeFocus: () {
                    setState(() {
                      showContent = false;
                    });
                  },
                ),
              ],
            ),
          ),
          AnimatedOpacity(
            opacity: showContent ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              height: 330,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await widget.onClickPre?.call(currentTarget);
                          previous();
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await widget.onClickNext?.call(currentTarget);
                          next();
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          color: Colors.black,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void skip() => widget.onClickSkip?.call();

  @override
  void next() => _focusLightKey.currentState?.next();

  @override
  void previous() => _focusLightKey.currentState?.previous();
}
