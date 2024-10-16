import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/message/widgets/message_item.dart';
import 'package:metaball_app/modules/shared/models/message_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/custom_icon_button.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({super.key});
  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  String _feedbackText = '';

  @override
  void initState() {
    super.initState();
  }

  Widget renderMessages(List<MessageModel> messageList) {
    List<Widget> widgets = [];

    for (var e in messageList) {
      widgets.add(MessageItem(model: e));

      if (e.id != messageList.last.id) {
        widgets.add(SizedBox(height: Spacing.generate(3)));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widgets,
    );
  }

  Widget renderFeedbackInput() {
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            debugPrint("feedback list screen - picture button is pressed");
          },
          child: const Icon(
            Icons.image_outlined,
            size: 30.0,
          ),
        ),
        SizedBox(width: Spacing.generate(2)),
        Expanded(
          child: Container(
            height: 34.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: ThemeColors.componentBorder),
            ),
            child: Row(
              children: [
                const SizedBox(width: 17.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: ThemeFonts.of(context)
                          .smallTextSingle
                          .apply(color: ThemeColors.secondaryText),
                      hintText: l10n.textInputPlaceholder,
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    style: ThemeFonts.of(context).smallTextSingle,
                    onChanged: (value) {
                      setState(() {
                        debugPrint(
                            "feedback list screen - feedback text is inputed: $value");
                        _feedbackText = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: Spacing.generate(1)),
                InkWell(
                  onTap: () {
                    debugPrint(
                        "feedback list screen - upload button is pressed");
                  },
                  child: const Icon(
                    CupertinoIcons.arrow_up_circle_fill,
                    size: 24.0,
                  ),
                ),
                const SizedBox(width: 4.0),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Sizes.appBarHeight,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, size: 25.0),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            CustomIconButton(
              icon: const Icon(Icons.settings_outlined,
                  color: ThemeColors.primaryText),
              onPressed: () {
                debugPrint("chatting screen - settings button is pressed");
                context.push("${RouteKey.clubSettings.location}/default_club");
              },
            ),
            SizedBox(width: Spacing.generate(2)),
          ],
          shape: const Border(bottom: BorderSide(color: ThemeColors.separator)),
          centerTitle: true,
          title: Text("Pluslinks", style: ThemeFonts.of(context).heading3),
        ),
        body: FutureBuilder(
          future: DummyService.getMessageList(),
          builder: (context, snapshot) {
            final messageList = snapshot.data ?? [];

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: Spacing.pageHorizontalSpacing(),
                      vertical: Spacing.pageVerticalSpacing(),
                    ),
                    child: renderMessages(messageList),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Spacing.pageHorizontalSpacing(),
                    vertical: Spacing.generate(2),
                  ),
                  child: renderFeedbackInput(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
