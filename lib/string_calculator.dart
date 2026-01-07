/// A calculator that adds numbers from a string input.
class StringCalculator {
  /// Adds numbers in the given string and returns the sum.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    var delimiter = ',';
    var numString = numbers;

    if (numbers.startsWith('//')) {
      var newlineIndex = numbers.indexOf('\n');
      delimiter = numbers.substring(2, newlineIndex);
      numString = numbers.substring(newlineIndex + 1);
    }

    var normalized = numString.replaceAll('\n', delimiter);
    var parts = normalized.split(delimiter);

    var nums = parts.map((p) => int.parse(p)).toList();

    var negatives = nums.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(',')}');
    }

     return nums.where((n) => n <= 1000).fold(0, (a, b) => a + b);
  }
}
