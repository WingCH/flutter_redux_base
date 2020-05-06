import 'package:flutterreduxbase/models/season_list.dart';
import 'package:flutterreduxbase/utils/api.dart';
import 'package:flutterreduxbase/utils/dio_utils.dart';

Future<void> main(List<String> arguments) async {
  DioUtils dioUtils = DioUtils.getInstance();
  print(arguments);
  arguments.forEach((argument) async {
    if (argument == Api.getSeasonList) {
      await getSeasonList(dioUtils, Api.getSeasonList);
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
