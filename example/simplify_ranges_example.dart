import 'package:simplify_ranges/simplify_ranges.dart';

void main() {
  const ranges = [
    [1, 2],
    [3, 4],
    [2, 3]
  ];

  print(simplifyRanges(ranges)); // => [[1, 4]]
}
