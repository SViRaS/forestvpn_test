import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forestvpn_test/common/common.dart';
import 'package:forestvpn_test/presentation/pages/notifications/bloc/notifications_bloc.dart';
import 'package:forestvpn_test/presentation/pages/notifications/widgets/widgets.dart';
import 'package:forestvpn_test/presentation/pages/notifications_detail/view/view.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final _notificationsBloc = NotificationsBloc(MockNewsRepository());

  @override
  void initState() {
    super.initState();
    _notificationsBloc.add(NotificationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      bloc: _notificationsBloc,
      builder: (context, state) {
        if (state is NotificationsLoadedState) {
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
                            for (var latestArticles in state.latestArticles) {
                              latestArticles.readed = true;
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
                        itemCount: state.featuredArticles.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return NotificationsDetailPage(
                                    description: state
                                        .featuredArticles[index].description,
                                    imageName:
                                        state.featuredArticles[index].imageUrl,
                                    text: state.featuredArticles[index].title,
                                  );
                                }));
                              },
                              child: FeaturedCard(
                                  imageUrl:
                                      state.featuredArticles[index].imageUrl,
                                  text: state.featuredArticles[index].title),
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
                      itemCount: state.latestArticles.length,
                      itemExtent: 119,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              state.latestArticles[index].readed = true;
                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return NotificationsDetailPage(
                                description:
                                    state.latestArticles[index].description,
                                imageName: state.latestArticles[index].imageUrl,
                                text: state.latestArticles[index].title,
                              );
                            }));
                          },
                          child: LatestCard(
                            networkImage: state.latestArticles[index].imageUrl,
                            text: state.latestArticles[index].title,
                            datePublished:
                                state.latestArticles[index].publicationDate,
                            color: state.latestArticles[index].readed
                                ? AppColors.readedColor
                                : AppColors.whiteColor,
                          ),
                        );
                      })
                ],
              ),
            ),
          );
        } else if (state is NotificationsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NotificationFailureState) {
          return const Center(
            child: Text(
              'Turn on internet\nor\nRestart the application',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 24,
                  height: 28 / 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF-Pro-Display'),
            ),
          );
        }
        return Container();
      },
    );
  }
}
