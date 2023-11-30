import 'package:flutter/material.dart';
import 'package:to_do_app/model/onBoardingModel.dart';

class onBordingItem extends StatelessWidget {
  const onBordingItem( {Key? key, required this.bording}) : super(key: key);
final OnBoardingModel bording;
  @override
  Widget build(BuildContext context) {
    return Column(
      //  crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('${bording.photo}'),
        SizedBox(height: 10,),
        Text(

          '${bording.title}',

          style: TextStyle(
              color: Colors.white,
              fontSize: 30
          ),
        ),
        SizedBox(height: 10,),
        Text(
          style: TextStyle(
              color: Colors.white,
              fontSize: 14
          ),
          '${bording.subTitle}',
          textAlign: TextAlign.center,
        ),


      ],
    );
  }
}