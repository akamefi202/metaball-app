import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/auth/screens/signin_screen.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_button.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class UnauthorizedScreen extends StatefulWidget {
  final String pageTitle;

  const UnauthorizedScreen({
    super.key,
    this.pageTitle = '',
  });
  @override
  State<UnauthorizedScreen> createState() => _UnauthorizedScreenState();
}

class _UnauthorizedScreenState extends State<UnauthorizedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
      top: true,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.pageHorizontalSpacing(),
          vertical: Spacing.generate(2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: Spacing.generate(4)),
            Text(widget.pageTitle, style: ThemeFonts.of(context).heading1),
            SizedBox(height: Spacing.generate(4)),
            Text(l10n.notSigninYetText, style: ThemeFonts.of(context).heading3),
            SizedBox(height: Spacing.extraSmallSpacing()),
            Text(l10n.checkInformationText,
                style: ThemeFonts.of(context).commonTextSingle),
            SizedBox(height: Spacing.generate(2)),
            RoundedButton(
              text: l10n.loginLabel,
              onPressed: () {
                debugPrint("unauthorized screen - sign in button is pressed");
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.0)),
                  ),
                  builder: (context) => const FractionallySizedBox(
                    heightFactor: 0.9,
                    child: SigninScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
