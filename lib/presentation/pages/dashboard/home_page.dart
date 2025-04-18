import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vesti_assessment_app/config/app_colors.dart';
import 'package:vesti_assessment_app/data/app_assets.dart';
import 'package:vesti_assessment_app/providers/books_view_model.dart';
import 'package:vesti_assessment_app/src/components.dart';
import 'package:vesti_assessment_app/utils/constants.dart';
import 'package:vesti_assessment_app/utils/screen_utils.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  Widget build(BuildContext context) {

    final provider = ref.watch(booksViewModelProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColors.kBlue,
                            ),
                            Gap(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Welcome Back!',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                                TextView(
                                  text: 'Mark Edwards',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            )
                          ],
                        ),
                        SvgPicture.asset(AppAssets.notificationIcon)
                      ],
                    ),
                    Gap(20),
                    CustomSearchBar(),
                    Gap(20),
                    TextView(
                      text: 'Category',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Gap(15),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryTypes.length,
                      itemBuilder: (c, i) {
                        var category = categoryTypes[i];
                        return categoryTabWidget(label: category, index: i);
                      }),
                ),
                Gap(20),
                sectionHeader(label: 'Recently Borrowed'),
                Gap(10),
                SizedBox(
                  height: fullHeight(context) * .25,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (c, i) {
                        final recentlyBorrowedBook = provider.recentlyBorrowedBooks[i];
                        return recentlyBorrowedBookWidget(
                            image: recentlyBorrowedBook.bookImg,
                            daysLeft: recentlyBorrowedBook.borrowTime,
                            isFav: recentlyBorrowedBook.isFavourite,
                          data: provider.recentlyBorrowedBooks[i]
                        );
                      },
                      separatorBuilder: (c, i) {
                        return Gap(10);
                      },
                      itemCount: provider.recentlyBorrowedBooks.length),
                ),
                Gap(20),
                sectionHeader(label: 'New Arrival'),
                Gap(10),
                SizedBox(
                  height: fullHeight(context) * .4,
                  width: fullWidth(context),
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (c, i) {
                        final newArrivedBook = provider.newArrivedBooks[i];
                        return NewBookArrivalCard(
                            image: newArrivedBook.bookImg,
                            isFav: newArrivedBook.isFavourite,
                            title: newArrivedBook.title,
                            author: newArrivedBook.author,
                            rating: newArrivedBook.rating, onTap: () {
                          context.pushNamed(Constants.bookDetails, extra:provider.newArrivedBooks[i]);
                        },

                        );
                      },
                      separatorBuilder: (c, i) {
                        return Gap(10);
                      },
                      itemCount: provider.newArrivedBooks.length),
                ),
                Gap(20),
                sectionHeader(label: 'Recommended For You'),
                Gap(10),
                SizedBox(
                  height: fullHeight(context) * .4,
                  width: fullWidth(context),
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (c, i) {
                        final recommendedBook = provider.recommendedBooks[i];
                        return NewBookArrivalCard(
                            image: recommendedBook.bookImg,
                            isFav: recommendedBook.isFavourite,
                            title: recommendedBook.title,
                            author: recommendedBook.author,
                            rating: recommendedBook.rating, onTap: () {
                          context.pushNamed(Constants.bookDetails, extra:provider.recommendedBooks[i]);
                        },);
                      },
                      separatorBuilder: (c, i) {
                        return Gap(10);
                      },
                      itemCount: provider.recommendedBooks.length),
                ),
              ],
            ).animate().fadeIn(duration: 600.ms, curve: Curves.easeIn).slideY(begin: 0.2, duration: 600.ms, curve: Curves.easeOut),
          ),
        ),
      ),
    );
  }

  Widget sectionHeader({label}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(
          text: label,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        TextView(
          text: 'View all',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.kBlue,
        ),
      ],
    );
  }

  List<String> categoryTypes = [
    'All',
    'Historical Fiction',
    'Engineering',
    'Comedy'
  ];
  int categoryIndex = 0;
  Widget categoryTabWidget({label, index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          categoryIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
            color: categoryIndex == index ? AppColors.kBlue : AppColors.kWhite,
            border: Border.all(color: AppColors.kBorder),
            borderRadius: BorderRadius.circular(10)),
        child: TextView(
          text: label,
          fontWeight: FontWeight.w400,
          color: categoryIndex == index ? AppColors.kWhite : AppColors.kFade,
        ),
      ),
    );
  }

  Widget recentlyBorrowedBookWidget({image, isFav, daysLeft, data}) {
    return GestureDetector(
      onTap: (){
        context.pushNamed(Constants.bookDetails, extra:data);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookCard(image: image, isFav: isFav),
          Gap(10),
          TextView(text: '$daysLeft left')
        ],
      ),
    );
  }


  Widget recommdedBookWidget({title, author, rating, image, isFav,data}) {
    return SizedBox(
      width: fullWidth(context) * .5,
      height: fullHeight(context) * .5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookCard(
            onTap: (){
              context.pushNamed(Constants.bookDetails, extra:data);
            },
              height: fullHeight(context) * .3,
              width: fullWidth(context) * .5,
              image: image,
              isFav: isFav),
          Gap(10),
          SizedBox(
              width: fullWidth(context) * .3,
              child: TextView(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                textOverflow: TextOverflow.ellipsis,
              )),
          TextView(
            text: author,
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Gap(5),
              TextView(
                text: rating,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


