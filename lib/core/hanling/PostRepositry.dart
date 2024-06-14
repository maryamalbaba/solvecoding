
abstract class PostRepository {
  Future<Either<ErrorModel, List<PostModel>>> getPosts();
}

