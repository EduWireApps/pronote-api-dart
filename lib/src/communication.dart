part of pronote_api_dart;

class Communication {
  final String url;
  late final String urlRoot;
  late final String urlPath;
  late Encryption encryption;
  late double lastPing;

  Communication(this.url) {
    final split = Utils.splitAdress(url);
    urlRoot = split[0];
    urlPath = split[1];
  }

  Future<Response<Map<String, dynamic>>> post(String name, {dynamic data}) async {
    return Response(error: "Not implemented");
  }
}
