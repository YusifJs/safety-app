import 'package:safety_app/features/rating/domain/entities/rating_entity.dart';

class RatingModel extends Rating {
  const RatingModel({required int score, String? comment})
    : super(score: score, comment: comment);

  Map<String, dynamic> toJson() => {'score': score, 'comment': comment};
}
