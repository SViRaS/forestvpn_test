import 'package:bloc/bloc.dart';
import 'package:forestvpn_test/repositories/news/mock_news_repository.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:meta/meta.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final MockNewsRepository mockNewsRepository;
  NotificationsBloc(this.mockNewsRepository) : super(NotificationsInitial()) {
    on<NotificationsEvent>((event, emit) async {
      try {
        final notificationLoadLatestArticles =
          await mockNewsRepository.getLatestArticles();
      final notificationLoadFeaturedArticles =
          await mockNewsRepository.getFeaturedArticles();
      emit(NotificationsLoadedState(
          latestArticles: notificationLoadLatestArticles,
          featuredArticles: notificationLoadFeaturedArticles));
      } catch (e) {
        emit(NotificationFailureState(e));
      }
    });

  }
}
