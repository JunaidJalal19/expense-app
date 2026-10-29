import 'package:expens_app/color_helper.dart';
import 'package:expens_app/modal/onboarding_items_data.dart';
import 'package:expens_app/routers/app_router.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  int _currentScreen = 0;

  final PageController _PageViewController = PageController();

  final List<OnboardingItemsData> _onboardingScreenItem = [
    OnboardingItemsData(
        title: "Easy way to monitor your expense",
        subTitle: "Safe your future by managing your expense right now",
        imgUrl: "assets/images/expens_intro_image.png",
    ),
    OnboardingItemsData(
      title: "Plan Smarter, Achieve Faster",
      subTitle: "Set your goals, track your progress and stay focused on what matters.",
      imgUrl: "assets/images/Checklist-Goals.png",
    ),
    OnboardingItemsData(
      title: "Small Steps Big Dreams",
      subTitle: "Stay consistent, earn rewards and turn your goals into reality.",
      imgUrl: "assets/images/Trophy-Celebration.png",
    ),
  ];

  void _nextOnboardingScreen() {
    if(_currentScreen < _onboardingScreenItem.length - 1) {
      _PageViewController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease
      );
    }else {
      Navigator.pushReplacementNamed(context, AppRouter.login_screen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),

              // logo
              Image.asset(
                  "assets/images/expens_logo.png",
                width: 160,
              ),

              Flexible(
                child: Align(
                  alignment: .bottomCenter,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [

                      Align(
                        alignment: .bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadiusGeometry.circular(12)
                            ),
                          ),
                        ),
                      ),

                      PageView.builder(
                        onPageChanged: (value){
                          setState(() {
                            _currentScreen = value;
                          });
                        },
                        controller: _PageViewController,
                        physics: ClampingScrollPhysics(),
                        itemCount: _onboardingScreenItem.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // img
                                Positioned(
                                  top: 30,
                                  left: index == 0 ? -5 : 0,
                                  child: Image.asset(
                                    _onboardingScreenItem[index].imgUrl,
                                    width: index == 0 ? 380 : 360,
                                    height: index == 0 ? 380 : 360,
                                  ),
                                ),

                                // msg
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: .min,
                                    children: [
                                      Expanded(child: SizedBox()),

                                      //title
                                      Text(
                                        _onboardingScreenItem[index].title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 30,
                                        ),
                                      ),

                                      SizedBox(
                                        height: 15,
                                      ),

                                      //subTitle
                                      Text(
                                        _onboardingScreenItem[index].subTitle,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16
                                        ),
                                      ),

                                      SizedBox(
                                        height: 70,
                                      ),


                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      ),



                      // indicators
                      Align(
                        alignment: .bottomStart,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, bottom: 20),
                          child: Row(
                            spacing: 10,
                            children: List.generate(_onboardingScreenItem.length, (index) {
                              return CircleAvatar(
                                backgroundColor: _currentScreen == index ? Colors.amber : Colors.grey.shade400,
                                radius: 5,
                              );
                            }),
                          ),
                        ),
                      ),


                      // next btn
                      Positioned(
                        bottom: -15,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            padding: EdgeInsets.only(left: 15, top: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10))
                            ),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: FilledButton(
                                  onPressed: _nextOnboardingScreen,
                                  style: FilledButton.styleFrom(
                                      padding: EdgeInsets.all(0),
                                      backgroundColor: ColorHelper.secondaryColor,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12))
                                  ),
                                  child: Icon(Icons.arrow_forward_rounded,size: 26,)
                              ),
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),



              SizedBox(height: 60,)
            ],
          ),
        ),
      ),

    );
  }
}
