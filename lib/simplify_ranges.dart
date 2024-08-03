/// Merge and normalize adjacent or overlapping integer ranges

library simplify_ranges;

import 'dart:math' as math;

/// The function takes an array of [closed integer ranges](https://simple.wikipedia.org/wiki/Interval_(mathematics)#Closed_Intervals).
///
///Normalizes reversed ranges by converting them from [3, 1] to [1, 3] and also supports negative numbers.
///
/// Param [separateTwoNumberRanges] is used to separate two-number ranges, i.e. [[1, 2], [4, 5]] into individual ranges [[1, 1], [2, 2], [4, 4], [5, 5]].
/// This can be useful if you have special handling for single-number ranges.
List<List<num>> simplifyRanges(
  List<List<num>> ranges, {
  bool separateTwoNumberRanges = false,
}) {
  if (ranges.isEmpty) return [];

  // Normalize ranges
  ranges = ranges
      .map((el) => el[0] <= el[1] ? [el[0], el[1]] : [el[1], el[0]])
      .toList();
  ranges.sort((a, b) => (a[0] - b[0]).toInt());

  final result = [ranges[0]];

  for (final el in ranges.sublist(1)) {
    final start = el[0], end = el[1];
    final lastStart = result.last[0], lastEnd = result.last[1];

    if (start - 1 <= lastEnd) {
      final newEnd = math.max(end, lastEnd);
      result[result.length - 1] = [lastStart, newEnd];
    } else {
      result.add([start, end]);
    }
  }

  if (separateTwoNumberRanges) {
    return result
        .expand((el) => el[0] + 1 == el[1]
            ? [
                [el[0], el[0]],
                [el[1], el[1]]
              ]
            : [
                [el[0], el[1]]
              ])
        .toList();
  }

  return result;
}
