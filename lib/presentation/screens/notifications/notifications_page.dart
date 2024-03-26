import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/values/constants_design.dart';
import 'package:naffith/presentation/screens/notifications/widgets/notifications_card.dart';
import '../../../common/values/colors.dart';
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

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
                  itemCount: 20,
                  //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemBuilder: (context, index){
                    return NotificationsCard(icon:  Icons.notifications_none, title: 'عقارات نفذ', subtitle: 'تم تحويل حاله العقار رقم 566 ل تم البيع', time: '12:00', onTap: (){});
                  },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
