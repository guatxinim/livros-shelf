part of data;

class GetLivrosService implements GetLivrosUseCase {
  final GetLivrosGateway getLivrosGateway;

  GetLivrosService({
    required this.getLivrosGateway
  });

  @override
  Future<List<Livro>> call() async {
    return await getLivrosGateway();
  }
}