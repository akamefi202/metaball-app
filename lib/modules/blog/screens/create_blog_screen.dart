import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/blog/widgets/topic_selection.dart';
import 'package:metaball_app/modules/shared/widgets/custom_dropdown_button.dart';
import 'package:metaball_app/modules/shared/widgets/custom_outlined_button.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_button.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_textarea.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_textfield.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class CreateBlogScreen extends StatefulWidget {
  const CreateBlogScreen({super.key});
  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  List<File> _thumbnailList = [];
  String _topic = '';
  String _title = '';
  String _description = '';
  bool _allowLeaveFeedback = true;

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
      _thumbnailList.add(file);
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
        SizedBox(height: Spacing.generate(3)),
        const Separator(),
        SizedBox(height: Spacing.generate(3)),
      ],
    );
  }

  Widget renderThumbnails() {
    List<Widget> widgets = [];

    for (var e in _thumbnailList) {
      widgets.add(
        ClipRRect(
          borderRadius:
              BorderRadius.circular(ThemeBorderRadius.componentBorderRaduis()),
          child: Image.file(
            e,
            width: double.infinity,
            height: 180.0,
            fit: BoxFit.cover,
          ),
        ),
      );
      widgets.add(SizedBox(height: Spacing.generate(2)));
    }

    widgets.add(GestureDetector(
      onTap: () {
        showImagePickerDialog(context);
      },
      child: Container(
        width: double.infinity,
        height: 180.0,
        decoration: BoxDecoration(
          color: ThemeColors.secondaryBackground,
          borderRadius:
              BorderRadius.circular(ThemeBorderRadius.componentBorderRaduis()),
        ),
        child: const Center(child: Icon(CupertinoIcons.plus, size: 50.0)),
      ),
    ));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
            vertical: Spacing.generate(2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l10n.classificationLabel,
                  style: ThemeFonts.of(context).heading3),
              SizedBox(height: Spacing.generate(1.5)),
              TopicSelection(
                options: [
                  l10n.experiencePostTab,
                  l10n.introductionPostTab,
                  l10n.strangeNewsTab,
                  l10n.otherLabel,
                ],
                selectedOption: _topic,
                onSelected: (value) {
                  setState(() {
                    _topic = value;
                  });
                },
              ),
              renderScreenSpacing(),
              Text(l10n.titleLabel, style: ThemeFonts.of(context).heading3),
              SizedBox(height: Spacing.generate(1.5)),
              RoundedTextField(
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                },
              ),
              renderScreenSpacing(),
              Text(l10n.imageVideoLabel,
                  style: ThemeFonts.of(context).heading3),
              SizedBox(height: Spacing.generate(1.5)),
              Text(
                l10n.imageUploadText,
                style: ThemeFonts.of(context)
                    .smallTextSingle
                    .apply(color: ThemeColors.secondaryText),
              ),
              SizedBox(height: Spacing.generate(1.5)),
              renderThumbnails(),
              renderScreenSpacing(),
              Text(l10n.detailedInformLabel,
                  style: ThemeFonts.of(context).heading3),
              SizedBox(height: Spacing.generate(1.5)),
              RoundedTextArea(
                placeholder: l10n.descriptionPlaceholder,
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
              ),
              renderScreenSpacing(),
              Text(l10n.leaveFeedbackLabel,
                  style: ThemeFonts.of(context).heading3),
              SizedBox(height: Spacing.generate(1.5)),
              CustomDropdownButton(
                items: [l10n.allowLabel, l10n.disallowLable],
                value:
                    _allowLeaveFeedback ? l10n.allowLabel : l10n.disallowLable,
                onChanged: (value) {
                  _allowLeaveFeedback = value == l10n.allowLabel;
                },
              ),
              SizedBox(height: Spacing.generate(4)),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomOutlinedButton(
                      text: l10n.cancelButton,
                      onPressed: () {
                        debugPrint(
                            "create blog screen - cancel button is clicked");
                      },
                      minWidth: 0,
                    ),
                  ),
                  SizedBox(width: Spacing.generate(1)),
                  Expanded(
                    flex: 6,
                    child: RoundedButton(
                      text: l10n.postButton,
                      onPressed: () {
                        debugPrint(
                            "create blog screen - post button is clicked");
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
