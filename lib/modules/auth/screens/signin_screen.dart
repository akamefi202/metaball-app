import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/auth/widgets/social_signin_button.dart';
import 'package:metaball_app/modules/message/enums/message_sender_type.dart';
import 'package:metaball_app/modules/message/models/message_sender_model.dart';
import 'package:metaball_app/modules/message/widgets/message_sender_item.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/custom_icon_button.dart';
import 'package:metaball_app/modules/shared/widgets/custom_outlined_button.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_button.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_textfield.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
      top: true,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: Sizes.appBarHeight,
            leading: IconButton(
              icon: const Icon(Icons.close, size: 25.0),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title:
                Text(l10n.loginLabel, style: ThemeFonts.of(context).heading3),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: Spacing.pageHorizontalSpacing(),
              vertical: Spacing.generate(2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RoundedTextField(
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  placeholder: l10n.emailLabel,
                ),
                SizedBox(height: Spacing.generate(2)),
                RoundedTextField(
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  placeholder: l10n.passwordLabel,
                ),
                SizedBox(height: Spacing.generate(2)),
                RoundedButton(
                  text: l10n.loginLabel,
                  onPressed: () {
                    debugPrint("signin screen - signin button is pressed");
                  },
                ),
                SizedBox(height: Spacing.generate(3)),
                const Separator(),
                SizedBox(height: Spacing.generate(3)),
                Text(l10n.registerFirstText,
                    style: ThemeFonts.of(context).smallTextSingle),
                SizedBox(height: Spacing.generate(1)),
                CustomOutlinedButton(
                  text: l10n.signupLabel,
                  onPressed: () {
                    debugPrint("signin screen - signup button is pressed");
                  },
                ),
                SizedBox(height: Spacing.generate(3)),
                Row(children: [
                  const Expanded(child: Separator()),
                  SizedBox(width: Spacing.generate(1)),
                  Text(
                    l10n.otherMethodLabel,
                    style: ThemeFonts.of(context)
                        .commonTextSingle
                        .apply(color: ThemeColors.secondaryText),
                  ),
                  SizedBox(width: Spacing.generate(1)),
                  const Expanded(child: Separator()),
                ]),
                SizedBox(height: Spacing.generate(3)),
                SocialSigninButton(
                  text: l10n.googleSigninLabel,
                  icon: SvgPicture.asset("assets/images/google.svg"),
                  onPressed: () {
                    debugPrint(
                        "signin screen - google signin button is pressed");
                  },
                ),
                SizedBox(height: Spacing.generate(2)),
                SocialSigninButton(
                  text: l10n.facebookSigninLabel,
                  icon: SvgPicture.asset("assets/images/facebook.svg"),
                  onPressed: () {
                    debugPrint(
                        "signin screen - google facebook button is pressed");
                  },
                ),
                SizedBox(height: Spacing.generate(2)),
                SocialSigninButton(
                  text: l10n.lineSigninLabel,
                  icon: SvgPicture.asset("assets/images/line.svg"),
                  onPressed: () {
                    debugPrint("signin screen - line signin button is pressed");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
