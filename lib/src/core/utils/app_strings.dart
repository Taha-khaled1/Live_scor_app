import 'package:live_score/main.dart';

// class AppStrings {
//   AppStrings._();
//   static const String noRouteFound = "No Route Found";
//   static const String home = "Home";
//   static const String fixtures = "Fixtures";
//   static const String standings = "Standings";
//   static const String liveScore = "Live Score";
//   static const String vs = "Vs";
//   static const String round = "Round";
//   static const String live = "Live";
//   static const String end = "End";
//   static const String notStarted = "Not Started";
//   static const String statistics = "Statistics";
//   static const String lineups = "Lineups";
//   static const String events = "Events";
//   static const String goal = "Goal";
//   static const String missedPenalty = "Missed Penalty";
//   static const String assist = "Assist";
//   static const String noAssist = "No Assist";
//   static const String card = "Card";
//   static const String yellowCard = "Yellow Card";
//   static const String subst = "subst";
//   static const String viewFixtures = "View Fixtures";
//   static const String liveFixtures = "Live Fixtures";
//   static const String viewAll = "VIEW ALL";
//   static const String reachedLimits =
//       "You have reached the request limit for the day";
//   static const String reload = "Reload";
//   static const String noStats = "Statistics not available";
//   static const String noLineups = "Lineups not available";
//   static const String noEvents = "Events not available";
//   static const String noFixtures = "No Fixtures scheduled today";
//   static String news = "الاخبار";
// }
class AppStrings {
  AppStrings._();
  static String noRouteFound =
      prefs.getString('a') == '1' ? 'لا يوجد مسار ' : "No Route Found";
  static String home = prefs.getString('a') == '1' ? "المباريات" : 'home';
  static String fixtures =
      prefs.getString('a') == '1' ? "المباريات الحية" : 'fixtures';
  static String standings =
      prefs.getString('a') == '1' ? "ترتيب الفرق" : 'standings';
  static String news = prefs.getString('a') == '1' ? "الاخبار" : 'news';
  static String liveScore =
      prefs.getString('a') == '1' ? "المباريات الحية" : 'liveScore';
  static String vs = prefs.getString('a') == '1' ? "ضد" : 'VS';
  static String round = prefs.getString('a') == '1' ? "الجوله" : 'round';
  static String live = prefs.getString('a') == '1' ? "بث" : 'live';
  static String end = prefs.getString('a') == '1' ? "النهايه" : 'end';
  static String notStarted =
      prefs.getString('a') == '1' ? "لم يبداء بعد" : 'notStarted';
  static String statistics =
      prefs.getString('a') == '1' ? "الاحصائيات" : 'statistics';
  static String lineups = prefs.getString('a') == '1' ? "الدوري" : 'lineups';
  static String events = prefs.getString('a') == '1' ? "الاحداث" : 'events';
  static String goal = prefs.getString('a') == '1' ? "هدف" : 'GOAL';
  static String missedPenalty =
      prefs.getString('a') == '1' ? "ركلة جزاء" : 'missedPenalty';
  static String assist = prefs.getString('a') == '1' ? "Assist" : 'assist';
  static String noAssist =
      prefs.getString('a') == '1' ? "No Assist" : 'No assist';
  static String card = prefs.getString('a') == '1' ? "بطاقه" : 'card';
  static String yellowCard =
      prefs.getString('a') == '1' ? "بطاقه صفراء" : 'yellowCard';
  static String subst = prefs.getString('a') == '1' ? "الفرعية" : 'subst';
  static String viewFixtures =
      prefs.getString('a') == '1' ? "مشاهدة المباريات" : 'viewFixtures';
  static String liveFixtures =
      prefs.getString('a') == '1' ? "المباريات الحية" : 'liveFixtures';
  static String viewAll =
      prefs.getString('a') == '1' ? "مشاهدة الكل" : 'viewAll';
  static String reachedLimits = prefs.getString('a') == '1'
      ? "لقد وصلت إلى حد الطلب لهذا اليوم"
      : 'You have reached the request limit for the day';
  static String reload = prefs.getString('a') == '1' ? "اعادة البحث" : 'reload';
  static String noStats =
      prefs.getString('a') == '1' ? "الاحصائيات غير متوفره" : 'noStats';
  static String noLineups =
      prefs.getString('a') == '1' ? "الدوريات غير متوفره" : 'noLineups';
  static String noEvents =
      prefs.getString('a') == '1' ? "الاحداث غير متوفره" : 'noEvents';
  static String noFixtures =
      prefs.getString('a') == '1' ? "لايوجد مباريات اليوم" : 'noFixtures';
}
