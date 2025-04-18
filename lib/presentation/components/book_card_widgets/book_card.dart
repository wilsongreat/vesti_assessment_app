import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vesti_assessment_app/config/app_colors.dart';
import 'package:vesti_assessment_app/data/app_assets.dart';
import 'package:vesti_assessment_app/utils/screen_utils.dart';

class BookCard extends ConsumerStatefulWidget {
  final String image;
   final bool? isFav;
  final double? width, height;
  final VoidCallback? onTap;
  final VoidCallback? onTapFav;
    const BookCard( {super.key, required this.image,required this.onTapFav, this.isFav , this.width, this.height, this.onTap});

  @override
  ConsumerState<BookCard> createState() => _BookCardState();
}


class _BookCardState extends ConsumerState<BookCard> {
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.topRight,
      height: widget.height ?? fullHeight(context) * .21,
      width: widget.width ?? fullWidth(context) * .33,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.kBorder,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(widget.image), fit: BoxFit.cover)),
      child: GestureDetector(
        onTap: () {
          widget.onTap;
        },
        child: GestureDetector(
          onTap: widget.onTapFav,
          child: Container(
            height: 30,
            width: 30,
            padding: EdgeInsets.all(7),
            decoration:
            BoxDecoration(color: AppColors.kWhite, shape: BoxShape.circle),
            child: SvgPicture.asset(
              AppAssets.heartIcon,
              height: 20,
              width: 20,
              colorFilter: ColorFilter.mode(
                widget.isFav!
                    ? AppColors.kRed
                    : AppColors.kFade.withValues(alpha: 0.3),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


