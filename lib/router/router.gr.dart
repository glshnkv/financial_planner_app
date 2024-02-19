// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FinanceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FinanceScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    MortgageCalculatorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MortgageCalculatorScreen(),
      );
    },
    MortgageResultRoute.name: (routeData) {
      final args = routeData.argsAs<MortgageResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MortgageResultScreen(
          key: args.key,
          propertyValue: args.propertyValue,
          initialFee: args.initialFee,
          term: args.term,
          rate: args.rate,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [FinanceScreen]
class FinanceRoute extends PageRouteInfo<void> {
  const FinanceRoute({List<PageRouteInfo>? children})
      : super(
          FinanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinanceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MortgageCalculatorScreen]
class MortgageCalculatorRoute extends PageRouteInfo<void> {
  const MortgageCalculatorRoute({List<PageRouteInfo>? children})
      : super(
          MortgageCalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'MortgageCalculatorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MortgageResultScreen]
class MortgageResultRoute extends PageRouteInfo<MortgageResultRouteArgs> {
  MortgageResultRoute({
    Key? key,
    required double propertyValue,
    required double initialFee,
    required int term,
    required double rate,
    List<PageRouteInfo>? children,
  }) : super(
          MortgageResultRoute.name,
          args: MortgageResultRouteArgs(
            key: key,
            propertyValue: propertyValue,
            initialFee: initialFee,
            term: term,
            rate: rate,
          ),
          initialChildren: children,
        );

  static const String name = 'MortgageResultRoute';

  static const PageInfo<MortgageResultRouteArgs> page =
      PageInfo<MortgageResultRouteArgs>(name);
}

class MortgageResultRouteArgs {
  const MortgageResultRouteArgs({
    this.key,
    required this.propertyValue,
    required this.initialFee,
    required this.term,
    required this.rate,
  });

  final Key? key;

  final double propertyValue;

  final double initialFee;

  final int term;

  final double rate;

  @override
  String toString() {
    return 'MortgageResultRouteArgs{key: $key, propertyValue: $propertyValue, initialFee: $initialFee, term: $term, rate: $rate}';
  }
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
