import 'package:flutter/material.dart';
import 'package:forestvpn_test/presentation/pages/notifications/notifications.dart';

import 'presentation/pages/notifications_detail/notifications_detail.dart';


class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NotificationsPage(),
    );
  }
}
