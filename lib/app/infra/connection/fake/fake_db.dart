part of infra;

class FakeDB implements Connection {
  @override
  Future<void> close() async {
    print('close connection');
  }

  @override
  Future<List<Map<String, dynamic>>> query(
    String statement,
    [Map<String, dynamic> params = const {},]
  ) async {
    return [
        {
        'id': 1,
        'titulo': 'A Seleção', 
        'autor': 'Kiera Cass', 
        'editora': 'Seguinte', 
        'preco': 35.00,
      }
    ];
  }
}