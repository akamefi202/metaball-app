import 'package:metaball_app/modules/shared/enums/round_status.dart';
import 'package:metaball_app/modules/shared/models/club_model.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';

class RoundModel {
  String id;
  String title;
  String intro;
  List<String> themeList;
  int cost;
  String location;
  String golfCourseMapLink;
  String golfCourseName;
  UserModel? host;
  ClubModel? club;
  List<UserModel> memberList;
  int maxMemberCount;
  int memberCount;
  DateTime? startTime;
  int averageScore;
  RoundStatus status;

  RoundModel({
    required this.id,
    this.title = '',
    this.intro = '',
    this.themeList = const [],
    this.cost = 0,
    this.location = '',
    this.golfCourseMapLink = '',
    this.golfCourseName = '',
    this.host,
    this.club,
    this.memberList = const [],
    this.maxMemberCount = 0,
    this.memberCount = 0,
    this.startTime,
    this.averageScore = 0,
    this.status = RoundStatus.hosted,
  });

  static RoundModel fromJson(Map<String, dynamic> jsonValue) {
    return RoundModel(
      id: jsonValue['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
