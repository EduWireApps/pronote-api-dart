part of pronote_api_dart;

class Utils {
  const Utils._();

  static List<String> splitAdress(String address) {
    final Uri uri = Uri.parse(address);
    return [
      "${uri.scheme}://${uri.host}${uri.port != 80 ? ':${uri.port}' : ''}",
      "${uri.path}${uri.query == '' ? '' : '?'}${uri.query}",
    ];
  }
}

class Response<T> {
  final T? data;
  final String? error;

  const Response({this.data, this.error});
}
