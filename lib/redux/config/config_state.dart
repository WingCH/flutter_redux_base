import 'package:meta/meta.dart';

class ConfigState {
  final String lang;
  final String url;

  ConfigState({
    @required this.lang,
    @required this.url,
  });

  factory ConfigState.initial() {
    return ConfigState(
      lang: "en",
      url: "www.google.com",
    );
  }

  ConfigState copyWith({
    String lang,
    String url,
  }) {
    return ConfigState(
      lang: lang ?? this.lang,
      url: url ?? this.url,
    );
  }

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        other is ConfigState &&
            runtimeType == other.runtimeType &&
            lang == other.lang &&
            url == other.url;
  }

  @override
  int get hashCode {
    return lang.hashCode ^ url.hashCode;
  }
}
