import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/modules/shared/widgets/switch_button.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class AccountInformScreen extends StatefulWidget {
  const AccountInformScreen({super.key});
  @override
  State<AccountInformScreen> createState() => _AccountInformScreenState();
}

class _AccountInformScreenState extends State<AccountInformScreen> {
  bool _notice = false;
  String _email = 'abc@abc.com';
  String _password = '※※※※※※※';
  String _phoneNumber = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Sizes.appBarHeight,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, size: 25.0),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: ThemeColors.primaryBackground,
          title: Text(l10n.accountInformLabel,
              style: ThemeFonts.of(context).heading3),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
            vertical: Spacing.pageVerticalSpacing(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.noticeLabel,
                          style: ThemeFonts.of(context).commonTextSingle),
                      Text(
                        _notice ? l10n.turnedOnLabel : l10n.turnedOffLabel,
                        style: ThemeFonts.of(context)
                            .smallTextSingle
                            .apply(color: ThemeColors.secondaryText),
                      ),
                    ],
                  ),
                  SwitchButton(
                    value: _notice,
                    onChanged: (value) {
                      setState(() {
                        _notice = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: Spacing.generate(2)),
              const Separator(),
              SizedBox(height: Spacing.generate(4)),
              Text(l10n.loginMethodLabel,
                  style: ThemeFonts.of(context).heading4),
              SizedBox(height: Spacing.generate(1)),
              const Separator(),
              InkWell(
                onTap: () {
                  debugPrint(
                      "account inform screen - email edit button is pressed");
                },
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  padding: EdgeInsets.all(Spacing.extraSmallSpacing()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.emailLabel,
                              style: ThemeFonts.of(context).commonTextSingle),
                          Text(
                            _email,
                            style: ThemeFonts.of(context)
                                .smallTextSingle
                                .apply(color: ThemeColors.secondaryText),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(l10n.editButton,
                              style: ThemeFonts.of(context).commonTextSingle),
                          SizedBox(width: Spacing.extraSmallSpacing()),
                          const Icon(Icons.chevron_right, size: 20.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Separator(),
              InkWell(
                onTap: () {
                  debugPrint(
                      "account inform screen - password edit button is pressed");
                },
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  padding: EdgeInsets.all(Spacing.extraSmallSpacing()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.passwordLabel,
                              style: ThemeFonts.of(context).commonTextSingle),
                          Text(
                            _password,
                            style: ThemeFonts.of(context)
                                .smallTextSingle
                                .apply(color: ThemeColors.secondaryText),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(l10n.editButton,
                              style: ThemeFonts.of(context).commonTextSingle),
                          SizedBox(width: Spacing.extraSmallSpacing()),
                          const Icon(Icons.chevron_right, size: 20.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Separator(),
              InkWell(
                onTap: () {
                  debugPrint(
                      "account inform screen - phone number edit button is pressed");
                },
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  padding: EdgeInsets.all(Spacing.extraSmallSpacing()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.phoneNumberLabel,
                              style: ThemeFonts.of(context).commonTextSingle),
                          Text(
                            _phoneNumber.isEmpty
                                ? l10n.notAddedYetLabel
                                : _phoneNumber,
                            style: ThemeFonts.of(context)
                                .smallTextSingle
                                .apply(color: ThemeColors.secondaryText),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(l10n.editButton,
                              style: ThemeFonts.of(context).commonTextSingle),
                          SizedBox(width: Spacing.extraSmallSpacing()),
                          const Icon(Icons.chevron_right, size: 20.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Separator(),
              InkWell(
                onTap: () {
                  debugPrint(
                      "account inform screen - sign out button is pressed");
                },
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  padding: EdgeInsets.all(Spacing.extraSmallSpacing()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(l10n.signOutLabel,
                          style: ThemeFonts.of(context).commonTextSingle),
                      const Icon(Icons.logout, size: 25.0),
                    ],
                  ),
                ),
              ),
              const Separator(),
            ],
          ),
        ),
      ),
    );
  }
}
