import 'package:flutter/material.dart';
import 'package:forestvpn_test/common/common.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 358,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/image_test1.png'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: const Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 16, bottom: 40),
          child: Text(
            'We are processing\nyour request...',
            style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 28,
                height: 33.41 / 28,
                fontWeight: FontWeight.w400,
                fontFamily: 'SF-Pro-Display'),
          ),
        ),
      ),
    );
  }
}
