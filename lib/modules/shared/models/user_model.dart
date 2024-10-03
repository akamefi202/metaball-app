import 'package:metaball_app/modules/shared/models/blog_model.dart';
import 'package:metaball_app/modules/shared/models/club_model.dart';

class UserModel {
  String id;
  String fullname;
  String email;
  String phone;
  List<UserModel> followList;
  List<UserModel> followingList;
  int experience;
  int averageScore;
  String address;
  List<String> themeList;
  String intro;
  String avatar;
  int age;
  int timesPerMonth;
  String occupation;
  List<ClubModel> clubList;
  List<BlogModel> blogList;

  UserModel({
    required this.id,
    this.fullname = '',
    this.email = '',
    this.phone = '',
    this.followList = const [],
    this.followingList = const [],
    this.experience = 0,
    this.averageScore = 0,
    this.address = '',
    this.themeList = const [],
    this.intro = '',
    this.avatar = '',
    this.age = 0,
    this.timesPerMonth = 0,
    this.occupation = '',
    this.blogList = const [],
    this.clubList = const [],
  });

  static UserModel fromJson(Map<String, dynamic> jsonValue) {
    return UserModel(
      id: jsonValue['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
