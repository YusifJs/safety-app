class RatingState {
  final int rating;
  final String comment;
  final bool isLoading;
  final bool isSuccess;

  RatingState({
    this.rating = 0,
    this.comment = '',
    this.isLoading = false,
    this.isSuccess = false,
  });

  RatingState copyWith({
    int? rating,
    String? comment,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return RatingState(
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
