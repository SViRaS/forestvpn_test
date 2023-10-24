import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forestvpn_test/common/common.dart';
import 'package:forestvpn_test/presentation/pages/notifications/widgets/widgets.dart';
import 'package:forestvpn_test/presentation/pages/notifications_detail/notifications_detail.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Article> data = [];

  MockNewsRepository repository = MockNewsRepository();

  @override
  void initState() {
    super.initState();
    fetchDataFromRepository();
  }

  void fetchDataFromRepository() async {
    List<Article> result = await repository.getLatestArticles();
    setState(() {
      data = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  'assets/svg/icons/back_button.svg',
                  width: 9,
                  height: 24,
                )),
            const Text(
              'Notifications',
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 18,
                  height: 21.48 / 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF-Pro-Display'),
            ),
            const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Mark all read',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      height: 21.48 / 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF-Pro-Display'),
                )),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Featured',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 20,
                    height: 23.87 / 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro-Display'),
              ),
              const SizedBox(
                height: 16,
              ),
              const FeaturedCard(),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Latest news',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 20,
                    height: 23.87 / 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro-Display'),
              ),
              const SizedBox(
                height: 16,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemExtent: 113,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () async {
                          await Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NotificationsDetailPage(
                              description: data[index].description,
                              imageName: data[index].imageUrl,
                              text: data[index].title,
                            );
                          }));
                        },
                        child: LatestCard(
                          networkImage: data[index].imageUrl,
                          text: data[index].title,
                          postingDate: '1 day',
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
