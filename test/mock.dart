import 'package:api_livros/app/data/data.dart';
import 'package:api_livros/app/domain/domain.dart';
import 'package:api_livros/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';

class MockGetLivrosUseCase extends Mock implements GetLivrosUseCase {}

class MockGetLivrosGateway extends Mock implements GetLivrosGateway {}

class MockConnection extends Mock implements Connection {}

final livroMock = Livro(id: 1, titulo: 'A Seleção', autor: 'Kiera Cass', editora: 'Seguinte', preco: 35.00);