class PostEntity {
  final int id;
  final String title;
  final String body;

  PostEntity({
    required this.id,
    required this.title,
    required this.body,
  });
}

class ErrorModel {
  final String errorMessage;

  ErrorModel({required this.errorMessage});
}