abstract class BaseUseCase<T, R> {
  Future<T> call(R request);
}

class EmptyRequest {}
