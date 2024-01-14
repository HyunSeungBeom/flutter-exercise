void main() {
  // type Operaiton 이란걸 해줘서 선언을 해줌
  Operation operation = add;

  print(operation(1, 2, 3));

  // 다시 선언 x하고 그냥 값만 바꾼다는 느낌
  operation = subtract;
  print(operation(1, 2, 3));

  int addResult = calculate(1, 2, 3, add);
  print(addResult);
}

typedef Operation = int Function(int x, int y, int z);

int add(int x, int y, int z) => x + y + z;
int subtract(int x, int y, int z) => x - y - z;
int calculate(int x, int y, int z, Operation operation) {
  return operation(x, y, z);
}
