import 'dart:io';

import 'package:flutter/material.dart';
import 'package:senati_conecta/screens/auth/otpsignup.dart';
import 'package:senati_conecta/screens/mainscreen.dart';
import 'package:senati_conecta/widgets/transition.dart';
import 'package:sizer/sizer.dart';
import 'package:senati_conecta/colors/colors.dart';
import 'package:lottie/lottie.dart';

class StartAuth extends StatefulWidget {
  const StartAuth({super.key});

  @override
  State<StartAuth> createState() => _StartAuthState();
}

class _StartAuthState extends State<StartAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: <Widget>[
          IconButton(
            onPressed: () => {},
            splashRadius: 6.w,
            icon: const Icon(Icons.accessible),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                //Icon Animated
                /*Container(
                  child: Lottie.asset(
                    'assets/animations/animation_lmtu.json',
                    frameRate: FrameRate(120),
                    height: 30.h,
                  ),
                ),*/
                Text(
                  '¡Bienvenido!',
                  style: TextStyle(
                    fontSize: 27.sp,
                    fontFamily: 'chirp_heavy',
                    height: 1.2,
                    color: const Color(0xFF000000),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2.h),
                Text(
                  'Typense Cloud is the hosted SaaS version of our Open Source product',
                  style: TextStyle(
                    color: secondaryColor,
                    fontFamily: 'chirp_regular',
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.h),
                ElevatedButton(
                  onPressed: () => Navigator.push(context, Slide(const MainScreen())),
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(primaryColor),
                    overlayColor: const MaterialStatePropertyAll(hoverColor),
                    fixedSize: MaterialStatePropertyAll(Size(100.w, 0)),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))
                  ),
                  child: Text(
                    'Continuar',
                    style: TextStyle(
                      fontFamily: 'chirp_semiBold',
                      color: const Color(0xFFFBFBFB),
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  'También',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xFF536471),
                    fontFamily: 'chirp_light',
                    backgroundColor: const Color(0xFFFFFFFF),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
