import 'package:api_livros/app/api/api.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late LivrosController controller;
  late MockGetLivrosUseCase mockGetLivrosUseCase;

  setUpAll(() {
    mockGetLivrosUseCase = MockGetLivrosUseCase();
    controller = LivrosController(
      getLivrosUseCase: mockGetLivrosUseCase
    );
  });

  group('LivrosController:', () {
    test('deve conter uma route "/livros"', () async {
      expect(controller.route, '/livros');
    });

    test('deve conter uma key "GET" para o handler GetLivrosHandler',
        () async {
      expect(controller.handlers['GET'], isA<GetLivrosHandler>());
    });
  });
}