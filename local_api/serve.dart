import 'dart:io';

Future<void> main() async {
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
  stdout.writeln('Serving cards.json on http://127.0.0.1:${server.port}/cards.json');

  await for (final request in server) {
    final file = File('cards.json');
    if (!file.existsSync()) {
      request.response.statusCode = HttpStatus.notFound;
      await request.response.close();
      continue;
    }

    request.response.headers.contentType = ContentType.json;
    request.response.write(await file.readAsString());
    await request.response.close();
  }
}
