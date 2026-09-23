// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$appShellRouteData, $editorRouteData];

RouteBase get $appShellRouteData => StatefulShellRouteData.$route(
  navigatorContainerBuilder: AppShellRouteData.$navigatorContainerBuilder,
  factory: $AppShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/home',
          hasOverriddenOnExit: false,
          factory: $HomeRouteData._fromState,
          routes: [
            GoRouteData.$route(
              path: 'details',
              hasOverriddenOnExit: false,
              parentNavigatorKey: DetailsRouteData.$parentNavigatorKey,
              factory: $DetailsRouteData._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/scanner',
          hasOverriddenOnExit: false,
          factory: $ScannerRouteData._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/settings',
          hasOverriddenOnExit: false,
          factory: $SettingsRouteData._fromState,
        ),
      ],
    ),
  ],
);

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      const AppShellRouteData();
}

mixin $HomeRouteData on GoRouteData {
  static HomeRouteData _fromState(GoRouterState state) => const HomeRouteData();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $DetailsRouteData on GoRouteData {
  static DetailsRouteData _fromState(GoRouterState state) =>
      const DetailsRouteData();

  @override
  String get location => GoRouteData.$location('/home/details');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ScannerRouteData on GoRouteData {
  static ScannerRouteData _fromState(GoRouterState state) =>
      const ScannerRouteData();

  @override
  String get location => GoRouteData.$location('/scanner');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRouteData on GoRouteData {
  static SettingsRouteData _fromState(GoRouterState state) =>
      const SettingsRouteData();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editorRouteData => GoRouteData.$route(
  path: '/editor',
  hasOverriddenOnExit: false,
  factory: $EditorRouteData._fromState,
  routes: [
    GoRouteData.$route(
      path: ':cardId',
      hasOverriddenOnExit: false,
      factory: $EditorCardRouteData._fromState,
    ),
  ],
);

mixin $EditorRouteData on GoRouteData {
  static EditorRouteData _fromState(GoRouterState state) => EditorRouteData(
    barcodeNumber: state.uri.queryParameters['barcode-number'],
    barcodeFormat: _$convertMapValue(
      'barcode-format',
      state.uri.queryParameters,
      _$BarcodeFormatEnumMap._$fromName,
    ),
  );

  EditorRouteData get _self => this as EditorRouteData;

  @override
  String get location => GoRouteData.$location(
    '/editor',
    queryParams: {
      if (_self.barcodeNumber != null) 'barcode-number': _self.barcodeNumber,
      if (_self.barcodeFormat != null)
        'barcode-format': _$BarcodeFormatEnumMap[_self.barcodeFormat!],
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

const _$BarcodeFormatEnumMap = {
  BarcodeFormat.ean8: 'ean8',
  BarcodeFormat.ean13: 'ean13',
  BarcodeFormat.code39: 'code39',
  BarcodeFormat.code128: 'code128',
  BarcodeFormat.qrCode: 'qr-code',
  BarcodeFormat.unknown: 'unknown',
};

mixin $EditorCardRouteData on GoRouteData {
  static EditorCardRouteData _fromState(GoRouterState state) =>
      EditorCardRouteData(cardId: state.pathParameters['cardId']!);

  EditorCardRouteData get _self => this as EditorCardRouteData;

  @override
  String get location =>
      GoRouteData.$location('/editor/${Uri.encodeComponent(_self.cardId)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

extension<T extends Enum> on Map<T, String> {
  T? _$fromName(String? value) =>
      entries.where((element) => element.value == value).firstOrNull?.key;
}
