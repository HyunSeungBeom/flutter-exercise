sealed class HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {
  final List<HomeItem> items;

  HomeStateLoaded(this.items);
}

class HomeStateError extends HomeState {
  final String message;

  HomeStateError(this.message);
}

class HomeItem {
  final String todo;
  final bool isDone;

  HomeItem(this.todo, this.isDone);
}
