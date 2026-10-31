import 'package:flutter/material.dart';

/// Closes the alert that owns [context], at most once.
///
/// A second tap while the dialog is already leaving would call `Navigator.pop` with no
/// present route left (`Bad state: No element`) or, worse, pop the screen underneath.
/// Only the topmost route of this context is allowed to pop.
void closeAlertRoute(BuildContext context) {
  if (!context.mounted) return;
  final route = ModalRoute.of(context);
  if (route == null || !route.isCurrent) return;
  Navigator.of(context).pop();
}
