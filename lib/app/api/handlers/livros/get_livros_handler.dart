part of api;

class GetLivrosHandler implements Handler {
  final GetLivrosUseCase getLivrosUseCase;

  GetLivrosHandler({required this.getLivrosUseCase});
  @override
  Future<ResponseHandler> call() async {
    try {
      final livros = await getLivrosUseCase();
      return ResponseHandler<List<LivroOutputDTO>>(
        status: StatusHandler.ok, 
        body: LivroOutputDTO.toCollectionDTO(livros),
      );
    } catch(e) {
      return ResponseHandler(status: StatusHandler.internalServerError);
    }
  }
}