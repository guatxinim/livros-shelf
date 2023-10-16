import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import '../app/api/api.dart';

part 'adapter/self_adapter.dart';
part 'response/response_json.dart';
part 'middlewares/content_json.dart';

class Server {
  static Future<HttpServer> bootstrap(List<Controller> controllers) async {
    // Use any available host or container IP (usually `0.0.0.0`).
    final ip = InternetAddress.anyIPv4;
    final router = Router();

    ShelfAdapter(controllers: controllers).handler(router);

    // Configure a pipeline that logs requests.
    final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(contentJSON())
      .addHandler(router);

    // For running in containers, we respect the PORT environment variable.
    final port = int.parse(Platform.environment['PORT'] ?? '8080');
    return await serve(handler, ip, port);
  }
}