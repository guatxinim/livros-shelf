part of infra;

class GetLivrosDAO implements GetLivrosGateway {
  final Connection connection;

  GetLivrosDAO({required this.connection});
  @override
  Future<List<Livro>> call() async {
    try {
      final rows = await connection.query('SELECT * FROM livros');
      return rows.map(LivroDB.toEntity).toList();
    } finally {
      await connection.close();
    }
  }
}
