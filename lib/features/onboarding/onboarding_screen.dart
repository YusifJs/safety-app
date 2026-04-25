import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:safety_app/core/helpers/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const String routeName = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var boardController = PageController();
  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onboarding_completed', value: true).then((
      value,
    ) {
      if (value) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/back_ground.png',
              fit: BoxFit.cover,
            ),
          ),

          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: boardController,
                  onPageChanged: (int index) {
                    setState(() {
                      isLast = (index == boarding.length - 1);
                    });
                  },
                  itemCount: boarding.length,
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index]),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 40,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,

                      child: ElevatedButton(
                        onPressed: () {
                          if (isLast) {
                            submit();
                          } else {
                            boardController.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1B4E8D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.zero,
                        ),

                        child: Image.asset(
                          boarding[isLast
                                  ? boarding.length - 1
                                  : (boardController.hasClients
                                        ? boardController.page!.round()
                                        : 0)]
                              .buttonText,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    SmoothPageIndicator(
                      controller: boardController,
                      effect: const ExpandingDotsEffect(
                        dotColor: Color(0xFFD9D9D9),
                        activeDotColor: Color(0xFF1B4E8D),
                        dotHeight: 10,
                        expansionFactor: 4,
                        dotWidth: 10,
                        spacing: 8,
                      ),
                      count: boarding.length,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1000),
          child: ZoomIn(
            duration: const Duration(milliseconds: 1200),
            child: Image.asset(model.logoImage, width: 150),
          ),
        ),
        const SizedBox(height: 40),

        FadeInUp(
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 1000),
          child: Image.asset(model.textImage, width: 280),
        ),
        const SizedBox(height: 20),
        FadeInUp(
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 1000),
          child: Image.asset(model.description, width: 280),
        ),
      ],
    ),
  );

  final List<BoardingModel> boarding = [
    BoardingModel(
      logoImage: 'assets/icons/spash_logo.png',
      textImage: 'assets/icons/onbaordingtext1.png',
      buttonText: 'assets/icons/tb1.png',
      description: 'assets/icons/onbaordingtext1,2.png',
    ),
    BoardingModel(
      logoImage: 'assets/icons/spash_logo.png',
      textImage: 'assets/icons/onbaordingtext2.png',
      buttonText: 'assets/icons/tb2.png',
      description: 'assets/icons/onbaordingtext2,1.png',
    ),
    BoardingModel(
      logoImage: 'assets/icons/spash_logo.png',
      textImage: 'assets/icons/onbaordingtext3.png',
      buttonText: 'assets/icons/tb3.png',
      description: 'assets/icons/onbaordingtext3,1.png',
    ),
  ];
}

class BoardingModel {
  final String logoImage;
  final String textImage;
  final String description;
  final String buttonText;

  BoardingModel({
    required this.logoImage,
    required this.textImage,
    required this.description,
    required this.buttonText,
  });
}
