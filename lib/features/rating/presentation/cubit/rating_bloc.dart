import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_app/features/rating/domain/entities/rating_entity.dart';
import 'package:safety_app/features/rating/domain/usecases/submit_rating_usecase.dart';
import 'package:safety_app/features/rating/presentation/cubit/rating_event.dart';
import 'package:safety_app/features/rating/presentation/cubit/rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final SubmitRatingUseCase submitRatingUseCase;

  RatingBloc(this.submitRatingUseCase) : super(RatingState()) {
    on<StarTapped>((event, emit) {
      emit(state.copyWith(rating: event.rating));
    });

    on<CommentChanged>((event, emit) {
      emit(state.copyWith(comment: event.comment));
    });

 on<SubmitRatingPressed>((event, emit) async {
  emit(state.copyWith(isLoading: true));

  await submitRatingUseCase(
    Rating(
      score: state.rating,
      comment: state.comment,
    ),
  );

  emit(state.copyWith(
    isLoading: false,
    isSuccess: true,
  ));
});

on<ResetRatingState>((event, emit) {
  emit(state.copyWith(isSuccess: false));
});
  }
}
