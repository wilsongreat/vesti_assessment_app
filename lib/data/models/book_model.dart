class BookModel {
  final String? title, author, rating, borrowTime, bookImg;
  bool? isFavourite;

  BookModel(
      {this.isFavourite,
        this.bookImg,
        required this.title,
        required this.author,
        required this.rating,
        required this.borrowTime});

  BookModel copyWith({
    bool? isFavourite,
    String? title,
    String? author,
    String? rating,
    String? borrowTime,
    String? bookImg,
  }) {
    return BookModel(
      isFavourite: isFavourite ?? this.isFavourite,
      title: title ?? this.title,
      author: author ?? this.author,
      rating: rating ?? this.rating,
      borrowTime: borrowTime ?? this.borrowTime,
      bookImg: bookImg ?? this.bookImg,
    );
  }
}


