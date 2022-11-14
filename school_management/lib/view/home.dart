import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_management/util/color.dart';
import 'package:school_management/util/data.dart';

import '../widgets/categoty_item.dart';
import '../widgets/custom_textbox.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Icon(Icons.clear_all_rounded,size: 28, color: darker,),


                
              ),
            ),
            // NotificationView(number: 1,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
               margin: const EdgeInsets.only(left: 15, right: 15),
              child: const Text("Hello FoodMandu",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),

            ),
            const SizedBox(height: 10,),

            Container(
               margin: const EdgeInsets.only(left: 15, right: 15),
              child: const Text("Find Your Meals",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

            ),
            const SizedBox(height: 10,),
            Container(
               margin:  const EdgeInsets.only(left: 15, right: 15),
            child: CustomTextBox(hint: "Search", prefix: const Icon(Icons.search, color: darker), suffix: const Icon(Icons.filter_list_outlined, color: primary))
              

            ),
            const SizedBox(height: 10,),
            Container(
                margin: const EdgeInsets.only(left: 15, right:15),
              height: 150,

              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",)
                )
              ),

            ),

             SizedBox(height: 25,),

              Container(
              margin: EdgeInsets.only(left: 0),
              child: listCategories(),
            ),
            SizedBox(height: 20,),

            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("See all", style: TextStyle(fontSize: 14, color: darker),),
                ],
              ),
            ),
            SizedBox(height: 5,),

            Container(
              child: listPopulars(),
            ),
            SizedBox(height: 20,),


            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Text("Featured", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: listFeatured(),
            ),
            SizedBox(height: 20,),


            
          ],
        ),
      ),


    );
  }
  
  listPopulars() {



  }
  
  listFeatured() {



  }
  
  listCategories() {
List<Widget> lists = List.generate(categories.length, (index) => CategoryItem(data: categories[index]));
    lists.insert(0, CategoryItem(
      data: {
        "name" : "All",
        "icon" : FontAwesomeIcons.th,
      }, 
      seleted: true,)
    );
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(bottom: 5, left: 15),
        child: Row(
          children: lists
        ),
      );


  }
}