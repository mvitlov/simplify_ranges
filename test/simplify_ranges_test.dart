import 'package:simplify_ranges/simplify_ranges.dart';
import 'package:test/test.dart';

void main() {
  test('merges overlapping ranges', () {
    const ranges = [
      [1, 2],
      [2, 3],
      [5, 8]
    ];
    expect(simplifyRanges(ranges), [
      [1, 3],
      [5, 8]
    ]);
  });

  test('merges overlapping ranges #2', () {
    const ranges = [
      [1, 5],
      [2, 3],
      [3, 8],
      [8, 8]
    ];
    expect(simplifyRanges(ranges), [
      [1, 8]
    ]);
  });

  test('merges adjacent ranges', () {
    const ranges = [
      [1, 2],
      [3, 4],
      [5, 6]
    ];
    expect(simplifyRanges(ranges), [
      [1, 6]
    ]);
  });

  test('preserves single-number ranges', () {
    const ranges = [
      [1, 2],
      [10, 10],
      [15, 16]
    ];
    expect(simplifyRanges(ranges), [
      [1, 2],
      [10, 10],
      [15, 16]
    ]);
  });

  test('handles unsorted ranges', () {
    const ranges = [
      [10, 12],
      [1, 3],
      [5, 7]
    ];
    expect(simplifyRanges(ranges), [
      [1, 3],
      [5, 7],
      [10, 12]
    ]);
  });

  test('handles single range', () {
    const ranges = [
      [1, 3]
    ];
    expect(simplifyRanges(ranges), [
      [1, 3]
    ]);
  });

  test('handles empty input', () {
    final ranges = <List<num>>[];
    expect(simplifyRanges(ranges), []);
  });

  test('handles ranges that become single-number after merge', () {
    const ranges = [
      [1, 2],
      [2, 3],
      [3, 4],
      [6, 6]
    ];
    expect(simplifyRanges(ranges), [
      [1, 4],
      [6, 6]
    ]);
  });

  test('merges multi-step overlapping ranges', () {
    const ranges = [
      [1, 2],
      [3, 4],
      [2, 3]
    ];
    expect(simplifyRanges(ranges), [
      [1, 4]
    ]);
  });

  test('handles reversed ranges', () {
    const ranges = [
      [1, 9],
      [4, 2]
    ];
    expect(simplifyRanges(ranges), [
      [1, 9]
    ]);
  });

  test('handles mixed reversed and normal ranges', () {
    const ranges = [
      [1, 3],
      [9, 5]
    ];
    expect(simplifyRanges(ranges), [
      [1, 3],
      [5, 9]
    ]);
  });

  test('merges single-number and two-number ranges', () {
    const ranges = [
      [1, 1],
      [2, 3],
      [4, 4]
    ];
    expect(simplifyRanges(ranges), [
      [1, 4]
    ]);
  });

  test('handles separate but reversed ranges', () {
    const ranges = [
      [9, 3],
      [15, 11]
    ];
    expect(simplifyRanges(ranges), [
      [3, 9],
      [11, 15]
    ]);
  });

  test('handles large gaps between ranges', () {
    const ranges = [
      [1, 2],
      [100, 101],
      [200, 300]
    ];
    expect(simplifyRanges(ranges), [
      [1, 2],
      [100, 101],
      [200, 300]
    ]);
  });

  test('handles all single-number ranges', () {
    const ranges = [
      [1, 1],
      [2, 2],
      [3, 3]
    ];
    expect(simplifyRanges(ranges), [
      [1, 3]
    ]);
  });

  test('handles multiple same single-number ranges', () {
    const ranges = [
      [1, 1],
      [1, 1],
      [1, 1]
    ];
    expect(simplifyRanges(ranges), [
      [1, 1]
    ]);
  });

  test('handles negative numbers', () {
    const ranges = [
      [-3, -1],
      [0, 2]
    ];
    expect(simplifyRanges(ranges), [
      [-3, 2]
    ]);
  });

  test('handles mix of negative, zero and positive numbers', () {
    const ranges = [
      [-3, 2],
      [5, 0]
    ];
    expect(simplifyRanges(ranges), [
      [-3, 5]
    ]);
  });

  test('separateTwoNumberRanges option', () {
    const ranges = [
      [1, 2],
      [4, 5],
      [7, 10]
    ];
    expect(simplifyRanges(ranges, separateTwoNumberRanges: true), [
      [1, 1],
      [2, 2],
      [4, 4],
      [5, 5],
      [7, 10]
    ]);
  });

  test('separateTwoNumberRanges option - handles negative numbers', () {
    const ranges = [
      [-3, -2],
      [1, 2]
    ];
    expect(simplifyRanges(ranges, separateTwoNumberRanges: true), [
      [-3, -3],
      [-2, -2],
      [1, 1],
      [2, 2]
    ]);
  });

  test('separateTwoNumberRanges option - does not split large ranges', () {
    const ranges = [
      [1, 20],
      [21, 40]
    ];
    expect(simplifyRanges(ranges, separateTwoNumberRanges: true), [
      [1, 40]
    ]);
  });

  test('separateTwoNumberRanges option - handles all single-number ranges', () {
    const ranges = [
      [1, 1],
      [2, 2],
      [3, 3]
    ];
    expect(simplifyRanges(ranges, separateTwoNumberRanges: true), [
      [1, 3]
    ]);
  });
}
