T min<T extends Comparable>(Iterable<T> input) {
  T ret;
  final iter = input.iterator;
  while (iter.moveNext()) {
    final current = iter.current;
    if (current == null) continue;

    if (ret == null) {
      ret = current;
    } else if (current.compareTo(ret) < 0) ret = current;
  }

  return ret;
}

T max<T extends Comparable>(Iterable<T> input) {
  T ret;
  final iter = input.iterator;
  while (iter.moveNext()) {
    final current = iter.current;
    if (current == null) continue;

    if (ret == null) {
      ret = current;
    } else if (current.compareTo(ret) > 0) ret = current;
  }

  return ret;
}

num sum(Iterable<num> input) {
  num sum = 0;

  for (final item in input) {
    if (sum != null) sum += item;
  }

  return sum;
}

double avg(Iterable<num> input) {
  return sum(input) / input.length;
}
