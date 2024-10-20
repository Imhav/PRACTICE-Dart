class CustomDuration {
  final int _milliseconds;

  CustomDuration._(this._milliseconds) : assert(_milliseconds >= 0);

  CustomDuration.fromHours(int hours) : this._(hours * 60 * 60 * 1000);
  CustomDuration.fromMinutes(int minutes) : this._(minutes * 60 * 1000);
  CustomDuration.fromSeconds(int seconds) : this._(seconds * 1000);

  // Getters to access the duration in different units
  int get inMilliseconds => _milliseconds;
  int get inSeconds => (_milliseconds / 1000).round();
  int get inMinutes => (_milliseconds / (60 * 1000)).floor();
  int get inHours => (_milliseconds / (60 * 60 * 1000)).floor();

  // Overloading the '>' operator to compare two durations
  bool operator >(CustomDuration other) {
    return this._milliseconds > other._milliseconds;
  }

  // Overloading the '+' operator to add two durations
  CustomDuration operator +(CustomDuration other) {
    return CustomDuration._(this._milliseconds + other._milliseconds);
  }

  // Overloading the '-' operator to subtract two durations
  CustomDuration operator -(CustomDuration other) {
    if (this._milliseconds < other._milliseconds) {
      throw Exception('Cannot subtract as the result would be negative');
    }
    return CustomDuration._(this._milliseconds - other._milliseconds);
  }

  @override
  String toString() {
    int seconds = inSeconds % 60;
    int minutes = inMinutes % 60;
    int hours = inHours;

    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  CustomDuration duration1 = CustomDuration.fromHours(3);
  CustomDuration duration2 = CustomDuration.fromMinutes(45);

  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); // true

  try {
    print(duration1 - duration2);
  } catch (e) {
    print(e);
  }
}
