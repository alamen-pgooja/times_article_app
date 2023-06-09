abstract class UIState<E> {}

class Initial<E> extends UIState<E> {}

class IsLoading<E> extends UIState<E> {}

class Empty<E> extends UIState<E> {}

class Success<E> extends UIState<E> {
  E data;

  Success(this.data);
}

class Failure<E> extends UIState<E> {
  String error;

  Failure(this.error);
}