import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/shared/enums/circular_button_style.dart';
import 'package:metaball_app/modules/shared/models/round_model.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/circular_button.dart';
import 'package:metaball_app/modules/shared/widgets/custom_icon_button.dart';
import 'package:metaball_app/modules/shared/widgets/custom_outlined_button.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_button.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';
import 'package:metaball_app/utils/dates.dart';

class RoundScreen extends StatefulWidget {
  final String? id;

  const RoundScreen({super.key, this.id});
  @override
  State<RoundScreen> createState() => _RoundScreenState();
}

class _RoundScreenState extends State<RoundScreen> {
  bool isMine = false;

  @override
  void initState() {
    super.initState();
  }

  Widget renderMemberList(RoundModel roundData) {
    final l10n = context.l10n;
    final memberList = roundData.memberList;
    List<Widget> memberWidgets = [];

    for (UserModel e in memberList) {
      memberWidgets.add(
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                width: 40.0,
                height: 40.0,
                image: AssetImage(
                    e.avatar == '' ? Config.getDefaultAvatarUrl() : e.avatar),
              ),
            ),
            SizedBox(width: Spacing.generate(1)),
            Text(
              e.fullname,
              style: ThemeFonts.of(context)
                  .extraSmallTextSingle
                  .apply(color: ThemeColors.secondaryText),
            ),
          ],
        ),
      );

      if (e.id != memberList.last.id) {
        memberWidgets.add(SizedBox(width: Spacing.generate(3)));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.participatedLabel,
                style: ThemeFonts.of(context).smallTextSingle),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: Spacing.extraSmallSpacing(),
                horizontal: Spacing.generate(1),
              ),
              decoration: BoxDecoration(
                color: ThemeColors.neutral200,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  "${memberList.length}/${roundData.maxMemberCount}",
                  style: ThemeFonts.of(context)
                      .extraSmallTextSingle
                      .apply(color: ThemeColors.secondaryText),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Spacing.generate(2)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: memberWidgets,
          ),
        ),
        if (isMine) SizedBox(height: Spacing.generate(3)),
        if (isMine)
          CircularButton(
            onPressed: () {
              debugPrint("round screen - invite button is pressed");
              context.push("${RouteKey.roundRecruit.location}/${roundData.id}");
            },
            text: l10n.recruitButton,
            buttonStyle: CircularButtonStyle.outlined,
          )
      ],
    );
  }

  Widget renderScreenSpacing() {
    return Column(
      children: [
        SizedBox(height: Spacing.generate(3)),
        const Separator(),
        SizedBox(height: Spacing.generate(3)),
      ],
    );
  }

  Widget renderThemeList(RoundModel roundData) {
    List<String> themeList = roundData.themeList;
    List<Widget> themeWidgets = [];

    for (var topic in themeList) {
      themeWidgets.add(Container(
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.generate(1),
          vertical: Spacing.extraSmallSpacing(),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: ThemeColors.componentBorder),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          topic,
          style: ThemeFonts.of(context).extraSmallTextSingle,
        ),
      ));
      themeWidgets.add(SizedBox(width: Spacing.generate(1)));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: themeWidgets),
    );
  }

  Widget renderMap(RoundModel roundData) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.golfCourseLabel, style: ThemeFonts.of(context).heading2),
        SizedBox(height: Spacing.generate(2)),
        ClipRRect(
          borderRadius:
              BorderRadius.circular(ThemeBorderRadius.componentBorderRaduis()),
          child: const Image(
            width: double.infinity,
            height: 250.0,
            fit: BoxFit.cover,
            image: AssetImage("assets/images/map.png"),
          ),
        ),
        SizedBox(height: Spacing.extraSmallSpacing()),
        Text(
          roundData.golfCourseName,
          style: ThemeFonts.of(context)
              .smallTextSingle
              .apply(color: ThemeColors.secondaryText),
        ),
      ],
    );
  }

  Widget renderHostInform(RoundModel roundData) {
    final l10n = context.l10n;
    UserModel userData = roundData.host ?? UserModel(id: "default_user");

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: Image(
            width: 48.0,
            height: 48.0,
            image: AssetImage(userData.avatar.isEmpty
                ? Config.getDefaultAvatarUrl()
                : userData.avatar),
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${l10n.hostMemberLabel}: ${userData.fullname}",
                style: ThemeFonts.of(context).commonTextSingle,
              ),
              SizedBox(height: Spacing.extraSmallSpacing()),
              Text(
                "${l10n.averageScoreLabel} ${userData.averageScore} | ${l10n.experienceLabel} ${userData.experience}${l10n.yearLabel}",
                style: ThemeFonts.of(context)
                    .extraSmallTextSingle
                    .apply(color: ThemeColors.secondaryText),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderRoundInform(RoundModel roundData) {
    final formatter = NumberFormat.decimalPattern();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            SizedBox(
              width: Sizes.svgIconSize,
              height: Sizes.svgIconSize,
              child: Center(
                child: SvgPicture.asset("assets/images/calendar.svg"),
              ),
            ),
            SizedBox(width: Spacing.generate(1.5)),
            Text(getStringFromStartDateTime(
                roundData.startTime ?? DateTime.now())),
          ],
        ),
        SizedBox(height: Spacing.generate(1.5)),
        Row(
          children: [
            SizedBox(
              width: Sizes.svgIconSize,
              height: Sizes.svgIconSize,
              child: Center(
                child: SvgPicture.asset("assets/images/location.svg"),
              ),
            ),
            SizedBox(width: Spacing.generate(1.5)),
            Text(roundData.location),
          ],
        ),
        SizedBox(height: Spacing.generate(1.5)),
        Row(
          children: [
            SizedBox(
              width: 20.0,
              height: 18.0,
              child: Center(
                child: SvgPicture.asset("assets/images/cost.svg"),
              ),
            ),
            SizedBox(width: Spacing.generate(1.5)),
            Text(formatter.format(roundData.cost)),
          ],
        )
      ],
    );
  }

  Widget renderButtons() {
    final l10n = context.l10n;

    if (isMine) {
      return Row(
        children: [
          Expanded(
            flex: 4,
            child: CustomOutlinedButton(
              text: l10n.deleteButton,
              onPressed: () {
                debugPrint("round screen - delete button is clicked");
              },
              minWidth: 0,
            ),
          ),
          SizedBox(width: Spacing.generate(1)),
          Expanded(
            flex: 6,
            child: RoundedButton(
              text: l10n.editButton,
              onPressed: () {
                debugPrint("round screen - edit button is clicked");
              },
              minWidth: 0,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            flex: 4,
            child: CustomOutlinedButton(
              text: l10n.chatButton,
              onPressed: () {
                debugPrint("round screen - chat button is clicked");
              },
              minWidth: 0,
            ),
          ),
          SizedBox(width: Spacing.generate(1)),
          Expanded(
            flex: 6,
            child: RoundedButton(
              text: l10n.requestButton,
              onPressed: () {
                debugPrint("round screen - request button is clicked");
              },
              minWidth: 0,
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Sizes.appBarHeight,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, size: 30.0),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: ThemeColors.primaryBackground,
          actions: [
            CustomIconButton(
              icon: const Icon(Icons.favorite_outline,
                  color: ThemeColors.primaryText),
              onPressed: () {
                debugPrint("round screen - follow button is pressed");
              },
            ),
            SizedBox(width: Spacing.generate(2)),
            CustomIconButton(
              icon: SvgPicture.asset(
                "assets/images/upload.svg",
                width: Sizes.headerSvgIconSize,
                height: Sizes.headerSvgIconSize,
              ),
              onPressed: () {
                debugPrint("round screen - upload button is pressed");
              },
            ),
            SizedBox(width: Spacing.generate(2)),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
            vertical: Spacing.generate(2),
          ),
          child: FutureBuilder(
            future: DummyService.getRoundById(widget.id!),
            builder: (context, snapshot) {
              final roundData = snapshot.data != null
                  ? snapshot.data as RoundModel
                  : RoundModel(id: 'default_round');

              isMine = (roundData.host ?? UserModel(id: "default_user")).id ==
                  DummyService.getCurrentUser().id;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    roundData.title,
                    style: ThemeFonts.of(context).heading1,
                  ),
                  SizedBox(height: Spacing.generate(2)),
                  Container(
                    padding: EdgeInsets.all(Spacing.generate(1.5)),
                    decoration: BoxDecoration(
                      color: ThemeColors.secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      roundData.intro,
                      style: ThemeFonts.of(context).smallTextSingle,
                    ),
                  ),
                  SizedBox(height: Spacing.generate(3)),
                  renderThemeList(roundData),
                  renderScreenSpacing(),
                  renderRoundInform(roundData),
                  renderScreenSpacing(),
                  renderHostInform(roundData),
                  renderScreenSpacing(),
                  renderMemberList(roundData),
                  renderScreenSpacing(),
                  renderMap(roundData),
                  SizedBox(height: Spacing.generate(2)),
                  renderButtons(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
