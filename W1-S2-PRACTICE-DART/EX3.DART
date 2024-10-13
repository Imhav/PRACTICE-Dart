void main() {
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];
  List<int> pass = scores.where((int score) => score >= 50).toList();
  int Count = pass.length;
  print(' $pass');
  print(' $Count students passed');
  // You code
}
