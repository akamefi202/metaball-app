import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/message/enums/message_sender.dart';
import 'package:metaball_app/modules/message/models/message_sender_model.dart';
import 'package:metaball_app/modules/message/widgets/sender_item.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/custom_icon_button.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;

  @override
  void initState() {
    _tabCtrl = TabController(length: 2, vsync: this);
    _tabCtrl.addListener(() {
      //debugPrint("message tab view listener");
    });

    super.initState();
  }

  Widget _renderTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomIconButton(
          icon: const Icon(Icons.star, color: ThemeColors.primaryText),
          onPressed: () {
            debugPrint("top bar favorite");
          },
        ),
        SizedBox(width: Spacing.generate(2)),
        CustomIconButton(
          icon: const Icon(Icons.search, color: ThemeColors.primaryText),
          onPressed: () {
            debugPrint("top bar search");
          },
        ),
      ],
    );
  }

  Widget _renderMessageSenderList(List<MessageSenderModel> senderList) {
    final l10n = context.l10n;

    if (senderList.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(
            vertical: 0, horizontal: Spacing.pageHorizontalSpacing()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/message.svg',
              width: Spacing.generate(3),
              height: Spacing.generate(3),
            ),
            SizedBox(height: Spacing.generate(3)),
            Text(l10n.noMessageText1,
                style: ThemeFonts.of(context).commonTextSingle),
            SizedBox(height: Spacing.generate(1)),
            Text(l10n.noMessageText2,
                textAlign: TextAlign.center,
                style: ThemeFonts.of(context)
                    .smallTextSingle
                    .apply(color: ThemeColors.secondaryText)),
          ],
        ),
      );
    }
    return SingleChildScrollView(
      child: Column(
          children: senderList.map((e) => SenderItem(model: e)).toList()),
    );
  }

  Widget _renderMessageTabBar() {
    final l10n = context.l10n;

    return TabBar(
      controller: _tabCtrl,
      isScrollable: true,
      labelColor: ThemeColors.neutral100,
      unselectedLabelColor: ThemeColors.neutral900,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(
          30,
        ),
        color: ThemeColors.neutral900,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding:
          EdgeInsets.symmetric(vertical: 0, horizontal: Spacing.generate(1)),
      labelPadding:
          EdgeInsets.symmetric(vertical: 0, horizontal: Spacing.generate(4)),
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.start,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      tabs: [
        const Tab(text: "DM"),
        Tab(text: l10n.clubsLabel),
      ],
    );
  }

  Widget _renderMessageTabView() {
    return FutureBuilder(
        future: DummyService.getMessageSenderList(),
        builder: (context, snapshot) {
          final result = snapshot.data ?? [];

          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabCtrl,
            children: [
              _renderMessageSenderList(result
                  .where((e) => e.senderType == MessageSender.user)
                  .toList()),
              _renderMessageSenderList(result
                  .where((e) => e.senderType == MessageSender.club)
                  .toList()),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
            vertical: Spacing.generate(2),
          ),
          child: Column(children: [
            _renderTopBar(),
            SizedBox(height: Spacing.extraSmallSpacing()),
            SizedBox(
              width: double.infinity,
              child: Text(l10n.messagePageLabel,
                  style: ThemeFonts.of(context).heading1),
            ),
            SizedBox(height: Spacing.generate(2)),
            _renderMessageTabBar(),
            SizedBox(height: Spacing.generate(3)),
            Expanded(child: _renderMessageTabView()),
          ]),
        ),
      ),
    );
  }
}
