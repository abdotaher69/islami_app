import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/routes_manger/routes_manager.dart';


import 'onboarding_pages.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "onboarding";

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  int currentPage = 0;

  final pages = onboardingPages;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Image.asset(
                          ImagesAssets.islamiLogo,
                          width: width * 0.8,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: Image.asset(
                            item['image']!,
                            height: height * 0.35,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          item['title']!,
                          style:TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15),
                        if (item.containsKey('subtitle'))
                          Text(
                            item['subtitle']!,
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorsManager.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        currentPage == index
                            ? ColorsManager.white
                            : Colors.white24,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentPage > 0)
                    GestureDetector(
                      onTap: () {
                        controller.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: ColorsManager.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  else
                    SizedBox(width: 60),
                  GestureDetector(
                    onTap: () {
                      if (currentPage == pages.length - 1) {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteManager.mainLayout,
                        );
                      } else {
                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text(
                      currentPage == pages.length - 1 ? "Start" : "Next",
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorsManager.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
