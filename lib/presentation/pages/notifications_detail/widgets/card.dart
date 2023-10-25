// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forestvpn_test/common/common.dart';

class CardWidget extends StatelessWidget {
  final String imageName;
  final String text;
  const CardWidget({Key? key, required this.imageName, required this.text,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 495,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageName),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, top: 40, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'assets/svg/icons/back_button.svg',
                  width: 9,
                  height: 24,
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 28,
                    height: 33.41 / 28,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'SF-Pro-Display'),
              ),
            ],
          ),
        ));
  }
}
