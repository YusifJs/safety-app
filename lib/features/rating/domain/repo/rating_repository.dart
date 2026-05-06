import 'package:safety_app/features/rating/domain/entities/rating_entity.dart';

abstract class RatingRepository {
  Future<void> submitRating(Rating rating);
}
