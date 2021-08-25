// UNDADE

import 'package:unit_test_example/person.dart';

void main(List<String> arguments) {
  final person = Person(name: 'Felipe', age: 21, height: 1.70, weight: 78);

  print('O IMC deve vir 26,99 ${person.imc == 26.99}');
  print('${person.imc}');
}
