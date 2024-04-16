import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:naffith/common/values/constants_design.dart';
import 'package:naffith/presentation/screens/notifications/widgets/notifications_card.dart';
import '../../../common/values/colors.dart';
class NotificationsPage extends StatelessWidget {
  final List<RemoteMessage> notificationHistory;

  const NotificationsPage({super.key, required this.notificationHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: PopScope(
       canPop: false,
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top:3.h),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.keyboard_arrow_right_sharp, size: 30.h,
                          color: AppColors.primaryBackground,)),
                        Container(
                          margin: EdgeInsets.only(right: 100.w  , left: 90.h),
                          child: Text(
                            'الاشعارات',
                            style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color: AppColors.primaryBackground,
                                  letterSpacing: 0,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider()
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 812.h * 0.85,
                child: ListView.builder( padding: EdgeInsets.only(bottom: 10.h),
                  itemCount: notificationHistory.length,
                  //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemBuilder: (context, index){
                    return NotificationsCard(icon:  Icons.notifications_none, title: notificationHistory[index].notification!.title ?? '', subtitle: notificationHistory[index].notification!.body ?? '', time: DateFormat('yyyy-MM-dd HH:mm').format(
                        notificationHistory[index].sentTime ?? DateTime.now()), onTap: (){});
                  },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
