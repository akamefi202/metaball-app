import 'package:metaball_app/modules/message/models/message_sender_model.dart';
import 'package:metaball_app/modules/shared/models/ads_model.dart';
import 'package:metaball_app/modules/shared/models/blog_model.dart';
import 'package:metaball_app/modules/shared/models/club_model.dart';
import 'package:metaball_app/modules/shared/models/event_model.dart';
import 'package:metaball_app/modules/shared/models/round_model.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';

class DummyService {
  static Future<UserModel?> getCurrentUser() async {
    final user = UserModel(
      id: '1',
      fullname: "用户名",
      avatar: 'assets/images/avatar1.png',
    );

    return user;
  }

  static Future<List<RoundModel>> getRoundList() async {
    final roundList = [
      RoundModel(
        id: '1',
        title: "用户写的标题",
        ownerName: "田中 健司",
        logo: "assets/images/logo1.png",
        maxMemberCount: 4,
        memberCount: 3,
        cost: 12000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '2',
        title: "用户写的标题文字数限制用户写的标题文字数限制",
        ownerName: "仲川 毅",
        logo: "assets/images/logo2.png",
        maxMemberCount: 4,
        memberCount: 2,
        cost: 8000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '3',
        title: "左侧是用户的头像和名字",
        ownerName: "渡部 遼人",
        logo: "assets/images/logo3.png",
        maxMemberCount: 4,
        memberCount: 3,
        cost: 7000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '4',
        title: "右侧是参加人数状态和价格",
        ownerName: "テレサテン",
        logo: "assets/images/logo4.png",
        maxMemberCount: 8,
        memberCount: 6,
        cost: 10000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '5',
        title: "用户写的标题",
        ownerName: "田中 健司",
        logo: "assets/images/logo1.png",
        maxMemberCount: 4,
        memberCount: 3,
        cost: 12000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '6',
        title: "用户写的标题文字数限制用户写的标题文字数限制",
        ownerName: "仲川 毅",
        logo: "assets/images/logo2.png",
        maxMemberCount: 4,
        memberCount: 2,
        cost: 8000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '7',
        title: "左侧是用户的头像和名字",
        ownerName: "渡部 遼人",
        logo: "assets/images/logo3.png",
        maxMemberCount: 4,
        memberCount: 3,
        cost: 7000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '8',
        title: "右侧是参加人数状态和价格",
        ownerName: "テレサテン",
        logo: "assets/images/logo4.png",
        maxMemberCount: 8,
        memberCount: 6,
        cost: 10000,
        startTime: DateTime.now(),
      ),
    ];
    return roundList;
  }

  static Future<List<EventModel>> getEventList() async {
    final roundList = [
      EventModel(
        id: '1',
        image: "assets/images/event1.png",
      ),
      EventModel(
        id: '2',
        image: "assets/images/event1.png",
      ),
      EventModel(
        id: '3',
        image: "assets/images/event1.png",
      ),
      EventModel(
        id: '4',
        image: "assets/images/event1.png",
      ),
    ];
    return roundList;
  }

  static Future<List<ThemeModel>> getThemesList() async {
    final roundList = [
      ThemeModel(
        id: '1',
        image: "assets/images/ads1.png",
        text: "新人歓迎",
      ),
      ThemeModel(
        id: '2',
        image: "assets/images/ads2.png",
        text: "1泊2日",
      ),
      ThemeModel(
        id: '3',
        image: "assets/images/ads1.png",
        text: "週末ゴルフ",
      ),
      ThemeModel(
        id: '4',
        image: "assets/images/ads2.png",
        text: "飲み会あり",
      ),
      ThemeModel(
        id: '5',
        image: "assets/images/ads2.png",
        text: "プロ対決",
      ),
      ThemeModel(
        id: '6',
        image: "assets/images/ads2.png",
        text: "参加費無料",
      ),
    ];
    return roundList;
  }

