import 'package:api_livros/app/api/api.dart';
import 'package:api_livros/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late GetLivrosHandler handler;
  late MockGetLivrosUseCase mockGetLivrosUseCase;

  setUpAll(() {
    mockGetLivrosUseCase = MockGetLivrosUseCase();
    handler = GetLivrosHandler(getLivrosUseCase: mockGetLivrosUseCase);
  });

  group('GetLivrosHandler', () {
    test('deve retornar uma instancia de ResponseHandler.', () async {
      when(() => mockGetLivrosUseCase.call()).thenAnswer((_) async => []);
      final result = await handler.call();

      expect(result, isA<ResponseHandler>());
    });
    test('deve retornar um status ok', () async {
      when(() => mockGetLivrosUseCase.call()).thenAnswer((_) async => []);
      final result = await handler.call();

      expect(result.status, StatusHandler.ok);
    });
    test('deve retornar uma lista de LivroOutputDTO', () async {
      when(() => mockGetLivrosUseCase.call()).thenAnswer((_) async => [Livro(id: 1, titulo: 'A Seleção', autor: 'Kiera Cass', editora: 'Seguinte', preco: 35.00)]);
      final result = await handler.call();

      expect(result.body, isA<List<LivroOutputDTO>>());
    });
    test('deve retornar um status internalServerError quando um erro desconhecido acontecer', () async {
      when(() => mockGetLivrosUseCase.call()).thenThrow(Exception());
      final result = await handler.call();

      expect(result.status, StatusHandler.internalServerError);
    });
  });
}