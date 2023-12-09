import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/model/onBoardingModel.dart';
import 'package:to_do_app/modules/TasksScreen/TasksScreen.dart';
import 'package:to_do_app/modules/homePage.dart';
import 'package:to_do_app/modules/onBordingScreen/widgetOnBoading.dart';
import 'package:to_do_app/shared/constance.dart';
import 'package:to_do_app/shared/customButtom.dart';
import 'package:to_do_app/shared/simpleMethod.dart';

class onBoardingScreen extends StatefulWidget {
  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  var obBoardingController = PageController();
  bool isLastScreen = false;

  List<OnBoardingModel> onBoarding =
  [
    OnBoardingModel(
        photo: 'assets/images/Group 182.png',
        title: 'Manage Your Tasks',
        subTitle: 'You can easily manage all of your daily tasks in DoMe for free',
    ),
    OnBoardingModel(
        photo: 'assets/images/Frame 162.png',
        title: 'Create Daily Routing',
        subTitle: 'In Uptodo  you can create your personalized routine to stay productive',
    ),
    OnBoardingModel(photo: 'assets/images/Frame 161.png',
        title: 'Organize Your Tasks', subTitle: 'You can organize your daily tasks by adding your tasks into separate categories')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: TextButton(
          onPressed: ()
          {
            navigateAndFinish(context, TasksScreen());
          },
          child: Text(
            'Skip',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            bottom: 20.0,left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(

                onPageChanged: (index)
                {
                  if(index == onBoarding.length - 1)
                    {
                      setState(() {
                        isLastScreen = true;
                      });
                    }else
                    {
                      setState(() {
                        isLastScreen = false;
                      });
                    }
                },
                controller: obBoardingController,
                itemBuilder: (context, index) =>
                   onBordingItem(bording: onBoarding[index],),
                itemCount: onBoarding.length,
              ),
            ),
            SizedBox(height: 150,),
            SmoothPageIndicator(
                controller: obBoardingController,
                count: onBoarding.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: colorButtom,
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 4,
                  spacing: 5,
                ),
            ),
            //Spacer(),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 15.0),
                  child: TextButton(
                    onPressed: ()
                    {
                      obBoardingController.previousPage(
                          duration: Duration(milliseconds: 700),
                          curve: Curves.fastEaseInToSlowEaseOut);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                ),
                customButtom(
                  text: 'Next',
                  function: ()
                  {
                    if(isLastScreen)
                    {
                      navigateAndFinish(context, TasksScreen());
                    }else
                    {
                      obBoardingController.nextPage(
                          duration: Duration(milliseconds: 700),
                          curve: Curves.fastEaseInToSlowEaseOut);
                    }

                  },
                  width: 100.0, color_buttom: colorButtom,
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
