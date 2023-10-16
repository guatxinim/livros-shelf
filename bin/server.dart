import 'package:api_livros/config/config.dart';
import 'package:api_livros/server/server.dart';

void main() {
  Server
    .bootstrap(controllers)
    .then((server) => print('Server listening on port ${server.port}'))
    .catchError(print);
}
