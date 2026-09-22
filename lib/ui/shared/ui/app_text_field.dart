import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widget_previews.dart';

import '../../util/utils.dart';
import '../themes/app_colors.dart';
import '../themes/app_dimensions.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.errorText,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.showClearButton = false,
    this.enabled = true,
    this.autofocus = false,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final int? maxLength;
  final int? minLines;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool showClearButton;
  final bool enabled;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  FocusNode? _internalFocusNode;

  FocusNode get _focusNode =>
      widget.focusNode ?? (_internalFocusNode ??= FocusNode());

  @override
  void dispose() {
    _internalFocusNode?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode == null && widget.focusNode != null) {
      _internalFocusNode?.dispose();
      _internalFocusNode = null;
    }
  }

  bool get _isMultiline => widget.maxLines > 1 || (widget.minLines ?? 1) > 1;
  bool get _hasLabel =>
      widget.labelText != null && widget.labelText!.isNotEmpty;
  bool get _hasError =>
      widget.errorText != null && widget.errorText!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decorationTheme = theme.inputDecorationTheme;
    final isPlain = !_hasLabel && widget.maxLength == null;

    return ListenableBuilder(
      listenable: Listenable.merge([widget.controller, _focusNode]),
      builder: (context, _) {
        final textField = _buildTextField(isPlain, theme, decorationTheme);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPlain)
              textField
            else
              _buildDecoratedField(textField, theme, decorationTheme),
            if (_hasError) _buildErrorText(theme),
          ],
        );
      },
    );
  }

  Widget _buildTextField(
    bool isPlain,
    ThemeData theme,
    InputDecorationThemeData decorationTheme,
  ) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      textAlignVertical: TextAlignVertical.center,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      keyboardType:
          widget.keyboardType ??
          (_isMultiline ? TextInputType.multiline : TextInputType.text),
      textInputAction:
          widget.textInputAction ??
          (_isMultiline ? TextInputAction.newline : TextInputAction.done),
      inputFormatters: widget.inputFormatters,
      style: theme.textTheme.titleMedium,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      buildCounter: (
        context, {
        required currentLength,
        required isFocused,
        required maxLength,
      }) => null,
      decoration: isPlain
          ? InputDecoration(
              hintText: widget.hintText,
              suffixIcon: _buildClearButton(),
              enabled: widget.enabled,
              hoverColor: Colors.transparent,
              enabledBorder: _hasError ? decorationTheme.errorBorder : null,
              focusedBorder: _hasError
                  ? decorationTheme.focusedErrorBorder
                  : null,
            )
          : InputDecoration(
              isCollapsed: true,
              contentPadding: EdgeInsets.zero,
              hintText: widget.hintText,
              filled: false,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
    );
  }

  Widget _buildDecoratedField(
    Widget textField,
    ThemeData theme,
    InputDecorationThemeData decorationTheme,
  ) {
    return InputDecorator(
      isFocused: _focusNode.hasFocus,
      isEmpty: widget.controller.text.isEmpty,
      decoration: InputDecoration(
        suffixIcon: _buildClearButton(),
        enabled: widget.enabled,
        enabledBorder: _hasError ? decorationTheme.errorBorder : null,
        focusedBorder: _hasError ? decorationTheme.focusedErrorBorder : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_hasLabel) ...[
            Text(
              widget.labelText!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.xxs),
          ],
          textField,
          const SizedBox(height: AppSpacing.sm),
          if (widget.maxLength != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${widget.controller.text.characters.length}/${widget.maxLength}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildErrorText(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Text(
        widget.errorText!,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.error,
        ),
      ),
    );
  }

  Widget? _buildClearButton() {
    if (!widget.showClearButton ||
        !widget.enabled ||
        widget.controller.text.isEmpty) {
      return null;
    }

    return IconButton(
      onPressed: () {
        widget.controller.clear();
        widget.onChanged?.call('');
      },
      constraints: const BoxConstraints.tightFor(width: 32, height: 32),
      padding: const EdgeInsets.all(7),
      icon: const Icon(Icons.cancel, size: 18),
    );
  }
}

@Preview(
  name: "Filled",
  group: "App Text Field",
  theme: appPreviewTheme,
  wrapper: whiteBackgroundPreview,
)
Widget nameFieldFilledPreview() => SizedBox(
  width: 300,
  child: AppTextField(
    controller: TextEditingController(text: "Пятёрочка"),
    labelText: "Название магазина",
    showClearButton: true,
  ),
);

@Preview(
  name: "Empty",
  group: "App Text Field",
  theme: appPreviewTheme,
  wrapper: whiteBackgroundPreview,
)
Widget nameFieldEmptyPreview() => SizedBox(
  width: 300,
  child: AppTextField(
    controller: TextEditingController(),
    labelText: "Название магазина",
    showClearButton: true,
  ),
);

@Preview(
  name: "Filled",
  group: "App Text Field",
  theme: appPreviewTheme,
  wrapper: whiteBackgroundPreview,
)
Widget barcodeFieldFilledPreview() => SizedBox(
  width: 300,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Номер штрихкода"),
      const SizedBox(height: AppSpacing.sm),
      AppTextField(
        controller: TextEditingController(text: "4601234567890"),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        showClearButton: true,
      ),
    ],
  ),
);

@Preview(
  name: "Empty",
  group: "App Text Field",
  theme: appPreviewTheme,
  wrapper: whiteBackgroundPreview,
)
Widget barcodeFieldEmptyPreview() => SizedBox(
  width: 300,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Номер штрихкода"),
      const SizedBox(height: AppSpacing.sm),
      AppTextField(
        controller: TextEditingController(),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        showClearButton: true,
      ),
    ],
  ),
);

@Preview(
  name: "Filled",
  group: "App Text Field",
  theme: appPreviewTheme,
  wrapper: whiteBackgroundPreview,
)
Widget descriptionFieldFilledPreview() => SizedBox(
  width: 300,
  child: AppTextField(
    controller: TextEditingController(text: "Пятёрочка"),
    labelText: "Скидки и акции в магазинах",
    minLines: 3,
    maxLines: 5,
    maxLength: 200,
  ),
);

@Preview(
  name: "Empty",
  group: "App Text Field",
  theme: appPreviewTheme,
  wrapper: whiteBackgroundPreview,
)
Widget descriptionFieldEmptyPreview() => SizedBox(
  width: 300,
  child: AppTextField(
    controller: TextEditingController(),
    labelText: "Скидки и акции в магазинах",
    minLines: 3,
    maxLines: 5,
    maxLength: 200,
  ),
);
