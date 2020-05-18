import 'package:grizzly_distuv/grizzly_distuv.dart';
import 'package:grizzly_range/grizzly_range.dart';
import 'package:grizzly_stat/grizzly_stat.dart';

void main() {
  final running =
      RunningHistogram(Extent.edgesToBins(Extent<double>(0, 1.0).linspace(10)));
  for (int i = 0; i < 10000; i++) {
    running.append(rand);
  }
  running.histogramNormalized.forEach((key, value) => print('$key: $value'));
}
