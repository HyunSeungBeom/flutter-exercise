class SuperClass {
  String name = 'Super';

  void run() {
    print('superclass run');
  }
}

class SubClass extends SuperClass {
  String name = 'Sub';
  
  @override
  void run() {
    super.run();
    this.fly();
  }

  void fly() {
    print('subclass fly');
  }
}

void main() {
  var superClass = SuperClass();
  superClass.run();
  print(superClass.name);

  print('------------------');

  var subClass = SubClass();
  subClass.run();
  subClass.fly();
  print(subClass.name);
}

// superclass run 
// Super
// ------------------
// superclass run
// subclass fly
// subclass fly 
// Sub
