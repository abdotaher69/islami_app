import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotationAnimation;
  List<String> sebhaItems = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  int currentIndex = 0;
  int counter = 0;

  double start = 0;
  double end = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(microseconds: 100),
      vsync: this,
    );
    rotationAnimation = Tween<double>(
      begin: start,
      end: end,
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesAssets.sebhaTapBackGround),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(ImagesAssets.islamiLogo),
          
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Image.asset('assets/images/سَبِّحِ اسْمَ رَبِّكَ الأعلى.png',),
          ),

          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: controller,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: rotationAnimation.value,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            counter++;
                            if (counter % 33 == 0) {
                              currentIndex =
                                  (currentIndex + 1) % sebhaItems.length;
                              counter = 0;
                             
                            }
                            start = end;
                            end =  (counter / 33) * (2 * math.pi);

                            rotationAnimation = Tween<double>(
                              begin: start,
                              end: end,
                            ).animate(controller);
                            controller
                              ..reset()
                              ..forward();
                          });
                        },
                        child: Stack(
                          clipBehavior: Clip.none,

                          alignment: Alignment.center,
                          children: [
                            Image.asset(ImagesAssets.sebhaBody),
                            Positioned(
                              top: -40,
                              child: Image.asset(
                                ImagesAssets.sebhaIndicator,
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        sebhaItems[currentIndex],
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "$counter",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Expanded(

          // ),
        ],
      ),
    );
  }
}
