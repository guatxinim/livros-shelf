import 'package:api_livros/app/api/api.dart';
import 'package:api_livros/app/domain/domain.dart';
import 'package:test/test.dart';

void main() {
  test('deve retornar uma lista de LivroOutputDTO', () async {
    final result = LivroOutputDTO.toCollectionDTO([
        Livro(id: 1, titulo: 'A Seleção', autor: 'Kiera Cass', editora: 'Seguinte', preco: 35.00),
    ]);

    expect(result, isA<List<LivroOutputDTO>>());
  });
}