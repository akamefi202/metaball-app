import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/rounding/widgets/requester_card.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class RoundRequesterListScreen extends StatefulWidget {
  final String? roundId;

  const RoundRequesterListScreen({super.key, this.roundId});
  @override
  State<RoundRequesterListScreen> createState() =>
      _RoundRequesterListScreenState();
}

class _RoundRequesterListScreenState extends State<RoundRequesterListScreen> {
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
            icon: const Icon(Icons.chevron_left, size: 30.0),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: ThemeColors.primaryBackground,
          title: Text(l10n.requestersLabel,
              style: ThemeFonts.of(context).heading3),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: Spacing.pageHorizontalSpacing(),
            right: Spacing.pageHorizontalSpacing(),
            bottom: Spacing.pageVerticalSpacing(),
          ),
          child: Column(
            children: [
              const Separator(),
              SizedBox(height: Spacing.pageVerticalSpacing()),
              FutureBuilder(
                future: DummyService.getUserList(),
                builder: (context, snapshot) {
                  final result = snapshot.data ?? [];

                  return Column(
                      children:
                          result.map((e) => RequesterCard(model: e)).toList());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
