import 'package:flutter/material.dart';
import 'package:school_management/util/color.dart';
import 'package:school_management/widgets/favorite.dart';

// import 'favorite_box.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({ Key? key, required this.data }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final data;

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        margin: const EdgeInsets.only(right: 15),
        height: 170, width: 220,
        // color: secondary,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              child: Container(
                height: 120, width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(data["image"])
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0, right: 5,
              child: FavoriteBox(isFavorited: data["is_favorited"],)
            ),
            Positioned(
              top: 140,
              child: Container(
                width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(data["name"], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)),
                        const SizedBox(width: 5,),
                        Text(data["price"], style: const TextStyle(fontSize: 14, color: primary, fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ]
                )
              ),
            )
          ],
        ),
      );
  }
}