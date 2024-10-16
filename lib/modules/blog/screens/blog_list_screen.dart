import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/blog/widgets/blog_item.dart';
import 'package:metaball_app/modules/blog/widgets/circular_tab_button.dart';
import 'package:metaball_app/modules/shared/models/blog_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/circular_textfield.dart';
import 'package:metaball_app/modules/shared/widgets/custom_icon_button.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/box_shadow.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

enum BlogListMainTab {
  everyone,
  my,
  replied,
}

enum BlogListSubTab {
  all,
  experience,
  introduction,
  strangeNews,
}

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({super.key});
  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;
  BlogListSubTab _selectedSubTab = BlogListSubTab.all;

  @override
  void initState() {
    _tabCtrl = TabController(length: 3, vsync: this);
    _tabCtrl.addListener(() {
      //debugPrint("play tab view listener");
    });

    super.initState();
  }

  Widget renderTopBar() {
    final l10n = context.l10n;

    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.primaryBackground,
        boxShadow: [ThemeBoxShadow.baseLight],
      ),
      child: TabBar(
        padding: EdgeInsets.symmetric(horizontal: Spacing.generate(1)),
        controller: _tabCtrl,
        isScrollable: true,
        dividerColor: Colors.transparent,
        indicatorColor: ThemeColors.primaryText,
        unselectedLabelColor: ThemeColors.secondaryText,
        labelColor: ThemeColors.primaryText,
        labelStyle: ThemeFonts.of(context).heading4,
        tabAlignment: TabAlignment.start,
        tabs: [
          Tab(text: l10n.everyonePostTab),
          Tab(text: l10n.myPostTab),
          Tab(text: l10n.repliedPostTab),
        ],
      ),
    );
  }

  Widget renderSubTabs() {
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularTabButton(
          text: l10n.allPostTab,
          isSelected: _selectedSubTab == BlogListSubTab.all,
          onPressed: () {
            setState(() {
              _selectedSubTab = BlogListSubTab.all;
            });
          },
        ),
        CircularTabButton(
          text: l10n.experiencePostTab,
          isSelected: _selectedSubTab == BlogListSubTab.experience,
          onPressed: () {
            setState(() {
              _selectedSubTab = BlogListSubTab.experience;
            });
          },
        ),
        CircularTabButton(
          text: l10n.introductionPostTab,
          isSelected: _selectedSubTab == BlogListSubTab.introduction,
          onPressed: () {
            setState(() {
              _selectedSubTab = BlogListSubTab.introduction;
            });
          },
        ),
        CircularTabButton(
          text: l10n.strangeNewsTab,
          isSelected: _selectedSubTab == BlogListSubTab.strangeNews,
          onPressed: () {
            setState(() {
              _selectedSubTab = BlogListSubTab.strangeNews;
            });
          },
        ),
      ],
    );
  }

  Widget renderBlogList(List<BlogModel> blogList) {
    final l10n = context.l10n;
    List<Widget> blogWidgets = [];

    if (blogList.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: 200.0,
        child: Center(child: Text(l10n.noBlogText)),
      );
    }

    for (BlogModel e in blogList) {
      blogWidgets.add(BlogItem(model: e));

      if (e.id != blogList.last.id) {
        blogWidgets.add(SizedBox(height: Spacing.generate(4)));
      }
    }

    return Column(children: blogWidgets);
  }

  Widget renderTabViewPage(BlogListMainTab tab) {
    final l10n = context.l10n;
    AsyncValueGetter<List<BlogModel>> getBlogListFunc;

    switch (tab) {
      case BlogListMainTab.everyone:
        getBlogListFunc = DummyService.getEveryoneBlogList;
        break;
      case BlogListMainTab.my:
        getBlogListFunc = DummyService.getMyBlogList;
        break;
      case BlogListMainTab.replied:
        getBlogListFunc = DummyService.getRepliedBlogList;
        break;
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.pageHorizontalSpacing(),
        vertical: Spacing.generate(2),
      ),
      child: Column(
        children: [
          renderSubTabs(),
          SizedBox(height: Spacing.generate(3)),
          FutureBuilder(
            future: getBlogListFunc.call(),
            builder: (context, snapshot) {
              final result = snapshot.data ?? [];
              List<BlogModel> filteredResult = [];

              switch (_selectedSubTab) {
                case BlogListSubTab.all:
                  filteredResult = result;
                  break;
                case BlogListSubTab.experience:
                  filteredResult = result
                      .where((e) => e.topic == l10n.experiencePostTab)
                      .toList();
                  break;
                case BlogListSubTab.introduction:
                  filteredResult = result
                      .where((e) => e.topic == l10n.introductionPostTab)
                      .toList();
                  break;
                case BlogListSubTab.strangeNews:
                  filteredResult = result
                      .where((e) => e.topic == l10n.strangeNewsTab)
                      .toList();
                  break;
              }

              return renderBlogList(filteredResult);
            },
          ),
        ],
      ),
    );
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
          title: CircularTextField(
            placeholder: l10n.searchLabel,
            isSearch: true,
          ),
          actions: [
            CustomIconButton(
              icon: const Icon(CupertinoIcons.plus,
                  color: ThemeColors.primaryText),
              onPressed: () {
                debugPrint("blog list screen - create blog button is pressed");
                context.push(RouteKey.createBlog.location);
              },
            ),
            SizedBox(width: Spacing.generate(2)),
          ],
        ),
        body: Column(
          children: [
            renderTopBar(),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabCtrl,
                children: [
                  renderTabViewPage(BlogListMainTab.everyone),
                  renderTabViewPage(BlogListMainTab.my),
                  renderTabViewPage(BlogListMainTab.replied),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
