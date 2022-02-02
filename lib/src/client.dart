part of pronote_api_dart;

class PronoteClient {
  final String username;
  final String password;
  final String url;
  final bool isCas; // either using qrcode or mobileLogin
  late final Communication communication;
  late Encryption encryption;
  late Map<String, dynamic> attributes;

  PronoteClient({required this.username, required this.password, required this.url, required this.isCas}) {
    communication = Communication(url);
  }

  Future<Response<bool>> init() async {}

  _login();

  Response<String> getDownloadUrl(Document document) {
    final Map<String, dynamic> data = {"N": document.id, "G": document.type};
    final res = encryption.aesEncrypt(convert.utf8.encode(convert.jsonEncode(data)));
    if (res.error != null) return res;
    final String encrypted = res.data!;
    final String url =
        "${communication.urlRoot}/FichiersExternes/$encrypted/${document.name}?Session=${attributes['h']}";
    return Response(data: url);
  }

  getLessons();

  getPeriods();

  reset();

  readPoll();

  answerPoll();
}
