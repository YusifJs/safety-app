import 'package:safety_app/features/rating/domain/entities/rating_entity.dart';
import 'package:safety_app/features/rating/domain/usecases/submit_rating_usecase.dart';

class RatingRepositoryImpl implements RatingRepository {
  @override
  Future<void> submitRating(Rating rating) async {
    await Future.delayed(const Duration(seconds: 2));

    print('Rating: ${rating.score}, Comment: ${rating.comment}');
  }
}
