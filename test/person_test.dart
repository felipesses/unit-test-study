import 'package:test/test.dart';
import 'package:unit_test_example/person.dart';

void main() {
  final person = Person(name: 'Felipe', age: 21, height: 1.70, weight: 78);

  test('IMC deve ser 26.99', () {
    expect(person.imc, 26.99);
  });

  group('Grupo overage | ', () {
    test('Pessoa deve ser maior de idade', () {
      expect(person.isOverage, true);
    });

    test('Pessoa deve ser maior de idade se a idade for igual a 18', () {
      final person = Person(name: 'Felipe', age: 18, height: 1.70, weight: 78);
      expect(person.isOverage, true);
    });
  });
}
