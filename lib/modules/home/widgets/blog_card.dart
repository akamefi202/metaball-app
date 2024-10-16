import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/modules/shared/models/blog_model.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class BlogCard extends StatefulWidget {
  const BlogCard({
    super.key,
    this.model,
  });

  final BlogModel? model;

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  Future<void> onPressed() async {
    debugPrint("blog card is pressed");
    context.push("${RouteKey.blog.location}/${widget.model!.id}");
  }

  @override
  Widget build(BuildContext context) {
    final blogData = widget.model!;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              blogData.topic,
              style: ThemeFonts.of(context)
                  .heading6
                  .apply(color: ThemeColors.primaryButton),
            ),
            const SizedBox(height: 6.0),
            Text(
              blogData.title,
              style: ThemeFonts.of(context).heading3,
            ),
            const SizedBox(height: 6.0),
            Text(blogData.content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: ThemeFonts.of(context)
                    .bigTextSingle
                    .apply(color: ThemeColors.neutral600)),
            const SizedBox(height: 12.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                width: MediaQuery.sizeOf(context).width - Spacing.generate(4),
                height: 200.0,
                fit: BoxFit.cover,
                image: AssetImage(blogData.image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
