import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Extension for [BuildContext] to access [AppLocalizations] instance.
extension AppLocalizationsX on BuildContext {
  /// Returns [AppLocalizations] instance.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
