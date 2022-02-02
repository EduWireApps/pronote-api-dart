part of pronote_api_dart;

class PronoteClient {
  final String username;
  final String password;
  final String url;
  final bool isCas; // either using qrcode or mobileLogin
  late final Communication communication;
  late Encryption encryption;

  PronoteClient({required this.username, required this.password, required this.url, required this.isCas}) {
    communication = Communication(url);
  }
}
