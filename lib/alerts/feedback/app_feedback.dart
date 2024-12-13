import 'package:flutter/material.dart';
import 'package:nashmi_app/main.dart';
import 'package:nashmi_app/utils/base_extensions.dart';

extension AppFeedbacks on BuildContext {
  void showSnackBar(
    String msg, {
    int duration = 4,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this)
        .showSnackBar(
          SnackBar(
            content: Text(msg),
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: duration),
            action: action,
          ),
        )
        .closed
        .then((value) {
      ScaffoldMessenger.of(rootNavigatorKey.currentContext!).removeCurrentSnackBar();
    });
  }

  Future<T?> showDialog<T>({
    String? titleText,
    String? confirmTitle,
    Widget? titleWidget,
    String? bodyText,
    Widget? bodyWidget,
    List<Widget>? actions,
    double? maxWidth,
    Color? confirmButtonBackgroundColor,
    Color? cancelButtonForegroundColor,
    bool warning = false,
    EdgeInsetsGeometry? actionsPadding,
    bool barrierDismissible = true,
  }) async {
    return showGeneralDialog<T?>(
      barrierDismissible: barrierDismissible,
      barrierLabel: '',
      context: this,
      transitionBuilder: (context, a1, a2, widget) {
        return Opacity(
          opacity: a1.value,
          child: AlertDialog(
            title: titleWidget ?? Text(titleText!),
            actionsPadding: actionsPadding,
            content: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth ?? 400),
              child: bodyWidget ?? Text(bodyText!),
            ),
            actions: actions ??
                [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: cancelButtonForegroundColor ?? (warning ? context.colorScheme.onSurface : null),
                    ),
                    child: Text(context.appLocalization.cancel),
                  ),
                  Theme(
                    data: ThemeData(),
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: confirmButtonBackgroundColor ?? (warning ? context.colorScheme.error : null),
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text(context.appLocalization.confirm),
                    ),
                  ),
                ],
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 240),
      pageBuilder: (BuildContext context, animation1, animation2) {
        return const SizedBox.shrink();
      },
    ).then<T?>((value) => value);
  }

  Future<T?> showBottomSheet<T>(
    BuildContext context, {
    required Widget Function(BuildContext) builder,
    double? maxHeight,
  }) {
    return showModalBottomSheet<T?>(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      showDragHandle: true,
      backgroundColor: context.colorScheme.surface,
      useSafeArea: true,
      constraints: maxHeight == null ? null : BoxConstraints(maxHeight: maxHeight),
      builder: builder,
    ).then((value) => value);
  }
}
