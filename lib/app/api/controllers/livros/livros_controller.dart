part of api;

class LivrosController implements Controller {
  final GetLivrosUseCase getLivrosUseCase;

  LivrosController({required this.getLivrosUseCase});
  @override
  String get route => '/livros';

  @override
  Map<String, Handler> get handlers => {
     'GET': GetLivrosHandler(
        getLivrosUseCase: getLivrosUseCase
      ),
  };
}