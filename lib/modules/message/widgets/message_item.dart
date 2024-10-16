import 'package:flutter/material.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/modules/shared/enums/message_type.dart';
import 'package:metaball_app/modules/shared/models/message_model.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class MessageItem extends StatefulWidget {
  const MessageItem({
    super.key,
    this.model,
  });

  final MessageModel? model;

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    final messageData = widget.model!;
    final senderData = widget.model!.sender!;
    final imageWidth =
        MediaQuery.sizeOf(context).width - Spacing.generate(6) - 80.0;
    List<Widget> widgets = [
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image(
          width: 40.0,
          height: 40.0,
          image: AssetImage(senderData.avatar.isEmpty
              ? Config.getDefaultAvatarUrl()
              : senderData.avatar),
        ),
      ),
      SizedBox(width: Spacing.generate(1)),
      Container(
        constraints: BoxConstraints(maxWidth: imageWidth),
        padding: EdgeInsets.all(Spacing.generate(1)),
        decoration: BoxDecoration(
          color: ThemeColors.secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(children: [
          Text(messageData.text, style: ThemeFonts.of(context).smallTextSingle),
          if (messageData.image.isNotEmpty)
            SizedBox(height: Spacing.generate(1)),
          if (messageData.image.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                width: imageWidth,
                height: 120.0,
                image: AssetImage(messageData.image),
                fit: BoxFit.cover,
              ),
            ),
        ]),
      ),
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: messageData.type == MessageType.sent
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: messageData.type == MessageType.sent
          ? widgets
          : widgets.reversed.toList(),
    );
  }
}
