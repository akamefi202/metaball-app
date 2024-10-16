import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/modules/message/models/message_sender_model.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class MessageSenderItem extends StatefulWidget {
  const MessageSenderItem({
    super.key,
    this.model,
  });

  final MessageSenderModel? model;

  @override
  State<MessageSenderItem> createState() => _MessageSenderItemState();
}

class _MessageSenderItemState extends State<MessageSenderItem> {
  Future<void> onPressed() async {
    debugPrint("message sender item is pressed");
    context.push(RouteKey.chatting.location);
  }

  String getLastDate(DateTime date) {
    if (Config.fallbackLocale == 'ja') {
      return "${date.month}月${date.day}日";
    } else {
      return "${date.month}/${date.day}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final senderData = widget.model!;

    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Color(0xFFDDDDDD)),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: Spacing.generate(1),
          horizontal: Spacing.extraSmallSpacing(),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image(
                width: 48.0,
                height: 48.0,
                image: AssetImage(senderData.senderAvatar.isEmpty
                    ? Config.getDefaultAvatarUrl()
                    : senderData.senderAvatar),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(senderData.senderName,
                          style: ThemeFonts.of(context).commonTextSingle),
                      Text(
                        getLastDate(senderData.lastTime ?? DateTime.now()),
                        style: const TextStyle(
                          fontSize: 9.0,
                          color: ThemeColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    senderData.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ThemeFonts.of(context)
                        .smallTextSingle
                        .apply(color: ThemeColors.secondaryText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
