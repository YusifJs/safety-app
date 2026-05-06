abstract class RatingEvent {}

class StarTapped extends RatingEvent {
  final int rating;
  StarTapped(this.rating);
}

class CommentChanged extends RatingEvent {
  final String comment;
  CommentChanged(this.comment);
}

class SubmitRatingPressed extends RatingEvent {}

class ResetRatingState extends RatingEvent {}