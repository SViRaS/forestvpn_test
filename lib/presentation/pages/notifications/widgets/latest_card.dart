import 'package:flutter/material.dart';
import 'package:forestvpn_test/common/common.dart';

class LatestCard extends StatelessWidget {
  final String networkImage;
  final String text;
  final String postingDate;

  const LatestCard({
    required this.networkImage,
    required this.text,
    required this.postingDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.lightShadowColor.withOpacity(0.1), // Shadow color
            spreadRadius: 0, // Spread radius
            blurRadius: 20, // Blur radius
            offset: const Offset(4, 4), // Offset
          ),
        ],
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(9)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 60,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                networkImage,
                fit: BoxFit.cover,
              )),
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 190,
                    child: Text(
                      text,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 16,
                          height: 19.09 / 16,
                          fontFamily: 'SF-Pro-Display',
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackColor),
                    ),
                  ),
                  Text(postingDate,
                      style: const TextStyle(
                          fontSize: 12,
                          height: 14.32 / 12,
                          fontFamily: 'SF-Pro-Display',
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
