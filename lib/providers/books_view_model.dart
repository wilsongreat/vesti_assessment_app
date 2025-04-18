import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vesti_assessment_app/data/app_assets.dart';
import 'package:vesti_assessment_app/data/models/book_model.dart';

part 'books_view_model.g.dart';
@riverpod
class BooksViewModel extends _$BooksViewModel {
  @override
  bool build() {
    return false;
  }

  List<BookModel> recentlyBorrowedBooks = [
    BookModel(
        isFavourite: false,
        title: 'The Island of the missing trees',
        author: 'Elie Shafak',
        rating: '4.5,',
        borrowTime: '2 days',
        bookImg: AppAssets.catImg2),
    BookModel(
        isFavourite: true,
        title: 'Theology and Economics',
        author: 'Jeremy kidwell',
        rating: '4.5',
        borrowTime: '5 days',
        bookImg: AppAssets.catImg1),
    BookModel(
        isFavourite: false,
        title: 'Chemistry',
        author: 'Elie Shafak',
        rating: '4.5',
        borrowTime: '3 days',
        bookImg: AppAssets.catImg3),
    BookModel(
        isFavourite: true,
        title: 'The Island of the missing trees',
        author: 'Elie Shafak',
        rating: '4.5',
        borrowTime: '2 days',
        bookImg: AppAssets.catImg4),
    BookModel(
        isFavourite: false,
        title: 'The Island of the missing trees',
        author: 'Elie Shafak',
        rating: '4.5',
        borrowTime: '2 days',
        bookImg: AppAssets.catImg5),
  ];
  List<BookModel> newArrivedBooks = [
    BookModel(
        isFavourite: true,
        title: 'Clap When You Land',
        author: 'Elizbeth Acevedo',
        rating: '4.5',
        borrowTime: '2 days',
        bookImg: AppAssets.catImg5),
    BookModel(
        isFavourite: true,
        title: 'The Attic Child',
        author: 'Lola Jaye',
        rating: '4.5',
        borrowTime: '5 days',
        bookImg: AppAssets.catImg6),
    BookModel(
        isFavourite: false,
        title: 'Chemistry',
        author: 'Elie Shafak',
        rating: '4.5',
        borrowTime: '3 days',
        bookImg: AppAssets.catImg7),
    BookModel(
        isFavourite: true,
        title: 'The Island of the missing trees',
        author: 'Elie Shafak',
        rating: '4.5',
        borrowTime: '2 days',
        bookImg: AppAssets.catImg4),
    BookModel(
        isFavourite: false,
        title: 'The Island of the missing trees',
        author: 'Elie Shafak',
        rating: '4.5',
        borrowTime: '2 days',
        bookImg: AppAssets.catImg5),
  ];
  List<BookModel> recommendedBooks = [
    BookModel(
        isFavourite: true,
        title: 'Clap When You Land',
        author: 'Elizbeth Acevedo',
        rating: '4.5',
        borrowTime: '2 days',
        bookImg: AppAssets.catImg3),
    BookModel(
        isFavourite: false,
        title: 'The Attic Child',
        author: 'Lola Jaye',
        rating: '4.5',
        borrowTime: '5 days',
        bookImg: AppAssets.catImg4),
    BookModel(
        isFavourite: true,
        title: 'Chemistry',
        author: 'Elie Shafak',
        rating: '4.5',
        borrowTime: '3 days',
        bookImg: AppAssets.catImg7),
    BookModel(
        isFavourite: true,
        title: 'The Island of the missing trees',
        author: 'Elie Shafak',
        rating: '4.5',
        borrowTime: '2 days',
        bookImg: AppAssets.catImg4),
    BookModel(
        isFavourite: false,
        title: 'The Island of the missing trees',
        author: 'Elie Shafak',
        rating: '4.5',
        borrowTime: '2 days',
        bookImg: AppAssets.catImg5),
  ];

  //
  // void toggleFavourite(int index) {
  //   final updated = [...state]; // copy
  //   updated[index] = updated[index].copyWith(
  //     isFavourite: !updated[index].isFavourite,
  //   );
  //   state = updated;
  // }

}