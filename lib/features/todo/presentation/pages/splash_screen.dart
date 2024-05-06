import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';
import 'package:todo/core/constant/app_image.dart';
import 'package:todo/core/constant/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> goToHome () async{
    await Future.delayed(const Duration(seconds: 3) , ()=> Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.todo, (route) => false));
  }
  @override
  void initState() {
    goToHome();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      color: AppColors.white,
      child: Center(
        child: SizedBox(
          height: 110,
          width: 110,
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
