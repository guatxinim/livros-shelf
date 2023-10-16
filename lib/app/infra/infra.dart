library infra;

import 'package:api_livros/app/data/data.dart';
import 'package:api_livros/app/domain/domain.dart';
import 'package:postgres/postgres.dart';

part 'dao/livros/get_livros_dao.dart';
part 'connection/connection.dart';
part 'connection/fake/fake_db.dart';
part 'connection/postgres/postgres.dart';

class LivroDB {
  LivroDB._();

  static Livro toEntity(Map<String, dynamic> row) {
    return Livro(
      id: row['id'], 
      titulo: row['titulo'],
      autor: row['autor'], 
      editora: row['editora'], 
      preco: row['preco'],
    );
  }
}