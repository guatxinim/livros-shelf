import 'dart:async';

import 'package:api_livros/app/domain/domain.dart';
import 'package:api_livros/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late MockConnection connection;
  late GetLivrosDAO dao;

  setUpAll(() {
    connection = MockConnection();
    dao = GetLivrosDAO(connection: connection);
  });

  group('GetLivrosDAO', () {
    test('deve retornar uma lista de livros', () async {
      when(() => connection.query(any())).thenAnswer((_) async => [
        {
          'id': 1, 
          'titulo': 'A Seleção', 
          'autor': 'Kiera Cass', 
          'editora': 'Seguinte', 
          'preco': 35.00
        }
      ]);

      when(() => connection.close())
        .thenAnswer((_) async => Completer<void>().complete());

      final result = await dao.call();

      expect(result, isA<List<Livro>>());
    });
  });
}