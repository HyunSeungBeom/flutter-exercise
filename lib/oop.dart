void main() {
  //instance 생성은 무한대로가능 (객체지향의 꽃)
  Person person = Person(
    age: 3,
    name: "철수",
    number: '010-xxxx-xxxx',
  );

  print(person.age);
  print(person.name);
  print(person.number);

  Person b = Person.n([7, '짱구', '010-xxxx-xxxx']);
  print(b.age);
  print(b.name);
  print(b.number);




}

//하나의 설계서(엔진)
class Person {
  int age;
  String name;
  String number;

  // 생성자 (외부에서 쓸 수 있게끔 코딩해준거임)
  Person({
    required this.age,
    required this.name,
    required this.number,
  });

  Person.n(List values)
      : age = values[0],
        name = values[1],
        number = values[2];
}
