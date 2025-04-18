import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vesti_assessment_app/data/models/book_model.dart';
import 'package:vesti_assessment_app/presentation/pages/auth/get_started_screen.dart';
import 'package:vesti_assessment_app/presentation/pages/auth/onboard_screen.dart';
import 'package:vesti_assessment_app/presentation/pages/auth/sign_in_screen.dart';
import 'package:vesti_assessment_app/presentation/pages/dashboard/book_details_page.dart';
import 'package:vesti_assessment_app/utils/constants.dart';

import '../main.dart';
import '../presentation/pages/dashboard/home_page.dart';

CustomTransitionPage<T> buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}


class AppRouterConfig{
  static final GoRouter router = GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: '/',
    // observers: [BotToastNavigatorObserver()],
    errorBuilder: (context, state) => const SizedBox(
      child: Center(
        child: Text('Error'),
      ),
    ),
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: appNavigatorKey,
        path: '/',
        name: Constants.onboard,
        pageBuilder: (context, state) {
          return buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const OnboardScreen()
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: appNavigatorKey,
        path: '/getStarted',
        name: Constants.getStarted,
        pageBuilder: (context, state) {
          return buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const GetStartedScreen()
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: appNavigatorKey,
        path: '/signin',
        name: Constants.signIn,
        pageBuilder: (context, state) {
          return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const SignInScreen()
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: appNavigatorKey,
        path: '/dashboard',
        name: Constants.dashboard,
        pageBuilder: (context, state) {
          return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const HomePage()
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: appNavigatorKey,
        path: '/bookDetails',
        name: Constants.bookDetails,
        pageBuilder: (context, state) {
          final book = state.extra as BookModel;
          return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child:  BookDetailsPage(
                book: book
              )
          );
        },
      ),
      //
      // GoRoute(
      //   parentNavigatorKey: appNavigatorKey,
      //   path: '/login',
      //   name: Constants.login,
      //   pageBuilder: (context, state) {
      //     return buildPageWithDefaultTransition(
      //         context: context,
      //         state: state,
      //         child: const LoginPage()
      //     );
      //   },
      // ),
      //
      // GoRoute(
      //   parentNavigatorKey: appNavigatorKey,
      //   path: '/dashboard',
      //   name: Constants.dashboard,
      //   pageBuilder: (context, state) {
      //     return buildPageWithDefaultTransition(
      //         context: context,
      //         state: state,
      //         child: const DashboardScreen()
      //     );
      //   },
      // ),

    ],
  );
}