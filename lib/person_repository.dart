import 'dart:convert';

import 'package:http/http.dart';

import 'package:unit_test_example/person.dart';

class PersonRepository {
  final Client client;

  PersonRepository(this.client);

  Future<List<Person>> getPerson() async {
    final response = await client
        .get(Uri.parse('https://6126359d3ab4100017a68e07.mockapi.io/person'));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List;
      return jsonList.map((e) => Person.fromMap(e)).toList();
    } else {
      throw Exception('Erro na internet');
    }
  }
}
