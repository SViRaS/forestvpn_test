import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forestvpn_test/common/common.dart';
import 'package:forestvpn_test/presentation/pages/notifications/widgets/widgets.dart';
import 'package:forestvpn_test/presentation/pages/notifications_detail/view/view.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Article> dataLatestArticles = [];
  List<Article> dataFeaturedArticles = [];

  MockNewsRepository repository = MockNewsRepository();

  @override
  void initState() {
    super.initState();
    fetchDataFromRepositoryLatestArticles();
    fetchDataFromRepositoryFeaturedArticles();
  }

  void fetchDataFromRepositoryLatestArticles() async {
    List<Article> result = await repository.getLatestArticles();
    setState(() {
      dataLatestArticles = result;
    });
  }

  void fetchDataFromRepositoryFeaturedArticles() async {
    List<Article> result = await repository.getLatestArticles();
    setState(() {
      dataFeaturedArticles = result;
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
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      for (var dataLatestArticles in dataLatestArticles) {
                        dataLatestArticles.readed = true;
                      }
                    });
                  },
                  child: const Text(
                    'Mark all read',
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 18,
                        height: 21.48 / 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SF-Pro-Display'),
                  ),
                )),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'Featured',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 20,
                    height: 23.87 / 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro-Display'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dataFeaturedArticles.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NotificationsDetailPage(
                              description:
                                  dataFeaturedArticles[index].description,
                              imageName: dataFeaturedArticles[index].imageUrl,
                              text: dataFeaturedArticles[index].title,
                            );
                          }));
                        },
                        child: FeaturedCard(
                            imageUrl: dataFeaturedArticles[index].imageUrl,
                            text: dataFeaturedArticles[index].title),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'Latest news',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 20,
                    height: 23.87 / 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro-Display'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: dataLatestArticles.length,
                itemExtent: 119,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        dataLatestArticles[index].readed = true;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NotificationsDetailPage(
                          description: dataLatestArticles[index].description,
                          imageName: dataLatestArticles[index].imageUrl,
                          text: dataLatestArticles[index].title,
                        );
                      }));
                    },
                    child: LatestCard(
                      networkImage: dataLatestArticles[index].imageUrl,
                      text: dataLatestArticles[index].title,
                      postingDate: '1 day',
                      color: dataLatestArticles[index].readed
                          ? AppColors.readedColor
                          : AppColors.whiteColor,
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
