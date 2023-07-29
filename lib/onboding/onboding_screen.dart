import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
 

import 'components/animated_btn.dart';
import 'components/sign_in_dialog.dart';

class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  late RiveAnimationController _btnAnimationController;

  //bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
   );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
   


    children: [



  Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/Backgrounds/Spline.png",
            ),
          ),

       Positioned.fill(
        child: BackdropFilter(
         filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
       child: const SizedBox(),
     ),
   ),


  RiveAnimation.asset("assets/RiveAssets/shapes.riv", fit: BoxFit.cover,),

 Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),

      


 SafeArea(
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        SizedBox(
          width: 260,
          child: Column(
            children: [
              Text(
                "Learn design & code",
                style: TextStyle(
                  fontSize: 60,
                  fontFamily: "Poppins",
                  height: 1.2,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
              ),
            ],
          ),
        ),
        Spacer(flex: 2),

        GestureDetector(
  onTap: () {
     _btnAnimationController.isActive = true;


                      showCustomDialog(
                              context,
                              onValue: (_) {
                                setState(() {
                              //    isShowSignInDialog = false;
                                });
                              },
                            );

  },
  child:  SizedBox(
    height: 64,
    width: 260,
    child: Stack(
      children:  [
        RiveAnimation.asset(
          
          "assets/RiveAssets/button.riv",
             controllers: [_btnAnimationController],
          // TODO: Add Rive Controller
        ),
        Positioned.fill(
          top: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.arrow_right),
              SizedBox(width: 8),
              Text(
                "Start the course",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        )
      ],
    ),
  ),
),
        
        
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Text(
            "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
          ),
        ),
      ],
    ),
  ),
),








    ],
  ),



      // body: Stack(
      //   children: [
      //     Positioned(
      //       width: MediaQuery.of(context).size.width * 1.7,
      //       left: 100,
      //       bottom: 100,
      //       child: Image.asset(
      //         "assets/Backgrounds/Spline.png",
      //       ),
      //     ),
      //     Positioned.fill(
      //       child: BackdropFilter(
      //         filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
      //         child: const SizedBox(),
      //       ),
      //     ),
      //     const RiveAnimation.asset(
      //       "assets/RiveAssets/shapes.riv",
      //     ),
      //     Positioned.fill(
      //       child: BackdropFilter(
      //         filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
      //         child: const SizedBox(),
      //       ),
      //     ),
      //     AnimatedPositioned(
      //       top: isShowSignInDialog ? -50 : 0,
      //       height: MediaQuery.of(context).size.height,
      //       width: MediaQuery.of(context).size.width,
      //       duration: const Duration(milliseconds: 260),
      //       child: SafeArea(
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 32),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               const Spacer(),
      //               SizedBox(
      //                 width: 260,
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   children: const [
      //                     Text(
      //                       "Net\nZero",
      //                       style: TextStyle(
      //                         fontSize: 80,
      //                         fontWeight: FontWeight.w700,
      //                         fontFamily: "Poppins",
      //                         height: 1.2,
      //                       ),
      //                     ),
      //                     SizedBox(height: 16),
      //                     Text(
      //                       "Know Your Nearest Doctors and Medical Stores",
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               const Spacer(flex: 2),
      //               AnimatedBtn(
      //                 text: "Lets Start",
      //                 btnAnimationController: _btnAnimationController,
      //                 press: () {
      //                   _btnAnimationController.isActive = true;

      //                   Future.delayed(
      //                     const Duration(milliseconds: 800),
      //                     () {
      //                       setState(() {
      //                         isShowSignInDialog = true;
      //                       });
      //                       showCustomDialog(
      //                         context,
      //                         onValue: (_) {
      //                           setState(() {
      //                             isShowSignInDialog = false;
      //                           });
      //                         },
      //                       );
      //                     },
      //                   );
      //                 },
      //               ),
      //               const Padding(
      //                 padding: EdgeInsets.symmetric(vertical: 24),
      //                 child: Text("Your Best Friend for find doctors"),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
   
   
    );
  }
}
