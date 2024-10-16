import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  ///
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get startingSoonLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filterLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Clubs'**
  String get clubsLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'View More'**
  String get viewMoreLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Recommended Events'**
  String get recommendedEventsLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Popular Themes'**
  String get popularThemesLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'View All Themes'**
  String get viewAllThemesLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Rounding'**
  String get roundingLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Participation'**
  String get participationLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get messageLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAllLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Personal Page'**
  String get profilePageLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Automatic Recruitment'**
  String get autoRecruitLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'View Profile'**
  String get viewProfileLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Latest News'**
  String get latestNewsTagLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Account Information'**
  String get accountInformLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Connection'**
  String get connectionLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get postLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get servicesLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Customer Service'**
  String get customerServiceLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'User Guide'**
  String get userGuideLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'User Agreement'**
  String get userAgreementLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Company Information'**
  String get companyInformLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messagePageLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'You haven\'t received any messages yet'**
  String get noMessageText1;

  ///
  ///
  /// In en, this message translates to:
  /// **'If you receive a new message, it will appear here.'**
  String get noMessageText2;

  ///
  ///
  /// In en, this message translates to:
  /// **'Rounding Recruitment'**
  String get roundingRecruitLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Hosted'**
  String get hostLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Requested'**
  String get requestLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Invited'**
  String get inviteLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Followed'**
  String get followLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completeLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get joinTab;

  ///
  ///
  /// In en, this message translates to:
  /// **'Host'**
  String get hostTab;

  ///
  ///
  /// In en, this message translates to:
  /// **'Golf course, username, etc.'**
  String get roundSearchPlaceholder;

  ///
  ///
  /// In en, this message translates to:
  /// **'Hashtag'**
  String get hashtagLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get personalLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Host Place'**
  String get hostPlaceLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Japan'**
  String get allCountryLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Kanto'**
  String get kantoLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Hokkaido'**
  String get hokkaidoLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Kansai'**
  String get kansaiLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Tohoku'**
  String get tohokuLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Chubu'**
  String get chubuLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Chugoku'**
  String get chugokuLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Shikoku'**
  String get shikokuLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Kyushu'**
  String get kyushuLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Member Count'**
  String get memberCountLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDatePlaceholder;

  ///
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get startTimePlaceholder;

  ///
  ///
  /// In en, this message translates to:
  /// **'Cost'**
  String get costPlaceholder;

  ///
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get basicInformLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titlePlaceholder;

  ///
  ///
  /// In en, this message translates to:
  /// **'Brief introductions, etc. Up to 00 characters.'**
  String get descriptionPlaceholder;

  ///
  ///
  /// In en, this message translates to:
  /// **'Golf Course'**
  String get golfCourseLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get addressNamePlaceholder;

  ///
  ///
  /// In en, this message translates to:
  /// **'Detailed Address'**
  String get detailedAddressPlaceholder;

  ///
  ///
  /// In en, this message translates to:
  /// **'Themes'**
  String get themeLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Restrictions (Optional)'**
  String get restrictionLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get ageLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Host'**
  String get hostButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Blog'**
  String get blogLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'In Promotion'**
  String get inPromotionLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get trendingLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Title is editable in background'**
  String get titleEditableBackgroundLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Latest'**
  String get latestLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Welcome Newcomers'**
  String get themeWelcomeNewcomerLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Weekend Golf'**
  String get themeWeekendGolfLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Professional Battle'**
  String get themeProBattleLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'2 Days & 1 Night'**
  String get theme1n2dLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Free Participation'**
  String get themeFreeLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Drinking Party Available'**
  String get themeDrinkLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get themeEnteringLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Couples'**
  String get themeMarriageLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Club Battle'**
  String get themeClubBattleLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'70 YO'**
  String get restriction70yoLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'80 YO'**
  String get restriction80yoLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'90 YO'**
  String get restriction90yoLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'100 YO'**
  String get restriction100yoLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get femaleLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get maleLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'No Restriction'**
  String get noRestrictionLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'There aren\'t any rounds yet'**
  String get noRoundText;

  ///
  ///
  /// In en, this message translates to:
  /// **'Requesters'**
  String get requestersLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get rejectButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get acceptButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get removeButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Average Score'**
  String get averageScoreLabel;

  /// No description provided for @experienceLabel.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experienceLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Average Number Per Month'**
  String get monthAverageNumberLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get pointLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get yearLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Times'**
  String get numberLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'YO'**
  String get yoLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get occupationLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Affiliation'**
  String get affiliationLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get followingLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'\'s'**
  String get sLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Everyone\'s Posts'**
  String get everyonePostTab;

  ///
  ///
  /// In en, this message translates to:
  /// **'My Posts'**
  String get myPostTab;

  ///
  ///
  /// In en, this message translates to:
  /// **'Replied Posts'**
  String get repliedPostTab;

  ///
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allPostTab;

  ///
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experiencePostTab;

  ///
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get introductionPostTab;

  ///
  ///
  /// In en, this message translates to:
  /// **'Strange News'**
  String get strangeNewsTab;

  ///
  ///
  /// In en, this message translates to:
  /// **'There aren\'t any blogs yet'**
  String get noBlogText;

  ///
  ///
  /// In en, this message translates to:
  /// **'Followed'**
  String get followedTab;

  ///
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get followingTab;

  ///
  ///
  /// In en, this message translates to:
  /// **'There aren\'t any followers yet'**
  String get noFollowerText;

  ///
  ///
  /// In en, this message translates to:
  /// **'Unfollow'**
  String get unfollowButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'How to join the club with ore friends How to join the club How to join the club with more friends How to join the club How to join the club with more friends How to explain.'**
  String get myClubHeadingText;

  ///
  ///
  /// In en, this message translates to:
  /// **'Search For More Clubs'**
  String get searchMoreClubsButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Person'**
  String get personLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get memberLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Past Events'**
  String get pastEventsLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'President'**
  String get presidentLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Active Region'**
  String get activeRegionLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Eligibility'**
  String get memberEligibilityLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Create Club'**
  String get createClubLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Add your club logo.\nPlease use JPG, PNG form. The recommended size is 680px or more.\nThe size is less than 4mb.'**
  String get logoUploadText;

  ///
  ///
  /// In en, this message translates to:
  /// **'Club Name'**
  String get clubNameLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Member Qualification'**
  String get memberQualificationLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Age Restriction'**
  String get ageRestrictionLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Major Active Region'**
  String get majorActiveRegionLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Member Approval'**
  String get memberApprovalLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Administrator Review'**
  String get adminReviewLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Create Round Permission'**
  String get createRoundPermissionLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'President & Administrator'**
  String get presidentAdminPlaceholder;

  ///
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get createButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Club Introduction'**
  String get clubIntroLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get addPhotoLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get galleryLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get cameraLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Select an image'**
  String get pickImageLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'View All Reviews'**
  String get viewAllReviewButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Contributor'**
  String get contributorLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'レビュー'**
  String get reviewLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'件'**
  String get caseLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Minute(s) Ago'**
  String get minuteBeforeLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Hour(s) Ago'**
  String get hourBeforeLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Day(s) Ago'**
  String get dayBeforeLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Month(s) Ago'**
  String get monthBeforeLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Year(s) Ago'**
  String get yearBeforeLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Text Input'**
  String get textInputPlaceholder;

  ///
  ///
  /// In en, this message translates to:
  /// **'Host'**
  String get hostMemberLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Participated'**
  String get participatedLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get requestButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chatButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get recruitButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Filtered Results'**
  String get filteredResultLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Invite All'**
  String get recruitAllButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Male Only'**
  String get maleOnlyLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Female Only'**
  String get femaleOnlyLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get unlimitedLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Number of golf clubs'**
  String get golfClubCountLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Classification'**
  String get classificationLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titleLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get otherLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Image & Video'**
  String get imageVideoLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get postButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Leave a Message'**
  String get leaveFeedbackLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allowLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Disallow'**
  String get disallowLable;

  ///
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get detailedInformLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Dimensions of the number of pictures and video size limits. Please give me some advice.'**
  String get imageUploadText;

  ///
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get noticeLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Turned On'**
  String get turnedOnLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Turned Off'**
  String get turnedOffLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Login Method'**
  String get loginMethodLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Not added yet'**
  String get notAddedYetLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOutLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get newsletterLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'My Information'**
  String get myInformationLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get personalDetailsLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Used on the platform to host or participate in rounds.'**
  String get personalDetailsText;

  ///
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Job'**
  String get jobLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get genderLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'My Theme'**
  String get myThemeLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Simple Introduction'**
  String get simpleIntroLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Ongoing Clubs'**
  String get ongoingGroupLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Recruiting Clubs'**
  String get recruitingGroupLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'View More'**
  String get viewMoreButton;

  ///
  ///
  /// In en, this message translates to:
  /// **'Membership Only'**
  String get membershipOnlyLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Host Region'**
  String get hostRegionLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'For users who have not yet signed up, please sign up first'**
  String get registerFirstText;

  ///
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signupLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get otherMethodLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'You are not signed in yet'**
  String get notSigninYetText;

  ///
  ///
  /// In en, this message translates to:
  /// **'Check your information when you sign in'**
  String get checkInformationText;

  ///
  ///
  /// In en, this message translates to:
  /// **'Sign In with Google'**
  String get googleSigninLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Sign In with Facebook'**
  String get facebookSigninLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Sign In with Line'**
  String get lineSigninLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Club Settings'**
  String get clubSettingsLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Latest News Notification'**
  String get latestNotificationLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Club Members'**
  String get clubMembersLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'View All Members'**
  String get viewAllMembersLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Administrator'**
  String get administratorLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Transfer President Role'**
  String get transferPresidentLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Edit Club'**
  String get editClubLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Leave Club'**
  String get leaveClubLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Search By Name'**
  String get searchByNameLabel;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ja': return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
