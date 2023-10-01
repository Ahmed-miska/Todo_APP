import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/category_items.dart';

import '../../../../../../core/ulits/styles.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryItems categoryItems = CategoryItems();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Choose Category',
              style: Styles.textStyle16,
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 400.h,
              width: 280.w,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          categoryItem(
                              color: categoryItems.text == 'Grocery'
                                  ? Colors.grey
                                  : Color(0xffCCFF80),
                              icon: Icon(
                                Icons.food_bank,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Grocery'),
                          categoryItem(
                              color: categoryItems.text == 'Work'
                                  ? Colors.grey
                                  : Color(0xffFF9680),
                              icon: Icon(
                                Icons.business_center_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Work'),
                          categoryItem(
                              color: categoryItems.text == 'Sport'
                                  ? Colors.grey
                                  : Color(0xff80FFFF),
                              icon: Icon(
                                Icons.fitness_center_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Sport'),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          categoryItem(
                              color: categoryItems.text == 'Design'
                                  ? Colors.grey
                                  : Color(0xff80FFD9),
                              icon: Icon(
                                Icons.design_services_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Design'),
                          categoryItem(
                              color: categoryItems.text == 'University'
                                  ? Colors.grey
                                  : Color(0xff809CFF),
                              icon: Icon(
                                Icons.school_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'University'),
                          categoryItem(
                              color: categoryItems.text == 'Social'
                                  ? Colors.grey
                                  : Color(0xffFF80EB),
                              icon: Icon(
                                Icons.phone_android_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Social'),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          categoryItem(
                              color: categoryItems.text == 'Music'
                                  ? Colors.grey
                                  : Color(0xffFC80FF),
                              icon: Icon(
                                Icons.music_note_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Music'),
                          categoryItem(
                              color: categoryItems.text == 'Health'
                                  ? Colors.grey
                                  : Color(0xff80FFA3),
                              icon: Icon(
                                Icons.heart_broken_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Health'),
                          categoryItem(
                              color: categoryItems.text == 'Movie'
                                  ? Colors.grey
                                  : Color(0xff80D1FF),
                              icon: Icon(
                                Icons.movie_creation_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Movie'),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                print(categoryItems.color);
                print(categoryItems.text);
                print(categoryItems.icon);
                Navigator.pop(context, categoryItems);
              },
              child: Text(
                'Add Category',
                style: Styles.textStyle16.copyWith(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff8687E7),
                fixedSize: Size(250.w, 48.h),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector categoryItem({
    required Color color,
    required Icon icon,
    required String text,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          categoryItems.text = text;
          categoryItems.color = color;
          categoryItems.icon = icon;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 55.h,
            width: 45.w,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
            ),
            child: icon,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: Styles.textStyle12,
          )
        ],
      ),
    );
  }
}
