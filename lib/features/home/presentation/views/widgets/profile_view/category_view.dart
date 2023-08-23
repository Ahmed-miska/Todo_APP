import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/ulits/styles.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
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
              height: 8,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .45,
              width: MediaQuery.of(context).size.width * .7,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          zZ(
                              color: Color(0xffCCFF80),
                              icon: Icon(
                                Icons.food_bank,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Grocery'),
                          zZ(
                              color: Color(0xffFF9680),
                              icon: Icon(
                                Icons.business_center_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Work'),
                          zZ(
                              color: Color(0xff80FFFF),
                              icon: Icon(
                                Icons.fitness_center_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Sport'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          zZ(
                              color: Color(0xff80FFD9),
                              icon: Icon(
                                Icons.design_services_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Design'),
                          zZ(
                              color: Color(0xff809CFF),
                              icon: Icon(
                                Icons.school_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'University'),
                          zZ(
                              color: Color(0xffFF80EB),
                              icon: Icon(
                                Icons.phone_android_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Social'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          zZ(
                              color: Color(0xffFC80FF),
                              icon: Icon(
                                Icons.music_note_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Music'),
                          zZ(
                              color: Color(0xff80FFA3),
                              icon: Icon(
                                Icons.heart_broken_outlined,
                                color: Colors.black.withOpacity(.3),
                              ),
                              text: 'Health'),
                          zZ(
                              color: Color(0xff80D1FF),
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
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text(
                'Add Category',
                style: Styles.textStyle16.copyWith(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff8687E7),
                fixedSize: Size(MediaQuery.of(context).size.width * .8, 48),
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector zZ(
      {required Color color, required Icon icon, required String text}) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Column(
        children: [
          Container(
            height: 64,
            width: 64,
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
            style: Styles.textStyle16,
          )
        ],
      ),
    );
  }
}
