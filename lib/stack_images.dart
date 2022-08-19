import 'package:countdowntimer_stackwidgets_stackimages/next_screen.dart';
import 'package:countdowntimer_stackwidgets_stackimages/onHover.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StackImages extends StatelessWidget {
  const StackImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
        onVerticalDragStart: (details) {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Stack(
            children: [
              OnHoverButton(
                child: buildImages(
                  image: 'nature1.jpg',
                  context: context,
                  margin: const EdgeInsets.symmetric(horizontal: 80)
                      .copyWith(top: 20),
                ),
              ),
              OnHoverButton(
                child: buildImages(
                  image: 'nature2.jpg',
                  context: context,
                  margin: const EdgeInsets.symmetric(horizontal: 60)
                      .copyWith(top: 40),
                ),
              ),
              OnHoverButton(
                child: buildImages(
                  image: 'nature3.jpg',
                  context: context,
                  margin: const EdgeInsets.symmetric(horizontal: 40)
                      .copyWith(top: 60),
                ),
              ),
              OnHoverButton(
                child: buildImages(
                  image: 'nature4.jpg',
                  context: context,
                  margin: const EdgeInsets.symmetric(horizontal: 0)
                      .copyWith(top: 80),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget buildImages(
      {required String image,
      required BuildContext context,
      required EdgeInsets margin}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => NextPage(
                  images: image,
                )));
      },
      child: Container(
        margin: margin,
        child: AspectRatio(
          aspectRatio: 2,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ),
    );
  }
}
