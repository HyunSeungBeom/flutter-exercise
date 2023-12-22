// abstract void Swimmer() {
//   void swim() {
//     print('Swimming');
//   }
// }

// class Person with Swimmer {
//   @override
//   swim() {

//   }

// }

// void main() {

// }

// abstract class hihi {
//   void swim() {

//   }
//   void run();
//   void walk();
// }

// class Person extends hihi {
//   @override
//   void swim() {
//     print('siwm');
//   }

//   @override
//   void run() {
//     print('run');
//   }

//   @override
//   void walk() {
//     print('walk');
//   }
// }

// void main() {
//   hihi p = Person();
//   p.swim();
//   p.run();
//   p.walk();
// }

// mixin test {
//   void checkEnter() {

//   }
//   void checkExit();
//   void checkMoney();
// }

// class Person with test {
//   @override
//   void checkEnter() {
//     print('checkEnter');
//   }

//   @override
//   void checkExit() {
//     print('checkExit');
//   }

//   @override
//   void checkMoney() {
//     print('checkMoney');
//   }
// }

// void main() {
//   Person p = Person();
//   p.checkEnter();
//   p.checkExit();
//   p.checkMoney();
// }

mixin test {
  void checkEnter() {
    print('checkEnter');
  }

  void checkExit() {
    print('checkExit');
  }

  void checkMoney() {
    print('checkMoney');
  }
}

mixin test2 {
  void hi() {
    print('hi');
  }
}

class Person with test, test2 {
  void someMethod() {
    checkEnter();
    checkExit();
    checkMoney();
    hi();
  }
}

// Abstract class
abstract class Animal {
  void makeSound();
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Dog barks');
  }

  void makeTest() {
    print('hello');
  }

  void hihi() {
    print('hihi');
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print('Cat meows');
  }
}

void main() {
  Animal dog = Dog();
  Animal cat = Cat();

  dog.makeSound(); // Output: Dog barks
  cat.makeSound(); // Output: Cat meows
}
