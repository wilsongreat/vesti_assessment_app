import 'package:flutter/material.dart';
import 'package:vesti_assessment_app/src/components.dart';
import 'package:vesti_assessment_app/utils/screen_utils.dart';

class NewBookArrivalCard extends StatelessWidget {
  final String? image, daysLeft,title,author,rating;
  final bool? isFav;
  final VoidCallback? onTap;
  final VoidCallback? onTapFav;
  const NewBookArrivalCard({super.key, this.image, this.isFav, this.daysLeft, this.title, this.author, this.rating,  this.onTap, this.onTapFav});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: fullWidth(context) * .5,
        height: fullHeight(context) * .5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookCard(
              onTapFav: onTapFav,
                height: fullHeight(context) * .3,
                width: fullWidth(context) * .5,
                image: image!,
                isFav: isFav!
            ),
            Gap(10),
            SizedBox(
                width: fullWidth(context) * .3,
                child: TextView(
                  text: title!,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textOverflow: TextOverflow.ellipsis,
                )),
            TextView(
              text: author!,
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
                  text: rating!,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
