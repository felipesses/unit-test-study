import 'package:test/test.dart';

void main() {
  group('Ciclo de vida | ', () {
    setUp(() {
      print('inicia o teste');
    });

    tearDown(() {
      print('destrói o teste');
    });

    setUpAll(() {
      print('inicia o suit');
    });

    tearDownAll(() {
      print('destroi o suit');
    });

    test('is working', () {
      print('executando');
    });
    test('is working 2', () {
      print('executando 2');
    });
  });

  group('Matchers | ', () {
    test('Verifica se o nome é igual o esperado', () {
      final name = 'Felipe';
      expect(name, equals('Felipe'));
    }, skip: 'Usado para pular o teste');

    test('Faz o throw de um erro', () {
      expect(() => int.parse('x'), throwsException);
    });
  });
}
