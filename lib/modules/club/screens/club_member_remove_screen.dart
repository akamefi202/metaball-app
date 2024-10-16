import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/club/widgets/club_card.dart';
import 'package:metaball_app/modules/club/widgets/club_member_remove_item.dart';
import 'package:metaball_app/modules/home/widgets/event_card.dart';
import 'package:metaball_app/modules/rounding/widgets/recruit_item.dart';
import 'package:metaball_app/modules/shared/models/club_model.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/circular_textfield.dart';
import 'package:metaball_app/modules/shared/widgets/custom_icon_button.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class ClubMemberRemoveScreen extends StatefulWidget {
  final String? clubId;

  const ClubMemberRemoveScreen({super.key, this.clubId});
  @override
  State<ClubMemberRemoveScreen> createState() => _ClubMemberRemoveScreenState();
}

class _ClubMemberRemoveScreenState extends State<ClubMemberRemoveScreen> {
  int _clubMemberCount = 0;
  String _searchText = "";

  @override
  void initState() {
    super.initState();

    //ClubModel clubData = DummyService.getClubById(widget.clubId!);
    //_clubMemberCount = clubData.memberCount;
  }

  Widget renderSearchBar() {
    final l10n = context.l10n;

    return CircularTextField(
      placeholder: l10n.searchByNameLabel,
      isSearch: true,
      onChanged: (value) {
        setState(() {
          _searchText = value;
        });
      },
    );
  }

  Widget renderMemberList(List<UserModel> memberList) {
    List<Widget> widgets = [];

    for (UserModel member in memberList) {
      widgets.add(ClubMemberRemoveItem(model: member));
    }

    return Column(
      children: widgets,
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
          title: Text("${l10n.clubMembersLabel}($_clubMemberCount)",
              style: ThemeFonts.of(context).heading3),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: Spacing.pageHorizontalSpacing(),
            right: Spacing.pageHorizontalSpacing(),
            bottom: Spacing.generate(2),
          ),
          child: FutureBuilder(
            future: DummyService.getClubMemberListByClubId(widget.clubId!),
            builder: (context, snapshot) {
              final memberList = snapshot.data ?? [];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Separator(),
                  SizedBox(height: Spacing.generate(2)),
                  renderSearchBar(),
                  SizedBox(height: Spacing.generate(3)),
                  Expanded(
                    child: SingleChildScrollView(
                      child: renderMemberList(memberList),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
