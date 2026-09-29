import 'package:discount_card_app/ui/utils/preview_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  final VoidCallback? onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final transparentBackground = backgroundColor.a == 0;

    return ElevatedButton(
      onPressed: onPressed,
      style:
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            overlayColor: transparentBackground ? Colors.transparent : null,
            shadowColor: transparentBackground ? Colors.transparent : null,
          ).copyWith(
            elevation: transparentBackground
                ? const WidgetStatePropertyAll(0)
                : null,
          ),
      child: Text(text),
    );
  }
}

@Preview(name: "Primary Button", group: "App Button", theme: appPreviewTheme)
WidgetBuilder primaryButtonPreview() {
  return (BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: AppButton(
          onPressed: () {},
          text: "Сохранить",
          backgroundColor: colors.primary,
          textColor: colors.onPrimary,
        ),
      ),
    );
  };
}

@Preview(name: "Danger Button", group: "App Button", theme: appPreviewTheme)
WidgetBuilder dangerButtonPreview() {
  return (BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: AppButton(
          onPressed: () {},
          text: "Удалить",
          backgroundColor: colors.error,
          textColor: colors.onError,
        ),
      ),
    );
  };
}

@Preview(name: "Secondary Button", group: "App Button", theme: appPreviewTheme)
WidgetBuilder secondaryButtonPreview() {
  return (BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: AppButton(
          onPressed: () {},
          text: "Отмена",
          backgroundColor: colors.secondary,
          textColor: colors.onSecondary,
        ),
      ),
    );
  };
}
