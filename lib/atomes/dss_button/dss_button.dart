import 'package:flutter/material.dart';
import 'package:septeo_design_system/foundations/foundations_module.dart';

import 'dss_button_enums.dart';
import 'focus_outline_button_wrapper.dart';

/// A customizable button widget that uses the Septeo design system.
///
/// This widget wraps an [ElevatedButton] and provides the following features:
/// - Multiple button sizes ([DSSButtonSize]).
/// - Multiple style variants ([DSSButtonStyle]).
/// - Optional icons that can appear before and/or after the [label].
/// - Disabled state handling.
/// - Focus/hover styling with custom color resolution.
///
/// The button automatically configures visual density, padding, text style,
/// and colors (including background, foreground, and border) based on its
/// current state (hover, focus, disabled) and the style configuration.
class DSSButton extends StatelessWidget {
  /// The text label to display inside the button.
  final String label;

  /// Whether the button should be disabled.
  ///
  /// If `true`, the button's [onPressed] callback is set to `null`, and the
  /// disabled styling is applied.
  final bool disabled;

  /// The callback to be called when the button is pressed.
  ///
  /// If [disabled] is `true`, this will be ignored.
  final VoidCallback? onPressed;

  /// The size of the button, which affects its overall dimensions, padding,
  /// and text style. Defaults to [DSSButtonSize.medium].
  final DSSButtonSize size;

  /// The style type of the button, which determines how the button is colored
  /// in its various states (hover, focus, disabled, etc.). Defaults to
  /// [DSSButtonStyle.primaryMain].
  final DSSButtonStyle styleType;

  /// An optional icon that appears before the [label].
  final Icon? beforeIcon;

  /// An optional icon that appears after the [label].
  final Icon? afterIcon;

  /// An optional fixed [Size] that overrides the button's default
  /// [fixedSize] in the style. This can be used when you want the button
  /// to have a specific dimension regardless of its [label] or [size].
  final Size? fixedSize;

  /// Creates a custom Septeo-styled [ElevatedButton].
  ///
  /// [label] must not be null. By default, [DSSButtonSize.medium] is used for
  /// [size], and [DSSButtonStyle.primaryMain] is used for [styleType].
  ///
  /// If [disabled] is `true`, [onPressed] will be ignored.
  const DSSButton({
    super.key,
    required this.label,
    this.onPressed,
    this.size = DSSButtonSize.medium,
    this.styleType = DSSButtonStyle.primaryMain,
    this.disabled = false,
    this.beforeIcon,
    this.afterIcon,
    this.fixedSize,
  });

  @override
  Widget build(BuildContext context) {
    return FocusOutlineButtonWrapper(
      borderRadius: SepteoSpacings.xs,
      focusColor: SepteoColors.blue.shade600,
      focusWidth: 2,
      child: ElevatedButton(
        style: _buildButtonStyle(),
        onPressed: disabled ? null : onPressed,
        child: _buildChild(),
      ),
    );
  }

