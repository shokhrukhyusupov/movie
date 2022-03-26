import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/auth_page/auth_page.dart';
import 'package:movie/styles/images.dart';

import '../../styles/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  int indicatorIndex = 0;
  bool isActive = false;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();
    fadeAnimationImage();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  fadeAnimationImage() {
    _controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeTransition(
          opacity: _animation,
          child: Image.asset(
            Images.welcomeImages[indicatorIndex],
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
        Container(color: Colors.black54),
        Container(color: Colors.black45),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 17),
          child: Column(
            children: [
              const Spacer(),
              Text(
                'Enjoy your favourite movie everywhere',
                style: Theme.of(context).textTheme.headline2,
                textScaleFactor:
                    MediaQuery.of(context).textScaleFactor.clamp(0.9, 0.9),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                "Browse through our collections and discover houndreds of movies and series that you'll love!",
                style: Theme.of(context).textTheme.headline4,
                textScaleFactor:
                    MediaQuery.of(context).textScaleFactor.clamp(1.4, 1.4),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 15),
              Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    i == indicatorIndex
                        ? const SliderIndicator(isActive: true)
                        : const SliderIndicator(isActive: false),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
                child: ElevatedButton(
                  onPressed: () {
                    indicatorIndex != 2
                        ? setState(() {
                            indicatorIndex++;
                            fadeAnimationImage();
                          })
                        : Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => AuthPage()),
                            (route) => false);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: indicatorIndex == 2 ? 0.0 : 1.0,
                        child: Text(
                          'Next',
                          style: Theme.of(context).textTheme.headline3,
                          textScaleFactor: MediaQuery.of(context)
                              .textScaleFactor
                              .clamp(1, 1),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: indicatorIndex == 2 ? 1.0 : 0.0,
                        child: Text(
                          'Get Started',
                          style: Theme.of(context).textTheme.headline3,
                          textScaleFactor: MediaQuery.of(context)
                              .textScaleFactor
                              .clamp(1, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SliderIndicator extends StatelessWidget {
  final bool isActive;
  const SliderIndicator({required this.isActive, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: MediaQuery.of(context).size.width * 0.015,
        width: isActive
            ? MediaQuery.of(context).size.width / 5
            : MediaQuery.of(context).size.width / 17,
        decoration: BoxDecoration(
          color: isActive ? AppColors.amber : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
