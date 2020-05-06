import 'package:flutterreduxbase/models/fn_matches.dart';
import 'package:flutterreduxbase/models/season_list.dart';
import 'package:flutterreduxbase/utils/api.dart';
import 'package:flutterreduxbase/utils/dio_utils.dart';

Future<void> main(List<String> arguments) async {
  DioUtils dioUtils = DioUtils.getInstance();
  print(arguments);
  arguments.forEach((argument) async {
    if (argument == Api.getSeasonList) {
      await getSeasonList(dioUtils, Api.getSeasonList);
    } else if (argument == Api.fnMatches) {
      await fnMatches(dioUtils, Api.fnMatches);
    }
  });
}

Future getSeasonList(DioUtils dioUtils, String url) async {
  String result = await dioUtils.get(
    url,
    queryParameters: {
      "source": "a",
      "sId": "1",
    },
  );
  final seasonList = seasonListFromJson(result);
  print(seasonList.data);
}

Future fnMatches(DioUtils dioUtils, String url) async {
  String result = await dioUtils.get(
    url,
    queryParameters: {
      "lang": "zh",
      "fixtureId": "",
      "marketGroup": "am",
      "page": "1",
      "pageSize": "30",
      "sId": "1",
      "orderBy": "league",
      "source": "B",
      "matchStatus": "Today",
      "timezone": "8",
      "oddsType": "EURO",
      "searchKeyword": "",
      "options": "%7B%22checkHeartbeat%22%3Afalse%7D",
    },
  );

  final fnMatches = fnMatchesFromJson(result);
  print(fnMatches.data);
}
