part of domain;

class Livro {
  final int id;
  final String titulo;
  final String autor;
  final String editora;
  final double preco;

  Livro({
    required this.id, 
    required this.titulo, 
    required this.autor, 
    required this.editora, 
    required this.preco,
  });
}