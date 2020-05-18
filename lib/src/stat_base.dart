import 'package:grizzly_range/grizzly_range.dart';

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

class RunningHistogram<E extends num> {
  final Extent<E> range;

  final List<Extent<E>> bins;

  final List<int> counts;

  RunningHistogram(this.bins, {this.range})
      : counts = List<int>.filled(bins.length, 0);

  void append(E value) {
    if (range != null) {
      if (!range.has(value)) return;
    }
    final index = Extent.search(bins, value);
    if (index == -1) return;
    counts[index]++;
  }

  void appendAll(Iterable<E> values) {
    values.forEach(append);
  }

  Map<Extent<E>, int> get histogram => Map.fromIterables(bins, counts);

  Map<Extent<E>, double> get histogramNormalized {
    final s = sum(counts);
    return Map.fromIterables(bins, counts.map((e) => e / s));
  }
}
