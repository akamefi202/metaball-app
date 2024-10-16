import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/profile/widgets/news_item.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});
  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
            vertical: Spacing.pageVerticalSpacing(),
          ),
          child: FutureBuilder(
            future: DummyService.getNewsList(),
            builder: (context, snapshot) {
              final newsList = snapshot.data ?? [];
              List<Widget> widgets = [];

              widgets.add(const Separator());
              for (var e in newsList) {
                widgets.add(NewsItem(newsData: e));
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widgets,
              );
            },
          ),
        ),
      ),
    );
  }
}
