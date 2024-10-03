import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/modules/auth/providers/auth_provider.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:metaball_app/l10n/gen_l10n/app_localizations.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env.development');

  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => MainState();

  static MainState? of(BuildContext context) =>
      context.findAncestorStateOfType<MainState>();
}

class MainState extends State<Main> {
  final _router = Routes.router;
  final _locale = const Locale(Config.fallbackLocale);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) {
            return AuthProvider();
          },
        ),
      ],
      child: MaterialApp.router(
        title: Config.appTitle,
        //scaffoldMessengerKey: snackbarKey,
        theme: CustomTheme.of(context),
        locale: _locale,
        routerConfig: _router,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          //FormBuilderLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: Config.supportedLocales,
      ),
    );
  }
}
