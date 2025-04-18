import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vesti_assessment_app/config/app_colors.dart';
import 'package:vesti_assessment_app/data/app_assets.dart';
import 'package:vesti_assessment_app/data/models/book_model.dart';
import 'package:vesti_assessment_app/presentation/components/book_card_widgets/new_arrival_book_card.dart';
import 'package:vesti_assessment_app/presentation/components/shared/custom_text.dart';
import 'package:vesti_assessment_app/presentation/components/shared/gap.dart';
import 'package:vesti_assessment_app/providers/books_view_model.dart';
import 'package:vesti_assessment_app/utils/screen_utils.dart';

class BookDetailsPage extends ConsumerWidget {
  final BookModel book;
  const BookDetailsPage( {super.key,required this.book,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(booksViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => context.pop(), child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.kWhite,
        centerTitle: true,
        title: TextView(
          text: 'Book Details',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.kBlue,
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppAssets.warningIcon),
                  Gap(7),
                  TextView(
                    text: 'Out of stock',
                    fontSize: 16,
                    color: AppColors.kRed,
                    fontWeight: FontWeight.w300,
                  )
                ],
              ),
              Gap(20),
              Column(
                children: [
                  Container(
                    height: fullHeight(context) * .26,
                    width: fullWidth(context) * .45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage(book.bookImg!),
                            fit: BoxFit.cover)),
                  ),
                  TextView(
                    text: book.title!,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  TextView(
                    text: book.author!,
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsInfoWidget(context,
                          label: 'Rating',
                          info: book.rating,
                          widget: Icon(
                            Icons.star,
                            color: Colors.amber,
                          )),
                      detailsInfoWidget(
                        context,
                        label: 'Pages',
                        info: '500',
                      ),
                      detailsInfoWidget(
                        context,
                        label: 'Language',
                        info: 'ENG',
                      ),
                    ],
                  ),
                  Gap(20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextView(
                        text: 'Synopsis',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      Gap(10),
                      synopsisChip('Fantasy'),
                      Gap(10),
                      synopsisChip('Thriller'),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: AppColors.kBorder.withValues(alpha: .5),
                            shape: BoxShape.circle),
                        child: SvgPicture.asset(AppAssets.heartIcon,

                            height: 20, width: 20, colorFilter:ColorFilter.mode(
                            book.isFavourite! ? AppColors.kRed : AppColors.kFade.withValues(alpha: .3),
                            BlendMode.srcIn,
                          ),),
                      ),
                    ],
                  ),
                  Gap(10),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Lorem ipsum dolor sit amet, consectetur. Accumsan enim convallis molestie nisl aliquam libero netus pellentesque nulla. Ut et sit lacus in diam nullam quis. Facilisis tincidunt orci nulla lectus. Sit viverra vulputate urna nascetur quam....     ',
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        TextSpan(
                          text: 'Read More',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: AppColors.kBlue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle read more tap
                              debugPrint('Read More tapped');
                            },
                        ),
                      ],
                    ),
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  Gap(20),
                ],
              ),
              sectionHeader(label: 'Reviews'),
              Gap(20),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (c, i) {
                    return reviewWidget(context);
                  }),
              sectionHeader(label: 'More Like This'),
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
                          rating: recommendedBook.rating
                      );
                    },
                    separatorBuilder: (c, i) {
                      return Gap(10);
                    },
                    itemCount: provider.recommendedBooks.length),
              ),
            ],
          )
              .animate()
              .fadeIn(duration: 600.ms, curve: Curves.easeIn)
              .slideY(begin: 0.2, duration: 600.ms, curve: Curves.easeOut),
        ),
      ),
    );
  }

  Widget reviewWidget(BuildContext context) {
    return SizedBox(
      width: fullWidth(context),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(
                AppAssets.avatarIcon,
              ),
              backgroundColor: AppColors.kWhite,
            ),
            Gap(10),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: 'Ajanlekoko Chisom',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          Gap(5),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < 4 ? Icons.star : Icons.star_border,
                                size: 20,
                                color: const Color(0xFFFBBF24),
                              );
                            }),
                          ),
                        ],
                      ),
                      TextView(
                        text: '2 weeks ago',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                  Gap(10),
                  TextView(
                    text:
                        'Lorem ipsum dolor sit amet consectetur. Accumsan enim convallis molestie nisl aliquam libero netus pellentesque nulla',
                    color: AppColors.kFade,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget synopsisChip(title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: AppColors.kBlue.withValues(alpha: .05),
          borderRadius: BorderRadius.circular(5)),
      alignment: Alignment.center,
      child: TextView(
        text: title,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.kBlue,
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

  Widget detailsInfoWidget(BuildContext context,
      {label, info, Widget? widget}) {
    return Container(
      height: fullHeight(context) * .097,
      width: fullWidth(context) * .27,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.kBorder, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextView(
              text: label,
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: AppColors.kBlue),
          Divider(
            color: AppColors.kBorder,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget ?? SizedBox.shrink(),
              TextView(
                text: info,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.kBlue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
