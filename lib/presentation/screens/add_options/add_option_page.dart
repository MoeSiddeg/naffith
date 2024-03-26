import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/add_advertisements/add_advertisement_land_page.dart';
import 'package:naffith/presentation/screens/add_advertisements/add_advertisement_page.dart';
import '../../../common/values/colors.dart';
class OptionPage extends StatelessWidget {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 40.h),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 30.h,
                          color: AppColors.primaryBackground,
                        )),
                    Container(
                      margin: EdgeInsets.only(right: 70.w, left: 70.h),
                      child: Text(
                        'إختر أساس العقار',
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
              const Divider(),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250.h,
                ),
                Padding(
                  padding:  EdgeInsets.only(right: 25.w, left: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddAdvertisementLandPage()));
                        },
                        child: Container(
                          height: 150.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp)
                          ),
                          child: Image.asset('assets/images/land.png' , fit: BoxFit.cover,),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddAdvertisementPage()));
                        },
                        child: Container(
                          height: 150.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp)
                          ),
                          child: Image.asset('assets/images/realEstate.png' , fit: BoxFit.cover,),
                        ),
                      ),
                    ],
                  ),
                )
              ],
  )
            ],
          ),
        ],
      ),
    );
  }
}
