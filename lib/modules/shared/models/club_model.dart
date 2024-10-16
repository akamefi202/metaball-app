import 'package:metaball_app/modules/shared/models/user_model.dart';

class ClubModel {
  String id;
  String name;
  String logo;
  String region;
  String eligibility;
  String description;
  UserModel? president;
  List<UserModel> memberList;
  int memberCount;
  bool isOngoing;
  bool isRecruiting;

  ClubModel({
    required this.id,
    this.name = '',
    this.logo = '',
    this.region = '',
    this.eligibility = '',
    this.description = '',
    this.memberCount = 0,
    this.memberList = const [],
    this.president,
    this.isOngoing = false,
    this.isRecruiting = false,
  });

  static ClubModel fromJson(Map<String, dynamic> jsonValue) {
    return ClubModel(
      id: jsonValue['id'] as String,
      name: jsonValue['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}
