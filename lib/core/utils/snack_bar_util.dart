import 'package:flutter/material.dart';

class SnackbarUtil {
  /// Displays a custom toast-style snackbar
  static void showToast({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: _getSnackbarBackground(context),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }

  /// Displays a standard snackbar with customizable color, icon, and position
  static void showSnackbar({
    required BuildContext context,
    required String title,
    required String message,
    Color? backgroundColor,
    IconData? icon,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    message,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor ?? Colors.grey,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Helper for success snackbar
  static void showSuccess(BuildContext context, String title, String message) {
    showSnackbar(
      context: context,
      title: title,
      message: message,
      backgroundColor: Colors.green[700],
      icon: Icons.check_circle_outline,
    );
  }

  /// Helper for warning snackbar
  static void showWarning(BuildContext context, String title, String message) {
    showSnackbar(
      context: context,
      title: title,
      message: message,
      backgroundColor: Colors.orange[700],
      icon: Icons.warning_amber_rounded,
    );
  }

  /// Helper for error snackbar
  static void showError(BuildContext context, String title, String message) {
    showSnackbar(
      context: context,
      title: title,
      message: message,
      backgroundColor: Colors.red[700],
      icon: Icons.error_outline,
    );
  }

  /// Determines the background color for the custom toast
  static Color _getSnackbarBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade400
        : Colors.grey;
  }
}
