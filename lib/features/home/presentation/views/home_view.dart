import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/ulits/styles.dart';
import 'package:todo/features/home/presentation/views/widgets/calendar_view/calender_view.dart';
import 'package:todo/features/home/presentation/views/widgets/foucas_view/foucus_view.dart';
import 'package:todo/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/custom_bottom_sheet.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentTab = 0;

  List<Widget> screens = [
    HomeViewBody(),
    CalendarView(),
    FoucusView(),
    ProfileView(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeViewBody();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            context: context,
            builder: (BuildContext context) {
              return CustomBottomSheet();
            },
          );
        },
        backgroundColor: Color(0xFF8687E7),
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 70.h,
          color: Color(0xff363636),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = HomeViewBody();
                        currentTab = 0;
                      });
                    },
                    minWidth: 40.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0
                              ? Colors.white
                              : Color(0xFF757272),
                        ),
                        Text(
                          'Home',
                          style: Styles.textStyle12,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = CalendarView();
                        currentTab = 1;
                      });
                    },
                    minWidth: 40.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: currentTab == 1
                              ? Colors.white
                              : Color(0xFF757272),
                        ),
                        Text(
                          'Calendar',
                          style: Styles.textStyle12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = FoucusView();
                        currentTab = 2;
                      });
                    },
                    minWidth: 40.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.schedule,
                          color: currentTab == 2
                              ? Colors.white
                              : Color(0xFF757272),
                        ),
                        Text(
                          'Focuse',
                          style: Styles.textStyle12,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfileView();
                        currentTab = 3;
                      });
                    },
                    minWidth: 40.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_outlined,
                          color: currentTab == 3
                              ? Colors.white
                              : Color(0xFF757272),
                        ),
                        Text(
                          'Profile',
                          style: Styles.textStyle12,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
