import 'package:flutter/material.dart';
// import 'package:food_app/theme/color.dart';
// import 'package:food_app/widgets/custom_image.dart';
import 'package:school_management/util/color.dart';
import 'package:school_management/widgets/custom_image.dart';
import 'package:school_management/widgets/favorite.dart';

// import 'favorite_box.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({ Key? key, required this.data, this.onTap}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(
              data["image"], 
              width: 60, height:60,
              radius: 10,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data["name"],  maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 3,),
                  Text(data["sources"], maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 4,),
                  Row(children: [
                    const Icon(Icons.star_rounded, size: 14, color: primary,),
                    const SizedBox(width: 2,),
                    Text(data["rate"] + " (" + data["rate_number"] + ")", style: const TextStyle(fontSize: 12, color: primary)),
                  ],)
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Text(data["price"],  maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: primary)),
                const SizedBox(height: 10,),
                FavoriteBox(iconSize: 13, isFavorited: data["is_favorited"],)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