  /// Builds the [ButtonStyle] based on the [DSSButtonStyle] and other parameters.
  ButtonStyle _buildButtonStyle() {
    final resolvedColors = _resolveColors(styleType);

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) => resolvedColors.resolveBackgroundColor(states),
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) => resolvedColors.resolveForegroundColor(states),
      ),
      visualDensity: _getDensity(size),
      fixedSize: fixedSize != null ? WidgetStatePropertyAll(fixedSize!) : null,
      textStyle: WidgetStatePropertyAll<TextStyle>(_getTextStyle(size)),
      padding: WidgetStatePropertyAll(_getPadding(size)),
      shape: WidgetStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SepteoSpacings.xs),
          side: BorderSide(
            color: resolvedColors.resolveBorderColor(states),
            width: 1,
          ),
        ),
      ),
    );
  }

  /// Builds the child widget displayed inside the button, which includes
  /// optional [beforeIcon], the [label], and optional [afterIcon].
  Widget _buildChild() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (beforeIcon != null) ...[
          beforeIcon!,
          const SizedBox(width: SepteoSpacings.xs),
        ],
        Text(label),
        if (afterIcon != null) ...[
          const SizedBox(width: SepteoSpacings.xs),
          afterIcon!,
        ],
      ],
    );
  }

  /// Returns the [VisualDensity] based on the provided [DSSButtonSize].
  VisualDensity _getDensity(DSSButtonSize size) {
    switch (size) {
      case DSSButtonSize.small:
        return const VisualDensity(vertical: -4, horizontal: -4);
      case DSSButtonSize.medium:
        return const VisualDensity(vertical: -2, horizontal: -2);
      case DSSButtonSize.large:
        return const VisualDensity(vertical: 0, horizontal: 0);
    }
  }

  /// Returns the [EdgeInsets] (padding) based on the provided [DSSButtonSize].
  EdgeInsets _getPadding(DSSButtonSize size) {
    switch (size) {
      case DSSButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: SepteoSpacings.md,
          vertical: 0,
        );
      case DSSButtonSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: SepteoSpacings.md,
          vertical: SepteoSpacings.xxs,
        );
      case DSSButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: SepteoSpacings.xl,
          vertical: SepteoSpacings.xs,
        );
    }
  }

  /// Returns the [TextStyle] based on the provided [DSSButtonSize].
  TextStyle _getTextStyle(DSSButtonSize size) {
    switch (size) {
      case DSSButtonSize.small:
        return SepteoTextStyles.bodySmallInterBold;
      case DSSButtonSize.medium:
        return SepteoTextStyles.bodyMediumInterBold;
      case DSSButtonSize.large:
        return SepteoTextStyles.bodyMediumInterBold;
    }
  }

  /// Resolves the button's color configuration based on the provided [DSSButtonStyle].
  _ButtonColors _resolveColors(DSSButtonStyle style) {
    switch (style) {
      case DSSButtonStyle.primaryMain:
        return _ButtonColors(
          defaultBg: SepteoColors.blue.shade800,
          hoverBg: SepteoColors.blue.shade900,
          focusBg: SepteoColors.blue.shade800,
          hoverFocusBg: SepteoColors.blue.shade900,
          disabledBg: SepteoColors.grey.shade100,
          defaultText: Colors.white,
          hoverText: Colors.white,
          focusText: Colors.white,
          hoverFocusText: Colors.white,
          disabledText: SepteoColors.grey.shade600,
        );

      case DSSButtonStyle.primarySecond:
        return _ButtonColors(
          defaultBg: SepteoColors.blue.shade500,
          hoverBg: SepteoColors.blue.shade600,
          focusBg: SepteoColors.blue.shade500,
          hoverFocusBg: SepteoColors.blue.shade600,
          disabledBg: SepteoColors.grey.shade100,
          defaultText: Colors.white,
          hoverText: Colors.white,
          focusText: Colors.white,
          hoverFocusText: Colors.white,
          disabledText: SepteoColors.grey.shade600,
        );

      case DSSButtonStyle.secondaryMain:
        return _ButtonColors(
          defaultBg: Colors.white,
          hoverBg: SepteoColors.grey.shade50,
          focusBg: Colors.white,
          hoverFocusBg: SepteoColors.grey.shade50,
          disabledBg: Colors.white,
          defaultText: SepteoColors.blue.shade800,
          hoverText: SepteoColors.blue.shade900,
          focusText: SepteoColors.blue.shade800,
          hoverFocusText: SepteoColors.blue.shade900,
          disabledText: SepteoColors.grey.shade500,
          defaultBorder: SepteoColors.blue.shade800,
          hoverBorder: SepteoColors.blue.shade900,
          disabledBorder: SepteoColors.grey.shade100,
        );

      case DSSButtonStyle.secondarySecond:
        return _ButtonColors(
          defaultBg: Colors.white,
          hoverBg: SepteoColors.grey.shade50,
          focusBg: Colors.white,
          hoverFocusBg: SepteoColors.grey.shade50,
          disabledBg: Colors.white,
          defaultText: SepteoColors.blue.shade500,
          hoverText: SepteoColors.blue.shade600,
          focusText: SepteoColors.blue.shade500,
          hoverFocusText: SepteoColors.blue.shade600,
          disabledText: SepteoColors.grey.shade500,
          defaultBorder: SepteoColors.blue.shade500,
          hoverBorder: SepteoColors.blue.shade600,
          disabledBorder: SepteoColors.grey.shade100,
        );

      case DSSButtonStyle.linkMain:
        return _ButtonColors(
          defaultBg: Colors.white,
          hoverBg: SepteoColors.grey.shade50,
          focusBg: Colors.white,
          hoverFocusBg: SepteoColors.grey.shade50,
          disabledBg: Colors.white,
          defaultText: SepteoColors.blue.shade800,
          hoverText: SepteoColors.blue.shade900,
          focusText: SepteoColors.blue.shade800,
          hoverFocusText: SepteoColors.blue.shade900,
          disabledText: SepteoColors.grey.shade500,
        );

      case DSSButtonStyle.linkSecond:
        return _ButtonColors(
          defaultBg: Colors.white,
          hoverBg: SepteoColors.grey.shade50,
          focusBg: Colors.white,
          hoverFocusBg: SepteoColors.grey.shade50,
          disabledBg: Colors.white,
          defaultText: SepteoColors.blue.shade500,
          hoverText: SepteoColors.blue.shade600,
          focusText: SepteoColors.blue.shade500,
          hoverFocusText: SepteoColors.blue.shade600,
          disabledText: SepteoColors.grey.shade500,
        );
    }
  }
}

