import 'package:flutter/material.dart';
import 'package:forestvpn_test/common/common.dart';

class FeaturedCard extends StatelessWidget {
  final String imageUrl;
  final String text;
  const FeaturedCard({
    required this.imageUrl,
    required this.text,
    Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 358,
      decoration:  BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child:  Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 20),
          child: Text(
            text,
            style: const TextStyle(
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
