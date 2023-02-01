import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

/// Compte tenu de la version de ces deux packages on ne peut qu'utiliser
/// simple_animations: ^3.0.0
///  supercharged: ^2.1.1
/// pour que le code marche bien
class FadeUi extends StatelessWidget {
  const FadeUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            const FadeIn(delay:1.0,child: HeaderPlaceholder()),
            const WhitespaceSeparator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const[
                 FadeIn(delay: 2,child: CirclePlaceholder()),
                 FadeIn(delay: 2.33,child: CirclePlaceholder()),
                 FadeIn(delay: 2.66,child: CirclePlaceholder())
              ],
            ),
            const WhitespaceSeparator(),
            const FadeIn(delay:4,child: CardPlaceholder()),
            const FadeIn(delay:4.5,child: CardPlaceholder()),
            const FadeIn(delay:5,child: CardPlaceholder()),
            const FadeIn(delay:5.5,child: CardPlaceholder()),
            const FadeIn(delay:6,child: CardPlaceholder()),
            const FadeIn(delay:6.5,child: CardPlaceholder()),
          ],
        ),
      ),
    );
  }
}

enum _AniProps { opacity, translateX }

class FadeIn extends StatelessWidget {
  

  const FadeIn({Key? key, required this.delay,required  this.child}): super(key: key);
final double delay;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, 0.0.tweenTo(1.0))
      ..add(_AniProps.translateX, 130.0.tweenTo(0.0));

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: (300 * delay).round().milliseconds,
      duration: 500.milliseconds,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: Transform.translate(
          offset: Offset(value.get(_AniProps.translateX), 0),
          child: child,
        ),
      ),
    );
  }
}

class WhitespaceSeparator extends StatelessWidget {
  const WhitespaceSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
    );
  }
}

class HeaderPlaceholder extends StatelessWidget {
  const HeaderPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
    );
  }
}

class CirclePlaceholder extends StatelessWidget {
  const CirclePlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.grey.shade300,
      ),
    );
  }
}

class CardPlaceholder extends StatelessWidget {
  const CardPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: ClipOval(
                  child: Container(
                    color: Colors.grey.shade300,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.grey,
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                      color: Colors.grey.shade300,
                      height: 7,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                      color: Colors.grey.shade300,
                      height: 7,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                      color: Colors.grey.shade300,
                      height: 7,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class FadeInUiDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ExamplePage(
//       title: "Fade-in UI",
//       pathToFile: "fade_in_ui.dart",
//       delayStartup: false,
//       builder: (context) => FadeInUi(),
//     );
// }
// }