  static Future<List<BlogModel>> getBlogList() async {
    final blogList = [
      BlogModel(
        id: '1',
        image: "assets/images/thumbnail1.png",
        topic: '主题类型1',
        title: '标题1',
        content: "详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束",
      ),
      BlogModel(
        id: '2',
        image: "assets/images/thumbnail2.png",
        topic: '主题类型2',
        title: '标题2',
        content: "详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束",
      ),
      BlogModel(
        id: '3',
        image: "assets/images/thumbnail3.png",
        topic: '主题类型3',
        title: '标题4',
        content: "详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束",
      ),
      BlogModel(
        id: '4',
        image: "assets/images/thumbnail2.png",
        topic: '主题类型4',
        title: '标题4',
        content: "详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束",
      ),
    ];
    return blogList;
  }

  static Future<List<MessageSenderModel>> getMessageSenderList() async {
    final senderList = [
      MessageSenderModel(
        id: '1',
        senderAvatar: 'assets/images/avatar1.png',
        senderName: '佐藤 勝彦',
        lastMessage: '还差一个人。人不够的话3个人也可以还差一个人。人不够的话3个人也可以',
        lastTime: DateTime(2024, 9, 20),
      ),
      MessageSenderModel(
        id: '2',
        senderAvatar: '',
        senderName: '谷野 源治',
        lastMessage: '下周末有安排吗？',
        lastTime: DateTime(2024, 9, 23),
      ),
    ];

    return senderList;
  }

  static Future<List<UserModel>> getUserList() async {
    final userList = [
      UserModel(
        id: '1',
        fullname: "佐藤 勝彦",
        avatar: 'assets/images/avatar1.png',
      ),
      UserModel(
        id: '2',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar2.png',
      ),
      UserModel(
        id: '3',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar3.png',
      ),
      UserModel(
        id: '4',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar4.png',
      ),
    ];

    return userList;
  }

  static Future<UserModel> getUserById(String id) async {
    final user = UserModel(
      id: "1",
      fullname: "木村 隆司",
      avatar: "assets/images/avatar1.png",
      averageScore: 90,
      age: 45,
      experience: 4,
      timesPerMonth: 8,
      intro:
          "簡単な自己紹介です。簡単な自己紹介です簡単な自己紹介です簡単な自己紹介です簡単な自己紹介です簡単な自己紹介です簡単な自己紹介です簡単な自己紹介です簡単な自己紹介です。",
      occupation: "起業家",
      address: "群馬県",
      followingList: [
        UserModel(
          id: "2",
          avatar: "assets/images/avatar1.png",
          fullname: "佐藤 勝彦",
        ),
        UserModel(
          id: "3",
          avatar: "assets/images/avatar2.png",
          fullname: "谷野 源治",
        ),
        UserModel(
          id: "4",
          avatar: "assets/images/avatar3.png",
          fullname: "谷野 源治",
        ),
        UserModel(
          id: "5",
          avatar: "assets/images/avatar1.png",
          fullname: "谷野 源治",
        ),
        UserModel(
          id: "6",
          avatar: "assets/images/avatar2.png",
          fullname: "谷野 源治",
        ),
        UserModel(
          id: "7",
          avatar: "assets/images/avatar3.png",
          fullname: "谷野 源治",
        ),
      ],
      clubList: [
        ClubModel(
          id: "1",
          name: "Pluslinks",
          logo: "assets/images/logo5.png",
        ),
        ClubModel(
          id: "2",
          name: "aixingolf",
          logo: "assets/images/logo6.png",
        ),
      ],
      blogList: [
        BlogModel(
          id: "1",
          topic: "球场介绍",
          title: "Blog的标题",
          content: "详细文字内容文字限制一行之后的文字省略号结束详细文字内容文字限制一行之后的文字省略号结束",
          image: "assets/images/thumbnail1.png",
        ),
        BlogModel(
          id: "2",
          topic: "经验谈",
          title: "広大な",
          content: "18ホール18ホール18ホール",
          image: "assets/images/thumbnail2.png",
        ),
        BlogModel(
          id: "3",
          topic: "球场介绍",
          title: "Blog的标题",
          content: "详细文字内容文字限制一行之后的文字省略号结束详细文字内容文字限制一行之后的文字省略号结束",
          image: "assets/images/thumbnail3.png",
        ),
      ],
    );

    return user;
  }
}
