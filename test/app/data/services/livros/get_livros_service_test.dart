import 'package:api_livros/app/data/data.dart';
import 'package:api_livros/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late MockGetLivrosGateway mockGetLivrosGateway;
  late GetLivrosService service;

  setUpAll(() {
    mockGetLivrosGateway = MockGetLivrosGateway();
    service = GetLivrosService(getLivrosGateway: mockGetLivrosGateway);
  });

  group('GetLivrosService', () {
    test('deve retornar uma lista de livros', () async {
      when(() => mockGetLivrosGateway.call()).thenAnswer((_) async => [livroMock]);
      final result = await service.call();

      expect(result, isA<List<Livro>>());
    });
  });
}