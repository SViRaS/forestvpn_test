import 'package:flutter/material.dart';
import 'package:forestvpn_test/common/common.dart';
import 'package:forestvpn_test/presentation/pages/notifications_detail/widgets/widgets.dart';

class NotificationsDetailPage extends StatelessWidget {
  final String imageName;
  final String text;
  final String? description;
  const NotificationsDetailPage(
      {Key? key,
      required this.imageName,
      required this.text,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardWidget(

              imageName: imageName,
              text: text,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    description!,
                    softWrap: true,
                    style: const TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 16,
                        height: 19.06 / 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SF-Pro-Display'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
