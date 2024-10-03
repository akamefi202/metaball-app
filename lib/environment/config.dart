import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:metaball_app/environment/environment.enum.dart';

class Config {
  static Environment env = Environment.development;

  static const int maxDashboardRaces = 5;
  static const fallbackLocale = 'ja';
  static const supportedLocales = [
    Locale('en'),
    Locale('ja'),
  ];

  static String get tenantId {
    return _getValue('TENANT_ID');
  }

  static String get apiUrl {
    return _getValue('API_URL');
  }

  static String get frontEndUrl {
    return _getValue('FRONTEND_URL');
  }

  static String get identityToolkitUrl {
    return _getValue('IDENTITY_TOOLKIT_URL');
  }

  static String get dynamicLinkDomain {
    return _getValue('DYNAMIC_LINK_DOMAIN');
  }

  static String get dynamicLinkDeepLinkBaseUrl {
    return _getValue('DYNAMIC_LINK_DEEP_LINK_BASE_URL');
  }

  static String get appTitle {
    return _getValue('APP_TITLE', 'Urban Hero');
  }

  static String get passwordPattern {
    return r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  }

  static bool get useEmulator {
    final value = _getValue('USE_EMULATOR', 'false');

    return value == 'true';
  }

  static String get emulatorHost {
    return _getValue('EMULATOR_HOST', 'localhost');
  }

  static bool get logRequest {
    final value = _getValue('LOG_REQUEST', 'false');

    return value == 'true';
  }

  static Locale parseLocale(String? localeData) {
    return supportedLocales
            .firstWhereOrNull((item) => item.languageCode == localeData) ??
        const Locale(fallbackLocale);
  }

  static String _getValue(String name, [String? fallback]) {
    final value = dotenv.env[name];

    if (value == null && fallback != null) {
      return fallback;
    }

    if (value == null) {
      throw Exception('$name must be supported!');
    }

    return value;
  }

  static String getDefaultAvatar() {
    return 'assets/images/default_avatar.png';
  }
}
