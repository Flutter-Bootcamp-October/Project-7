abstract class HomeEvent {}

class CheckEvent extends HomeEvent {
  final String askController;

  CheckEvent({required this.askController});
}

class AddToFavoriteEvent extends HomeEvent {}
