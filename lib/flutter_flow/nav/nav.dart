import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '../flutter_flow_theme.dart';

import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '../../auth/base_auth_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? HomeWidget() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : OnboardingWidget(),
        ),
        FFRoute(
          name: 'Onboarding',
          path: '/onboarding',
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: 'Registration',
          path: '/registration',
          builder: (context, params) => RegistrationWidget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: 'SignIn',
          path: '/signIn',
          builder: (context, params) => SignInWidget(),
        ),
        FFRoute(
          name: 'MapPage',
          path: '/mapPage',
          builder: (context, params) => MapPageWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: 'Interview',
          path: '/interview',
          builder: (context, params) => InterviewWidget(
            feedInterviewRow: params.getParam<FeedInterviewRow>(
                'feedInterviewRow', ParamType.SupabaseRow),
          ),
        ),
        FFRoute(
          name: 'Facts',
          path: '/facts',
          builder: (context, params) => FactsWidget(
            feedFactsRow: params.getParam<FeedFactsRow>(
                'feedFactsRow', ParamType.SupabaseRow),
          ),
        ),
        FFRoute(
          name: 'Interesting',
          path: '/interesting',
          builder: (context, params) => InterestingWidget(
            interestingRow: params.getParam<FeedInterestingRow>(
                'interestingRow', ParamType.SupabaseRow),
          ),
        ),
        FFRoute(
          name: 'Professions',
          path: '/professions',
          builder: (context, params) => ProfessionsWidget(
            feedProfessionsRow: params.getParam<FeedProfessionsRow>(
                'feedProfessionsRow', ParamType.SupabaseRow),
          ),
        ),
        FFRoute(
          name: 'Playlist',
          path: '/playlist',
          builder: (context, params) => PlaylistWidget(
            playlistsRow: params.getParam<FeedPlaylistsRow>(
                'playlistsRow', ParamType.SupabaseRow),
          ),
        ),
        FFRoute(
          name: 'Questions',
          path: '/questions',
          builder: (context, params) => QuestionsWidget(
            feed5QuestionsRow: params.getParam<Feed5QuestionsRow>(
                'feed5QuestionsRow', ParamType.SupabaseRow),
          ),
        ),
        FFRoute(
          name: 'Qiuz',
          path: '/qiuz',
          builder: (context, params) => QiuzWidget(),
        ),
        FFRoute(
          name: 'Music',
          path: '/music',
          builder: (context, params) => MusicWidget(),
        ),
        FFRoute(
          name: 'Choreography',
          path: '/choreography',
          builder: (context, params) => ChoreographyWidget(),
        ),
        FFRoute(
          name: 'Circus',
          path: '/circus',
          builder: (context, params) => CircusWidget(),
        ),
        FFRoute(
          name: 'Theatre',
          path: '/theatre',
          builder: (context, params) => TheatreWidget(),
        ),
        FFRoute(
          name: 'IZO',
          path: '/izo',
          builder: (context, params) => IzoWidget(),
        ),
        FFRoute(
          name: 'ChangeProfile',
          path: '/changeProfile',
          builder: (context, params) => ChangeProfileWidget(
            usersRow:
                params.getParam<UsersRow>('usersRow', ParamType.SupabaseRow),
          ),
        ),
        FFRoute(
          name: 'Rate',
          path: '/rate',
          builder: (context, params) => RateWidget(),
        ),
        FFRoute(
          name: 'AddFriend',
          path: '/addFriend',
          builder: (context, params) => AddFriendWidget(),
        ),
        FFRoute(
          name: 'LogIn',
          path: '/logIn',
          builder: (context, params) => LogInWidget(),
        ),
        FFRoute(
          name: 'ResetPassword',
          path: '/resetPassword',
          builder: (context, params) => ResetPasswordWidget(),
        ),
        FFRoute(
          name: 'EmailSent',
          path: '/emailSent',
          builder: (context, params) => EmailSentWidget(),
        ),
        FFRoute(
          name: 'SignIn2',
          path: '/signIn2',
          builder: (context, params) => SignIn2Widget(),
        ),
        FFRoute(
          name: 'SignIn3',
          path: '/signIn3',
          builder: (context, params) => SignIn3Widget(
            name: params.getParam('name', ParamType.String),
            brithDate: params.getParam('brithDate', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'SignIn4',
          path: '/signIn4',
          builder: (context, params) => SignIn4Widget(
            artDirection: params.getParam('artDirection', ParamType.String),
            name: params.getParam('name', ParamType.String),
            birthDate: params.getParam('birthDate', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'SignIn5',
          path: '/signIn5',
          builder: (context, params) => SignIn5Widget(
            artDirection: params.getParam('artDirection', ParamType.String),
            knowledgeLevel: params.getParam('knowledgeLevel', ParamType.String),
            name: params.getParam('name', ParamType.String),
            birthDate: params.getParam('birthDate', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Route',
          path: '/route',
          builder: (context, params) => RouteWidget(),
        ),
        FFRoute(
          name: 'CourseMain',
          path: '/courseMain',
          builder: (context, params) => CourseMainWidget(),
        ),
        FFRoute(
          name: 'SuccessPage',
          path: '/successPage',
          builder: (context, params) => SuccessPageWidget(
            coursesRow: params.getParam<CoursesRow>(
                'coursesRow', ParamType.SupabaseRow),
          ),
        ),
        FFRoute(
          name: 'Piano',
          path: '/piano',
          builder: (context, params) => PianoWidget(),
        ),
        FFRoute(
          name: 'CourseList',
          path: '/courseList',
          builder: (context, params) => CourseListWidget(
            coursesRow: params.getParam<CoursesRow>(
                'coursesRow', ParamType.SupabaseRow),
          ),
        ),
        FFRoute(
          name: 'BuyCourse',
          path: '/buyCourse',
          builder: (context, params) => BuyCourseWidget(
            coursesRow: params.getParam<CoursesRow>(
                'coursesRow', ParamType.SupabaseRow),
          ),
        ),
        FFRoute(
          name: 'CourseLesson',
          path: '/courseLesson',
          builder: (context, params) => CourseLessonWidget(
            coursePurchased: params.getParam('coursePurchased', ParamType.bool),
            coursesLessonsRowList: params.getParam<CoursesLessonsRow>(
                'coursesLessonsRowList', ParamType.SupabaseRow, true),
            coursesRow: params.getParam<CoursesRow>(
                'coursesRow', ParamType.SupabaseRow),
            initialIndex: params.getParam('initialIndex', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'PlaylistFull',
          path: '/playlistFull',
          builder: (context, params) => PlaylistFullWidget(),
        ),
        FFRoute(
          name: 'QuestionsFull',
          path: '/questionsFull',
          builder: (context, params) => QuestionsFullWidget(),
        ),
        FFRoute(
          name: 'NotAuthorized',
          path: '/notAuthorized',
          builder: (context, params) => NotAuthorizedWidget(
            activeTab: params.getParam('activeTab', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'Route1',
          path: '/route1',
          builder: (context, params) => Route1Widget(),
        ),
        FFRoute(
          name: 'Route2',
          path: '/route2',
          builder: (context, params) => Route2Widget(),
        ),
        FFRoute(
          name: 'Route2End',
          path: '/route2End',
          builder: (context, params) => Route2EndWidget(),
        ),
        FFRoute(
          name: 'Route3',
          path: '/route3',
          builder: (context, params) => Route3Widget(),
        ),
        FFRoute(
          name: 'Route3Words',
          path: '/route3Words',
          builder: (context, params) => Route3WordsWidget(),
        ),
        FFRoute(
          name: 'Route3Draw',
          path: '/route3Draw',
          builder: (context, params) => Route3DrawWidget(),
        ),
        FFRoute(
          name: 'Route3WordsIndi',
          path: '/route3WordsIndi',
          builder: (context, params) => Route3WordsIndiWidget(),
        ),
        FFRoute(
          name: 'Route3WordsIndiSymbol',
          path: '/route3WordsIndiSymbol',
          builder: (context, params) => Route3WordsIndiSymbolWidget(),
        ),
        FFRoute(
          name: 'Route3Bonus',
          path: '/route3Bonus',
          builder: (context, params) => Route3BonusWidget(),
        ),
        FFRoute(
          name: 'Route5',
          path: '/route5',
          builder: (context, params) => Route5Widget(),
        ),
        FFRoute(
          name: 'Route6',
          path: '/route6',
          builder: (context, params) => Route6Widget(),
        ),
        FFRoute(
          name: 'Route6Text',
          path: '/route6Text',
          builder: (context, params) => Route6TextWidget(),
        ),
        FFRoute(
          name: 'Route7Lite',
          path: '/route7Lite',
          builder: (context, params) => Route7LiteWidget(),
        ),
        FFRoute(
          name: 'Route7Intermediate',
          path: '/route7Intermediate',
          builder: (context, params) => Route7IntermediateWidget(),
        ),
        FFRoute(
          name: 'Route7Hard',
          path: '/route7Hard',
          builder: (context, params) => Route7HardWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/splash.webp',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
