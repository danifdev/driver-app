import 'package:go_router/go_router.dart';
import 'package:ms_taxi/features/auth/views/login.dart';
import 'package:ms_taxi/features/auth/views/login_init.dart';
import 'package:ms_taxi/features/auth/views/login_success.dart';
import 'package:ms_taxi/features/home/views/home.dart';
import 'package:ms_taxi/features/home/views/request/request.dart';
import 'package:ms_taxi/features/home/views/request/request_accept.dart';
import 'package:ms_taxi/features/journey/views/journey.dart';
import 'package:ms_taxi/features/journey/views/journey_detail.dart';
import 'package:ms_taxi/features/splash/views/splash_view.dart';
import 'package:ms_taxi/features/statistics/views/statistics.dart';
import 'package:ms_taxi/utils/constants/routes.dart';

// GoRouter configuration
class AppRouter {
  static final instance = GoRouter(
    initialLocation: GoRouteNames.launcher,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: GoRouteNames.launcher,
        path: GoRouteNames.launcher,
        builder: (_, s) {
          return const SplashView();
        },
      ),
      GoRoute(
        name: GoRouteNames.loginInit,
        path: GoRouteNames.loginInit,
        builder: (_, s) {
          return const LoginInitView();
        },
      ),
      GoRoute(
        name: GoRouteNames.login,
        path: GoRouteNames.login,
        builder: (_, s) {
          return const LoginView();
        },
      ),
      GoRoute(
        name: GoRouteNames.loginSuccess,
        path: GoRouteNames.loginSuccess,
        builder: (_, s) {
          return const LoginSuccess();
        },
      ),
      GoRoute(
        name: GoRouteNames.home,
        path: GoRouteNames.home,
        builder: (_, s) {
          final data = s.extra as Map<String, dynamic>?;
          return HomeView(
            requestType: (data?['type'] is RequestType)
                ? (data?['type'] as RequestType)
                : RequestType.day,
          );
        },
      ),
      GoRoute(
        name: RequestView.route,
        path: RequestView.route,
        builder: (_, s) {
          return RequestView();
        },
      ),
      GoRoute(
        name: StatisticsView.route,
        path: StatisticsView.route,
        builder: (_, s) {
          return const StatisticsView();
        },
      ),
      GoRoute(
        name: JourneyView.route,
        path: JourneyView.route,
        builder: (_, s) {
          return JourneyView();
        },
      ),
      GoRoute(
        name: JourneyDetail.route,
        path: JourneyDetail.route,
        builder: (_, s) {
          return const JourneyDetail();
        },
      ),
      GoRoute(
        name: RequestAccept.route,
        path: RequestAccept.route,
        builder: (_, s) {
          final data = s.extra as Map<String, dynamic>?;
          return RequestAccept(
            requestType: (data?['type'] is RequestType)
                ? (data?['type'] as RequestType)
                : null,
          );
        },
      ),
    ],
  );
}
