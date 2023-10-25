part of 'notifications_bloc.dart';

@immutable
class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoadedState extends NotificationsState {
  NotificationsLoadedState({
    required this.latestArticles,
    required this.featuredArticles,
  });

  final List<Article> latestArticles;
  final List<Article> featuredArticles;
}

class NotificationsLoadingState extends NotificationsState {}

class NotificationFailureState extends NotificationsState {
  final Object? exception;

  NotificationFailureState(this.exception);
}