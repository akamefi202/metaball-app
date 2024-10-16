import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:metaball_app/modules/shared/models/news_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class NewsScreen extends StatelessWidget {
  final String? id;

  const NewsScreen({super.key, this.id});

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
          backgroundColor: ThemeColors.primaryBackground,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
            vertical: Spacing.pageVerticalSpacing(),
          ),
          child: FutureBuilder(
            future: DummyService.getNewsById(id!),
            builder: (context, snapshot) {
              final newsData = snapshot.data ?? NewsModel(id: "default_news");

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    newsData.type,
                    style: ThemeFonts.of(context).extraSmallTextSingle,
                  ),
                  SizedBox(height: Spacing.generate(1)),
                  Text(
                    newsData.title,
                    style: ThemeFonts.of(context).heading1,
                  ),
                  SizedBox(height: Spacing.generate(1)),
                  HtmlWidget(newsData.html)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
