import 'package:metaball_app/modules/message/models/message_sender_model.dart';
import 'package:metaball_app/modules/shared/enums/message_type.dart';
import 'package:metaball_app/modules/shared/models/ads_model.dart';
import 'package:metaball_app/modules/shared/models/blog_model.dart';
import 'package:metaball_app/modules/shared/models/club_model.dart';
import 'package:metaball_app/modules/shared/models/event_model.dart';
import 'package:metaball_app/modules/shared/models/feedback_model.dart';
import 'package:metaball_app/modules/shared/models/message_model.dart';
import 'package:metaball_app/modules/shared/models/news_model.dart';
import 'package:metaball_app/modules/shared/models/round_model.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';

class DummyService {
  static bool isSignedIn() {
    return true;
  }

  static UserModel getCurrentUser() {
    final user = UserModel(
      id: "1",
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
        host: UserModel(
          id: "1",
          fullname: "田中 健司",
        ),
        club: ClubModel(id: "1", logo: "assets/images/logo1.png"),
        maxMemberCount: 4,
        memberCount: 3,
        cost: 12000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '2',
        title: "用户写的标题文字数限制用户写的标题文字数限制",
        host: UserModel(
          id: "2",
          fullname: "仲川 毅",
        ),
        club: ClubModel(id: "2", logo: "assets/images/logo2.png"),
        maxMemberCount: 4,
        memberCount: 2,
        cost: 8000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '3',
        title: "左侧是用户的头像和名字",
        host: UserModel(
          id: "3",
          fullname: "渡部 遼人",
        ),
        club: ClubModel(id: "3", logo: "assets/images/logo3.png"),
        maxMemberCount: 4,
        memberCount: 3,
        cost: 7000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '4',
        title: "右侧是参加人数状态和价格",
        host: UserModel(
          id: "4",
          fullname: "テレサテン",
        ),
        club: ClubModel(id: "4", logo: "assets/images/logo4.png"),
        maxMemberCount: 8,
        memberCount: 6,
        cost: 10000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '5',
        title: "用户写的标题",
        host: UserModel(
          id: "5",
          fullname: "田中 健司",
        ),
        club: ClubModel(id: "5", logo: "assets/images/logo1.png"),
        maxMemberCount: 4,
        memberCount: 3,
        cost: 12000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '6',
        title: "用户写的标题文字数限制用户写的标题文字数限制",
        host: UserModel(
          id: "6",
          fullname: "仲川 毅",
        ),
        club: ClubModel(id: "6", logo: "assets/images/logo2.png"),
        maxMemberCount: 4,
        memberCount: 2,
        cost: 8000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '7',
        title: "左侧是用户的头像和名字",
        host: UserModel(
          id: "7",
          fullname: "渡部 遼人",
        ),
        club: ClubModel(id: "7", logo: "assets/images/logo3.png"),
        maxMemberCount: 4,
        memberCount: 3,
        cost: 7000,
        startTime: DateTime.now(),
      ),
      RoundModel(
        id: '8',
        title: "右侧是参加人数状态和价格",
        host: UserModel(
          id: "8",
          fullname: "テレサテン",
        ),
        club: ClubModel(id: "8", logo: "assets/images/logo4.png"),
        maxMemberCount: 8,
        memberCount: 6,
        cost: 10000,
        startTime: DateTime.now(),
      ),
    ];
    return roundList;
  }

  static Future<RoundModel> getRoundById(String id) async {
    final round = RoundModel(
      id: "1",
      title: "赤羽ゴルフクラブ新人歓迎",
      intro: "平均スコア制限なし！新人の方歓迎します。\n3～4人募集してます。\n荒川区の方は一緒車移動可能。",
      themeList: ["新人歓迎", "週末ゴルフ", "飲み会あり"],
      host: UserModel(
        id: "8",
        fullname: "木村 隆司 さん",
        avatar: "assets/images/avatar1.png",
        experience: 4,
        averageScore: 90,
      ),
      club: ClubModel(id: "8", logo: "assets/images/logo4.png"),
      maxMemberCount: 4,
      memberCount: 3,
      cost: 9700,
      startTime: DateTime.now(),
      location: "赤羽ゴルフクラブ",
      golfCourseMapLink: "",
      golfCourseName: "赤羽ゴルフクラブ",
      memberList: [
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
      ],
    );

    return round;
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
        author: UserModel(
          id: "1",
          avatar: "assets/images/avatar1.png",
          fullname: "发稿人名字",
        ),
      ),
      BlogModel(
        id: '2',
        image: "assets/images/thumbnail2.png",
        topic: '主题类型2',
        title: '标题2',
        content: "详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束",
        author: UserModel(
          id: "1",
          avatar: "assets/images/avatar1.png",
          fullname: "发稿人名字",
        ),
      ),
      BlogModel(
        id: '3',
        image: "assets/images/thumbnail3.png",
        topic: '主题类型3',
        title: '标题4',
        content: "详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束",
        author: UserModel(
          id: "1",
          avatar: "assets/images/avatar1.png",
          fullname: "发稿人名字",
        ),
      ),
      BlogModel(
        id: '4',
        image: "assets/images/thumbnail2.png",
        topic: '主题类型4',
        title: '标题4',
        content: "详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束",
        author: UserModel(
          id: "1",
          avatar: "assets/images/avatar1.png",
          fullname: "发稿人名字",
        ),
      ),
    ];
    return blogList;
  }

  static Future<BlogModel> getBlogById(String id) async {
    final blog = BlogModel(
      id: "1",
      image: "assets/images/thumbnail1.png",
      topic: "经验谈",
      topicList: ["経験談", "ゴルフ場紹介"],
      title: "成田東カントリーでの打ち方を共有",
      content:
          "100切り狙いであれば、そこまで遠くまでボールを飛ばす力は必要ありません。\n無理に飛距離を出そうとしてフルスイングすると、無駄に力んでしまうことも多く、ボールが曲がってしまいます。\nまた、かえって飛距離が落ちる人もいます。\nボールは飛ばさなくても良いと考え、落ち着いてスイングしていきましょう。",
      author: UserModel(
        id: "1",
        avatar: "assets/images/avatar1.png",
        fullname: "发稿人名字",
        experience: 4,
        averageScore: 90,
      ),
      thumbnailList: [
        "assets/images/thumbnail1.png",
        "assets/images/thumbnail2.png",
        "assets/images/thumbnail3.png",
      ],
      feedbackList: [
        FeedbackModel(
          id: "1",
          content:
              "OBだと2打罰になってしまい、スコア100切りがかなり遠ざかってしまいます。\nコースレイアウトを把握し、どこからどこまでがOBなのかは把握しておきましょう。\nまた自分の癖を知り、ボールをコントロールできるようになるのがベストです。",
          author: UserModel(
            id: "1",
            fullname: "佐藤 勝彦",
            avatar: "assets/images/avatar1.png",
          ),
          createdTime: DateTime(2024, 10, 7, 13, 42, 45),
        ),
        FeedbackModel(
          id: "2",
          content:
              "OBだと2打罰になってしまい、スコア100切りがかなり遠ざかってしまいます。\nコースレイアウトを把握し、どこからどこまでがOBなのかは把握しておきましょう。\nまた自分の癖を知り、ボールをコントロールできるようになるのがベストです。",
          author: UserModel(
            id: "2",
            fullname: "佐藤 勝彦",
            avatar: "assets/images/avatar2.png",
          ),
          createdTime: DateTime(2024, 10, 5, 13, 42, 45),
        ),
        FeedbackModel(
          id: "3",
          content:
              "OBだと2打罰になってしまい、スコア100切りがかなり遠ざかってしまいます。\nコースレイアウトを把握し、どこからどこまでがOBなのかは把握しておきましょう。\nまた自分の癖を知り、ボールをコントロールできるようになるのがベストです。",
          author: UserModel(
            id: "3",
            fullname: "佐藤 勝彦2",
            avatar: "assets/images/avatar3.png",
          ),
          createdTime: DateTime(2023, 10, 8, 13, 42, 45),
        ),
      ],
    );

    return blog;
  }

  static Future<List<BlogModel>> getEveryoneBlogList() async {
    final blogList = [
      BlogModel(
        id: '1',
        image: "assets/images/thumbnail1.png",
        topic: '经验谈',
        title: '标题1',
        content: "详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束",
        author: UserModel(
          id: "1",
          avatar: "assets/images/avatar1.png",
          fullname: "发稿人名字",
        ),
      ),
      BlogModel(
        id: '2',
        image: "assets/images/thumbnail2.png",
        topic: '经验谈',
        title: '标题2',
        content: "详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束",
        author: UserModel(
          id: "1",
          avatar: "assets/images/avatar1.png",
          fullname: "发稿人名字",
        ),
      ),
      BlogModel(
        id: '3',
        image: "assets/images/thumbnail3.png",
        topic: '球场介绍',
        title: '标题4',
        content: "详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束",
        author: UserModel(
          id: "1",
          avatar: "assets/images/avatar1.png",
          fullname: "发稿人名字",
        ),
      ),
      BlogModel(
        id: '4',
        image: "assets/images/thumbnail2.png",
        topic: '主题类型4',
        title: '标题4',
        content: "详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束",
        author: UserModel(
          id: "1",
          avatar: "assets/images/avatar1.png",
          fullname: "发稿人名字",
        ),
      ),
    ];
    return blogList;
  }

  static Future<List<BlogModel>> getMyBlogList() async {
    final blogList = [
      BlogModel(
        id: '1',
        image: "assets/images/thumbnail1.png",
        topic: '奇闻异事',
        title: '标题1',
        content: "详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束详细内容限制文字数量后面加上省略号结束",
        author: UserModel(
          id: "1",
          avatar: "assets/images/avatar1.png",
          fullname: "发稿人名字",
        ),
      ),
    ];
    return blogList;
  }

  static Future<List<BlogModel>> getRepliedBlogList() async {
    return [];
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

  static Future<List<MessageModel>> getMessageList() async {
    final messageList = [
      MessageModel(
        id: "1",
        text:
            "我要加入俱乐部我要加入俱乐部我要加入俱乐部我要加入俱乐部我要加入俱乐部我要加入俱乐部我要加入俱乐部\n我要加入俱乐部我要加入俱乐部我要加入俱乐部我要加入俱乐部",
        sender: UserModel(
          id: "1",
          fullname: "我要",
          avatar: "assets/images/avatar1.png",
        ),
        sentTime: DateTime(2024, 10, 8, 2, 30, 20),
        type: MessageType.sent,
      ),
      MessageModel(
        id: "2",
        text: "这个人是我朋友。管理通过一下",
        image: "assets/images/event1.png",
        sender: UserModel(
          id: "1",
          fullname: "我要",
          avatar: "assets/images/avatar1.png",
        ),
        sentTime: DateTime(2024, 10, 8, 3, 30, 20),
        type: MessageType.sent,
      ),
      MessageModel(
        id: "3",
        text: "我要加入俱乐部",
        sender: UserModel(
          id: "1",
          fullname: "我要",
          avatar: "assets/images/avatar1.png",
        ),
        sentTime: DateTime(2024, 10, 9, 2, 30, 20),
        type: MessageType.received,
      ),
      MessageModel(
        id: "4",
        text: "这个人是我朋友。管理通过一下",
        image: "assets/images/event1.png",
        sender: UserModel(
          id: "1",
          fullname: "我要",
          avatar: "assets/images/avatar1.png",
        ),
        sentTime: DateTime(2024, 10, 10, 2, 30, 20),
        type: MessageType.received,
      ),
    ];

    return messageList;
  }

  static Future<List<UserModel>> getUserList() async {
    final userList = [
      UserModel(
        id: '1',
        fullname: "佐藤 勝彦",
        avatar: 'assets/images/avatar1.png',
        averageScore: 90,
        experience: 4,
      ),
      UserModel(
        id: '2',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar2.png',
        averageScore: 90,
        experience: 4,
      ),
      UserModel(
        id: '3',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar3.png',
        averageScore: 90,
        experience: 4,
      ),
      UserModel(
        id: '4',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar4.png',
        averageScore: 90,
        experience: 4,
      ),
      UserModel(
        id: '5',
        fullname: "佐藤 勝彦",
        avatar: 'assets/images/avatar1.png',
        averageScore: 90,
        experience: 4,
      ),
      UserModel(
        id: '6',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar2.png',
        averageScore: 90,
        experience: 4,
      ),
      UserModel(
        id: '7',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar3.png',
        averageScore: 90,
        experience: 4,
      ),
      UserModel(
        id: '8',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar4.png',
        averageScore: 90,
        experience: 4,
      ),
      UserModel(
        id: '9',
        fullname: "佐藤 勝彦",
        avatar: 'assets/images/avatar1.png',
        averageScore: 90,
        experience: 4,
      ),
      UserModel(
        id: '10',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar2.png',
        averageScore: 90,
        experience: 4,
      ),
      UserModel(
        id: '11',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar3.png',
        averageScore: 90,
        experience: 4,
      ),
      UserModel(
        id: '12',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar4.png',
        averageScore: 90,
        experience: 4,
      ),
    ];

    return userList;
  }

  static Future<List<UserModel>> getFollowedUserList() async {
    final userList = [
      UserModel(
        id: '1',
        fullname: "佐藤 勝彦",
        avatar: 'assets/images/avatar1.png',
        experience: 4,
        averageScore: 90,
      ),
      UserModel(
        id: '2',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar2.png',
        experience: 4,
        averageScore: 90,
      ),
      UserModel(
        id: '3',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar3.png',
        experience: 4,
        averageScore: 90,
      ),
      UserModel(
        id: '4',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar4.png',
        experience: 4,
        averageScore: 90,
      ),
      UserModel(
        id: '5',
        fullname: "佐藤 勝彦",
        avatar: 'assets/images/avatar1.png',
        experience: 4,
        averageScore: 90,
      ),
      UserModel(
        id: '6',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar2.png',
        experience: 4,
        averageScore: 90,
      ),
      UserModel(
        id: '7',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar3.png',
        experience: 4,
        averageScore: 90,
      ),
      UserModel(
        id: '8',
        fullname: "谷野 源治",
        avatar: 'assets/images/avatar4.png',
        experience: 4,
        averageScore: 90,
      ),
    ];

    return userList;
  }

  static Future<List<UserModel>> getFollowingUserList() async {
    return [];
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

  static Future<List<ClubModel>> getClubList() async {
    final clubList = [
      ClubModel(
        id: "1",
        name: "Pluslinks",
        logo: "assets/images/logo5.png",
        memberCount: 96,
        isOngoing: true,
      ),
      ClubModel(
        id: "2",
        name: "aixingolf",
        logo: "assets/images/logo6.png",
        memberCount: 27,
        isOngoing: true,
      ),
      ClubModel(
        id: "3",
        name: "aixingolf",
        logo: "assets/images/logo6.png",
        memberCount: 27,
        isOngoing: true,
      ),
      ClubModel(
        id: "4",
        name:
            "aixingolfaixingolfaixingolfaixingolfaixingolfaixingolfaixingolfaixingolfaixingolf",
        logo: "assets/images/logo6.png",
        memberCount: 27,
        isOngoing: true,
      ),
      ClubModel(
        id: "5",
        name:
            "aixingolfaixingolfaixingolfaixingolfaixingolfaixingolfaixingolfaixingolfaixingolf",
        logo: "assets/images/logo6.png",
        memberCount: 27,
        isRecruiting: true,
      ),
      ClubModel(
        id: "6",
        name: "aixingolf",
        logo: "assets/images/logo6.png",
        memberCount: 27,
        isRecruiting: true,
      ),
      ClubModel(
        id: "7",
        name: "aixingolf",
        logo: "assets/images/logo6.png",
        memberCount: 27,
        isRecruiting: true,
      ),
      ClubModel(
        id: "8",
        name: "aixingolf",
        logo: "assets/images/logo6.png",
        memberCount: 27,
        isRecruiting: true,
      ),
      ClubModel(
        id: "9",
        name:
            "aixingolfaixingolfaixingolfaixingolfaixingolfaixingolfaixingolfaixingolfaixingolf",
        logo: "assets/images/logo6.png",
        memberCount: 27,
        isRecruiting: true,
      ),
      ClubModel(
        id: "10",
        name: "aixingolf",
        logo: "assets/images/logo6.png",
        memberCount: 27,
        isRecruiting: true,
      ),
    ];

    return clubList;
  }

  static Future<List<ClubModel>> getClubListById(String id) async {
    final clubList = [
      ClubModel(
        id: "1",
        name: "Pluslinks",
        logo: "assets/images/logo5.png",
        memberCount: 96,
      ),
      ClubModel(
        id: "2",
        name: "aixingolf",
        logo: "assets/images/logo6.png",
        memberCount: 27,
      ),
    ];

    return clubList;
  }

  static Future<ClubModel> getClubById(String id) async {
    final club = ClubModel(
      id: "1",
      name: "Pluslinks",
      logo: "assets/images/logo5.png",
      memberCount: 6,
      region: "関東",
      eligibility: "特になし",
      description:
          "簡単な自己紹介です。簡単な自己紹介です簡単な自己紹介です簡単な自己紹介です簡単な自己紹介です簡単な自己紹介です簡単な自己紹介です簡単な自己紹介です簡単な自己紹介です。",
      president: UserModel(
        id: "1",
        fullname: "佐藤 勝彦",
      ),
      memberList: [
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
    );
    return club;
  }

  static Future<List<FeedbackModel>> getFeedbackListByBlogId(
      String blogId) async {
    final feedbackList = [
      FeedbackModel(
        id: "1",
        content:
            "OBだと2打罰になってしまい、スコア100切りがかなり遠ざかってしまいます。\nコースレイアウトを把握し、どこからどこまでがOBなのかは把握しておきましょう。\nまた自分の癖を知り、ボールをコントロールできるようになるのがベストです。",
        author: UserModel(
          id: "1",
          fullname: "佐藤 勝彦",
          avatar: "assets/images/avatar1.png",
        ),
        createdTime: DateTime(2024, 10, 7, 13, 42, 45),
      ),
      FeedbackModel(
        id: "2",
        content:
            "OBだと2打罰になってしまい、スコア100切りがかなり遠ざかってしまいます。\nコースレイアウトを把握し、どこからどこまでがOBなのかは把握しておきましょう。\nまた自分の癖を知り、ボールをコントロールできるようになるのがベストです。",
        author: UserModel(
          id: "2",
          fullname: "佐藤 勝彦",
          avatar: "assets/images/avatar2.png",
        ),
        createdTime: DateTime(2024, 10, 5, 13, 42, 45),
      ),
      FeedbackModel(
        id: "3",
        content:
            "OBだと2打罰になってしまい、スコア100切りがかなり遠ざかってしまいます。\nコースレイアウトを把握し、どこからどこまでがOBなのかは把握しておきましょう。\nまた自分の癖を知り、ボールをコントロールできるようになるのがベストです。",
        author: UserModel(
          id: "3",
          fullname: "佐藤 勝彦2",
          avatar: "assets/images/avatar3.png",
        ),
        createdTime: DateTime(2023, 9, 8, 13, 42, 45),
      ),
    ];

    return feedbackList;
  }

  static Future<List<NewsModel>> getNewsList() async {
    return [
      NewsModel(
        id: "1",
        title: "最新的News标题点击查看全部",
        type: "系统更新",
      ),
      NewsModel(
        id: "2",
        title: "以往的新闻标题",
        type: "通知",
      ),
      NewsModel(
        id: "3",
        title: "如果新闻过多下拉更新更早的内容",
        type: "系统更新",
      ),
      NewsModel(
        id: "4",
        title: "估计新闻也不会太多",
        type: "系统更新",
      ),
    ];
  }

  static Future<NewsModel> getNewsById(String id) async {
    return NewsModel(
      id: "1",
      title: "最新的News标题点击查看全部",
      type: "系统更新",
      html: '''
  <h3>Heading</h3>
  <p>
    A paragraph with <strong>strong</strong>, <em>emphasized</em>
    and <span style="color: red">colored</span> text.
  </p>
  ''',
    );
  }

  static Future<List<UserModel>> getClubMemberListByClubId(
      String clubId) async {
    return [
      UserModel(
        id: "1",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "2",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar2.png",
      ),
      UserModel(
        id: "3",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar3.png",
      ),
      UserModel(
        id: "4",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "5",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar2.png",
      ),
      UserModel(
        id: "6",
        fullname: "张三",
        avatar: "assets/images/avatar3.png",
      ),
      UserModel(
        id: "7",
        fullname: "张三",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "8",
        fullname: "张三",
        avatar: "assets/images/avatar2.png",
      ),
      UserModel(
        id: "9",
        fullname: "张三",
        avatar: "assets/images/avatar3.png",
      ),
      UserModel(
        id: "10",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "11",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "12",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar2.png",
      ),
      UserModel(
        id: "13",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar3.png",
      ),
      UserModel(
        id: "14",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "15",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar2.png",
      ),
      UserModel(
        id: "16",
        fullname: "张三",
        avatar: "assets/images/avatar3.png",
      ),
      UserModel(
        id: "17",
        fullname: "张三",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "18",
        fullname: "张三",
        avatar: "assets/images/avatar2.png",
      ),
      UserModel(
        id: "19",
        fullname: "张三",
        avatar: "assets/images/avatar3.png",
      ),
      UserModel(
        id: "20",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "21",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "22",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar2.png",
      ),
      UserModel(
        id: "23",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar3.png",
      ),
      UserModel(
        id: "24",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "25",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar2.png",
      ),
      UserModel(
        id: "26",
        fullname: "张三",
        avatar: "assets/images/avatar3.png",
      ),
      UserModel(
        id: "27",
        fullname: "张三",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "28",
        fullname: "张三",
        avatar: "assets/images/avatar2.png",
      ),
      UserModel(
        id: "29",
        fullname: "张三",
        avatar: "assets/images/avatar3.png",
      ),
      UserModel(
        id: "30",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "31",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "32",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar2.png",
      ),
      UserModel(
        id: "33",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar3.png",
      ),
      UserModel(
        id: "34",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar1.png",
      ),
      UserModel(
        id: "35",
        fullname: "佐藤 勝彦",
        avatar: "assets/images/avatar2.png",
      ),
      UserModel(
        id: "36",
        fullname: "张三",
        avatar: "assets/images/avatar3.png",
      ),
      UserModel(
        id: "37",
        fullname: "张三",
        avatar: "assets/images/avatar1.png",
      ),
    ];
  }
}
