part of config;

final controllers = <Controller>[
  LivrosController(
    getLivrosUseCase: GetLivrosService(
      getLivrosGateway: GetLivrosDAO(
        connection: FakeDB(),
      ),
    ),
  ),
];
