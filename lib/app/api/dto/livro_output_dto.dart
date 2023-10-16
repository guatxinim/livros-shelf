part of api;

class LivroOutputDTO {
  final int id;
  final String titulo;
  final String autor;
  final String editora;
  final double preco;

  LivroOutputDTO({
    required this.id, 
    required this.titulo, 
    required this.autor, 
    required this.editora, 
    required this.preco,
  });

  factory LivroOutputDTO.toDTO(Livro livro) {
    return LivroOutputDTO(
        id: livro.id, 
        titulo: livro.titulo, 
        autor: livro.autor, 
        editora: livro.editora, 
        preco: livro.preco
    );
  }
  static List<LivroOutputDTO> toCollectionDTO(List<Livro> livros) {
    return livros.map(LivroOutputDTO.toDTO).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id, 
      'titulo': titulo, 
      'autor': autor, 
      'editora': editora, 
      'preco': preco,
    };
  }
}