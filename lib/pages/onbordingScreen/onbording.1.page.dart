import 'package:flutter/material.dart';
import 'package:global_med/pages/homeScreen/home.page.dart';
import 'package:global_med/themes/themes.dart';
import 'package:global_med/utils/fucntions/goHome.dart';
import 'package:global_med/utils/utils.dart';
import 'package:global_med/widgets/widgets.dart';

class Onbording1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Stack(
          children: [
            Positioned(
              top: -100.h,
              left: -100.h,
              child: Container(
                height: 400.h,
                width: 400.h,
                decoration: BoxDecoration(
                  color: secondary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(400.h),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -100.h,
              right: -100.h,
              child: Container(
                height: 400.h,
                width: 400.h,
                decoration: BoxDecoration(
                  color: secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(400.h),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 1,
              right: 1,
              top: 100.h,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(335.h)),
                child: Image.asset(
                  "public/images/medics/medicos.png",
                  fit: BoxFit.contain,
                  height: 335.h,
                  width: 335.h,
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              left: 1,
              right: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Column(
                  children: [
                    Text(
                      "DOCTORES CONFIABLES",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Acme",
                        fontSize: 45.h,
                        height: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      "veniam aute officia voluptate sectetur non aliquip quis deserunt.veniam aute officia voluptate sectetur non aliquip quis deserunt.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Sofa",
                        fontSize: 20.h,
                        height: 1.1,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    CustomButton(
                      text: "Presionar",
                      color: Color(0xffEB8202),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RouteManager.doctorScreen);
                      },
                    ),
                    SizedBox(height: 30.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteManager.onbordingScreen2);
                      },
                      child: Text(
                        "Saltar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Acme",
                          fontSize: 20.h,
                          height: 1,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
