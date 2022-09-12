import 'package:flutter/material.dart';

class TextSliderWidget extends StatefulWidget {
  const TextSliderWidget({super.key});

  @override
  State<TextSliderWidget> createState() => _TextSliderWidgetState();
}

class _TextSliderWidgetState extends State<TextSliderWidget> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: pageController,
            itemBuilder: ((context, index) {
              return AnimatedBuilder(
                animation: pageController,
                builder: ((context, child) {
                  return child!;
                }),
                child: Container(
                  margin: const EdgeInsets.all(24),
                  height: 100,
                  color: Colors.amberAccent,
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
