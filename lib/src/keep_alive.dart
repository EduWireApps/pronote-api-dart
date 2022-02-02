part of pronote_api_dart;

class KeepAlive {
  late Communication communication;
  bool keepAlive = true;

  KeepAlive(PronoteClient client) {
    communication = client.communication;
  }

  Future<void> alive() async {
    while (keepAlive) {
      if (DateTime.now().millisecondsSinceEpoch / 1000 - communication.lastPing >= 300) {
        communication.post("Presence", data: {
          '_Signature_': {'onglet': 7}
        });
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
