import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'data_repository.dart';

final repository = DataRepository();

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/json/subway/<name>', _subwayHandler)
  ..get('/echo/<message>', _echoHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

Future<Response> _subwayHandler(Request request) async {
  try {
    final name = request.params['name'];

    final results = await repository.getSubwayList();

    return Response.ok(results.map((e) => e.toMap()).toString(), headers: {
      'content-type': 'application/json',
      'Access-Control-Allow-Origin': '*',
    });
  } catch (e) {
    return Response.ok('정상 동작입니다');
  }
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
