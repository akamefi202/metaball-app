import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/modules/shared/models/blog_model.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class BlogItem extends StatefulWidget {
  const BlogItem({
    super.key,
    this.model,
  });

  final BlogModel? model;

  @override
  State<BlogItem> createState() => _BlogItemState();
}

class _BlogItemState extends State<BlogItem> {
  Future<void> onPressed() async {
    debugPrint("blog item is pressed");
  }

  @override
  Widget build(BuildContext context) {
    final blogData = widget.model!;
    final authorData = widget.model!.author ?? UserModel(id: "unknown_user");

    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.cover,
                    image: AssetImage(blogData.image),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Opacity(
                    opacity: 0.8,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Spacing.generate(2),
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: ThemeColors.primaryBackground,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        blogData.topic,
                        style: ThemeFonts.of(context).extraSmallTextSingle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Spacing.generate(1.5)),
            Text(
              blogData.title,
              style: ThemeFonts.of(context).heading4,
            ),
            SizedBox(height: Spacing.generate(1.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image(
                    width: 24.0,
                    height: 24.0,
                    image: AssetImage(authorData.avatar.isEmpty
                        ? Config.getDefaultAvatarUrl()
                        : authorData.avatar),
                  ),
                ),
                SizedBox(width: Spacing.extraSmallSpacing()),
                Text(
                  authorData.fullname,
                  style: ThemeFonts.of(context)
                      .extraSmallTextSingle
                      .apply(color: ThemeColors.secondaryText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
