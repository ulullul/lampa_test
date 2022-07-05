abstract class RequiredUseCase<T, P> {
  Future<T> call({required P params});
}
