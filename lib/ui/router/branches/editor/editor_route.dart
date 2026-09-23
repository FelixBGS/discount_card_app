part of '../../app_router.dart';

@TypedGoRoute<EditorRouteData>(
  path: "/editor",
  routes: [TypedGoRoute<EditorCardRouteData>(path: ":cardId")],
)
class EditorRouteData extends GoRouteData with $EditorRouteData {
  const EditorRouteData({this.barcodeNumber, this.barcodeFormat});

  final String? barcodeNumber;
  final BarcodeFormat? barcodeFormat;

  @override
  Widget build(BuildContext context, GoRouterState state) => EditorPage(
    args: EditorArgs.createFromQuery(
      barcodeNumber: barcodeNumber,
      barcodeFormat: barcodeFormat,
    ),
  );
}

class EditorCardRouteData extends GoRouteData with $EditorCardRouteData {
  const EditorCardRouteData({required this.cardId});

  final String cardId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EditorPage(args: EditorArgs.fromDetails(cardId: cardId));
}
