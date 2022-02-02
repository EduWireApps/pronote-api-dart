part of pronote_api_dart;

class Session {
  final Map<String, String> headers = {};

  Future<String> get(String url) async {
    final http.Response response = await http.get(Uri.parse(url), headers: headers);
    updateCookie(response);
    return response.body;
  }

  Future post(String url, dynamic data) async {
    final http.Response response = await http.post(Uri.parse(url), body: data, headers: headers);
    updateCookie(response);
    return response.body;
  }

  void updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      final int index = rawCookie.indexOf(';');
      headers['cookie'] = (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}
