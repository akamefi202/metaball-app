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
  /// **'View All Blogs'**
  String get viewAllBlogsLabel;

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
  /// **'Golf Calendar'**
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
