void main() {
  print('A');
  Future(f);
  print('G');
}

void f() {
  print('B');
  Future(() => print('C'));
  Future.microtask(() => print('D'));
  Future(() => print('E'));
  print('F');
}
