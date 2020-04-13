// 可以用https://pub.dev/packages/equatable, 省略 "==", "hashCode"
class Counter {
  final int count;

  Counter(this.count);

  Counter copyWith({int count}) {
    return Counter(count ?? this.count);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Counter &&
            runtimeType == other.runtimeType &&
            count == other.count;
  }

  @override
  int get hashCode {
    return count.hashCode;
  }
}
