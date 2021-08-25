import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:unit_test_example/person_repository.dart';

class ClientMock extends Mock implements http.Client {}

void main() {
  final client = ClientMock();

  final repository = PersonRepository(client);

  test('Deve retornar uma lista de person', () async {
    when(() => client.get(
            Uri.parse('https://6126359d3ab4100017a68e07.mockapi.io/person')))
        .thenAnswer((_) async => http.Response(jsonBody, 200));

    final list = await repository.getPerson();

    expect(list.isNotEmpty, equals(true));
    expect(list.first.name, equals('name 1'));
  });

  test('Deve retornar uma exception caso statusCode não seja 200', () async {
    when(() => client.get(
            Uri.parse('https://6126359d3ab4100017a68e07.mockapi.io/person')))
        .thenAnswer((_) async => http.Response(jsonBody, 404));

    expect(() async => await repository.getPerson(), throwsException);
  });
}

const jsonBody =
    '[{"name":"name 1","age":62,"height":91,"weight":0,"id":"1"},{"name":"name 2","age":86,"height":70,"weight":35,"id":"2"},{"name":"name 3","age":29,"height":97,"weight":60,"id":"3"},{"name":"name 4","age":23,"height":69,"weight":6,"id":"4"},{"name":"name 5","age":52,"height":46,"weight":35,"id":"5"},{"name":"name 6","age":23,"height":71,"weight":55,"id":"6"},{"name":"name 7","age":84,"height":74,"weight":88,"id":"7"},{"name":"name 8","age":78,"height":64,"weight":74,"id":"8"},{"name":"name 9","age":4,"height":92,"weight":90,"id":"9"},{"name":"name 10","age":1,"height":4,"weight":39,"id":"10"},{"name":"name 11","age":40,"height":15,"weight":91,"id":"11"},{"name":"name 12","age":50,"height":83,"weight":86,"id":"12"},{"name":"name 13","age":7,"height":29,"weight":89,"id":"13"},{"name":"name 14","age":30,"height":64,"weight":99,"id":"14"},{"name":"name 15","age":7,"height":32,"weight":39,"id":"15"},{"name":"name 16","age":32,"height":52,"weight":87,"id":"16"},{"name":"name 17","age":50,"height":98,"weight":43,"id":"17"},{"name":"name 18","age":81,"height":6,"weight":95,"id":"18"},{"name":"name 19","age":13,"height":21,"weight":2,"id":"19"},{"name":"name 20","age":36,"height":10,"weight":56,"id":"20"}]';
