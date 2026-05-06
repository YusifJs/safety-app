import 'package:safety_app/features/rating/domain/entities/rating_entity.dart';

abstract class RatingRepository {
  Future<void> submitRating(Rating rating);
}

class SubmitRatingUseCase {
  final RatingRepository repository;
  SubmitRatingUseCase(this.repository);

  Future<void> call(Rating rating) async {
    return await repository.submitRating(rating);
  }
}
