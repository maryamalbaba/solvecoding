class PostRespositoryImpl implements PostRepository {
  final PostServcie _postServcie;

  PostRespositoryImpl({required PostServcie postServcie})
      : _postServcie = postServcie;
  @override
  Future<Either<ErrorModel, List<PostModel>>> getPosts() async {
    try {
      final response = await _postServcie.getPosts();
      if (response.statusCode == 200) {
        List<PostModel> posts = List.generate(
          response.data.length,
          (index) => PostModel.fromMap(
            response.data[index],
          ),
        );
        return right(posts);
      } else {
        return left(
          ErrorModel(
            errorMessage: response.statusMessage.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return left(
        ErrorModel(
          errorMessage: e.message.toString(),
        ),
      );
    }
  }
}