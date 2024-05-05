import 'package:flutter/material.dart';

class BgBottomBar extends StatelessWidget {
final Widget widget ;

  const BgBottomBar({super.key, required this.widget});
  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height ;
    return Container(
          padding: const EdgeInsets.only(bottom: 20),
          alignment: Alignment.bottomCenter,
          height: height / 3,
          width: double.maxFinite,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
            const Color(0xffCAEBFE).withOpacity(0),
            const Color(0xffffffff),
          ])),
          child: widget ,
        );
  }
}