import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/shared/widgets/custom_dropdown_button.dart';
import 'package:metaball_app/modules/shared/widgets/custom_outlined_button.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_button.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_textarea.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/theme/box_shadow.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class CreateClubScreen extends StatefulWidget {
  const CreateClubScreen({super.key});
  @override
  State<CreateClubScreen> createState() => _CreateClubScreenState();
}

class _CreateClubScreenState extends State<CreateClubScreen> {
  String _logoUrl = '';
  String _clubName = '';
  String _clubEligibility = '';
  String _ageRestriction = '';
  String _majorActiveRegion = '';
  String _clubDescription = '';

  File? _pickedImage;

  @override
  void initState() {
    super.initState();
  }

  void updateImage(XFile? pickedFile) {
    if (pickedFile == null) {
      return;
    }

    final imageType = pickedFile.path.split('.').last.toLowerCase();
    if (imageType != 'jpg' && imageType != 'png') {
      debugPrint("image type isn't png or jpg");
      return;
    }

    final File file = File(pickedFile.path);
    /*if (await file.length() > 4 * 1024) {
        debugPrint("image size is larger than 4MB");
        return;
      }*/

    setState(() {
      _pickedImage = file;
    });
  }

  Future<void> showImagePickerDialog(BuildContext context) async {
    final l10n = context.l10n;

    final picker = ImagePicker();
    final pickedFile = await showDialog<XFile>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text(l10n.pickImageLabel, style: ThemeFonts.of(context).heading3),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera),
                title: Text(l10n.cameraLabel,
                    style: ThemeFonts.of(context).smallTextSingle),
                onTap: () async {
                  Navigator.of(context)
                      .pop(await picker.pickImage(source: ImageSource.camera));
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: Text(l10n.galleryLabel,
                    style: ThemeFonts.of(context).smallTextSingle),
                onTap: () async {
                  Navigator.of(context)
                      .pop(await picker.pickImage(source: ImageSource.gallery));
                },
              ),
            ],
          ),
        );
      },
    );

    if (pickedFile != null) {
      debugPrint('picked image path: ${pickedFile.path}');
      updateImage(pickedFile);
    } else {
      debugPrint('no image selected');
    }
  }

  Widget renderScreenSpacing() {
    return Column(
      children: [
        SizedBox(height: Spacing.generate(2)),
        const Separator(),
        SizedBox(height: Spacing.generate(2)),
      ],
    );
  }

  Widget renderImageUpload() {
    final l10n = context.l10n;

    return Container(
      width: 200.0,
      height: 230.0,
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: _pickedImage != null
                ? Image.file(
                    _pickedImage!,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  )
                : Image(
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                    image: AssetImage(_logoUrl.isEmpty
                        ? Config.getDefaultLogoUrl()
                        : _logoUrl),
                  ),
          ),
          Positioned(
            left: 50,
            bottom: 0,
            child: InkWell(
              onTap: () async {
                showImagePickerDialog(context);
              },
              child: Container(
                  width: 100.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [ThemeBoxShadow.baseLight],
                    color: ThemeColors.primaryBackground,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt, size: 20.0),
                      SizedBox(width: Spacing.generate(1)),
                      Text(l10n.acceptButton),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderTextInput(
    String iconUrl,
    String placeholder,
    ValueChanged<String>? onChanged,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: Sizes.svgIconSize,
          height: Sizes.svgIconSize,
          child: Center(
            child: SvgPicture.asset(iconUrl),
          ),
        ),
        SizedBox(width: Spacing.generate(1.5)),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: ThemeFonts.of(context)
                  .smallTextSingle
                  .apply(color: ThemeColors.secondaryText),
              hintText: placeholder,
              fillColor: ThemeColors.primaryBackground,
              contentPadding: const EdgeInsets.all(0),
            ),
            style: ThemeFonts.of(context).smallTextSingle,
            onChanged: onChanged,
          ),
        ),
      ],
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
          centerTitle: true,
          title: Text(l10n.createClubLabel,
              style: ThemeFonts.of(context).heading3),
          backgroundColor: ThemeColors.primaryBackground,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
            vertical: Spacing.generate(2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              renderImageUpload(),
              SizedBox(height: Spacing.generate(3)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.logoUploadText,
                  style: const TextStyle(
                      fontSize: 13.0, color: ThemeColors.secondaryText),
                ),
              ),
              SizedBox(height: Spacing.generate(6)),
              renderTextInput(
                "assets/images/envelope.svg",
                l10n.clubNameLabel,
                (value) {
                  setState(() {
                    _clubName = value;
                  });
                },
              ),
              renderScreenSpacing(),
              renderTextInput(
                "assets/images/bag.svg",
                l10n.memberQualificationLabel,
                (value) {
                  setState(() {
                    _clubEligibility = value;
                  });
                },
              ),
              renderScreenSpacing(),
              renderTextInput(
                "assets/images/balloon.svg",
                l10n.ageRestrictionLabel,
                (value) {
                  setState(() {
                    _ageRestriction = value;
                  });
                },
              ),
              renderScreenSpacing(),
              renderTextInput(
                "assets/images/location.svg",
                l10n.majorActiveRegionLabel,
                (value) {
                  setState(() {
                    _majorActiveRegion = value;
                  });
                },
              ),
              renderScreenSpacing(),
              SizedBox(height: Spacing.generate(2)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.clubIntroLabel,
                  style: ThemeFonts.of(context).heading3,
                ),
              ),
              SizedBox(height: Spacing.generate(2)),
              RoundedTextArea(
                placeholder: l10n.descriptionPlaceholder,
                onChanged: (value) {
                  setState(() {
                    _clubDescription = value;
                  });
                },
              ),
              SizedBox(height: Spacing.generate(4)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.memberQualificationLabel,
                  style: ThemeFonts.of(context).heading3,
                ),
              ),
              SizedBox(height: Spacing.generate(2)),
              CustomDropdownButton(
                placeholder: l10n.adminReviewLabel,
              ),
              SizedBox(height: Spacing.generate(4)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.createRoundPermissionLabel,
                  style: ThemeFonts.of(context).heading3,
                ),
              ),
              SizedBox(height: Spacing.generate(2)),
              CustomDropdownButton(
                placeholder: l10n.presidentAdminPlaceholder,
              ),
              SizedBox(height: Spacing.generate(6)),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomOutlinedButton(
                      text: l10n.saveButton,
                      onPressed: () {
                        debugPrint(
                            "create club screen - save button is clicked");
                      },
                      minWidth: 0,
                    ),
                  ),
                  SizedBox(width: Spacing.generate(1)),
                  Expanded(
                    flex: 6,
                    child: RoundedButton(
                      text: l10n.createButton,
                      onPressed: () {
                        debugPrint(
                            "create club screen - create button is clicked");
                      },
                      minWidth: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