/// A private helper class that encapsulates the color configuration for
/// the different states of the button.
class _ButtonColors {
  final Color defaultBg;
  final Color hoverBg;
  final Color focusBg;
  final Color hoverFocusBg;
  final Color disabledBg;

  final Color defaultText;
  final Color hoverText;
  final Color focusText;
  final Color hoverFocusText;
  final Color disabledText;

  final Color? defaultBorder;
  final Color? hoverBorder;
  final Color? disabledBorder;

  const _ButtonColors({
    required this.defaultBg,
    required this.hoverBg,
    required this.focusBg,
    required this.hoverFocusBg,
    required this.disabledBg,
    required this.defaultText,
    required this.hoverText,
    required this.focusText,
    required this.hoverFocusText,
    required this.disabledText,
    this.defaultBorder,
    this.hoverBorder,
    this.disabledBorder,
  });

  /// Resolves the background color based on the current widget [states].
  Color resolveBackgroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return disabledBg;
    }
    if (states.contains(WidgetState.hovered) &&
        states.contains(WidgetState.focused)) {
      return hoverFocusBg;
    }
    if (states.contains(WidgetState.hovered)) {
      return hoverBg;
    }
    if (states.contains(WidgetState.focused)) {
      return focusBg;
    }
    return defaultBg;
  }

  /// Resolves the foreground color (typically for text/icons) based on
  /// the current widget [states].
  Color resolveForegroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return disabledText;
    }
    if (states.contains(WidgetState.hovered) &&
        states.contains(WidgetState.focused)) {
      return hoverFocusText;
    }
    if (states.contains(WidgetState.hovered)) {
      return hoverText;
    }
    if (states.contains(WidgetState.focused)) {
      return focusText;
    }
    return defaultText;
  }

  /// Resolves the border color based on the current widget [states].
  ///
  /// If [defaultBorder] is null, the border is transparent by default.
  Color resolveBorderColor(Set<WidgetState> states) {
    if (defaultBorder == null) return Colors.transparent;

    if (states.contains(WidgetState.disabled)) {
      return disabledBorder ?? Colors.transparent;
    }
    if (states.contains(WidgetState.hovered)) {
      return hoverBorder ?? defaultBorder!;
    }

    return defaultBorder!;
  }
}
