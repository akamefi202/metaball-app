import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/modules/shared/models/news_model.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.newsData,
  });

  final NewsModel newsData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("${RouteKey.news.location}/${newsData.id}");
      },
      child: Container(
        width: double.infinity,
        height: 80.0,
        padding: EdgeInsets.all(Spacing.extraSmallSpacing()),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ThemeColors.separator),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newsData.title,
                    style: ThemeFonts.of(context).commonTextSingle),
                Text(
                  newsData.type,
                  style: ThemeFonts.of(context)
                      .smallTextSingle
                      .apply(color: ThemeColors.secondaryText),
                ),
              ],
            ),
            const Icon(Icons.chevron_right, size: 20.0),
          ],
        ),
      ),
    );
  }
}
