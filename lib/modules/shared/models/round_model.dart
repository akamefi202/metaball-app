import 'package:metaball_app/modules/shared/enums/round_status.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';

class RoundModel {
  String id;
  String title;
  String intro;
  List<String> themeList;
  int cost;
  String location;
  String mapLink;
  UserModel? host;
  List<UserModel> memberList;
  int memberCount;
  int maxMemberCount;
  DateTime? startTime;
  int averageScore;
  String logo;
  String ownerName;
  RoundStatus status;

  RoundModel({
    required this.id,
    this.title = '',
    this.intro = '',
    this.themeList = const [],
    this.cost = 0,
    this.location = '',
    this.mapLink = '',
    this.host,
    this.memberList = const [],
    this.memberCount = 0,
    this.maxMemberCount = 0,
    this.startTime,
    this.averageScore = 0,
    this.logo = '',
    this.ownerName = '',
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
