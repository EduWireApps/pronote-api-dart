part of pronote_api_dart;

class Document {
  final String id;
  final String name;
  final int type;
  final int length;

  Document({
    required this.id,
    required this.name,
    required this.type,
    required this.length,
  });
}
