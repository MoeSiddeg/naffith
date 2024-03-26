import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/change_to_buy/change_to_buy_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/delete_real_estate_cubit.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/hide_real_estate/hide_real_estate_cubit.dart';
import '../../../../common/values/colors.dart';
import '../logic/change_to_sale/change_to_sale_cubit.dart';
class ChangeAdsStatusDialog extends StatefulWidget {
  final String? id;
  @override
  State<ChangeAdsStatusDialog> createState() => _MyAlertDialogState();

 const ChangeAdsStatusDialog(this.id, {super.key});

}

class _MyAlertDialogState extends State<ChangeAdsStatusDialog> {
  String selectedOption = '';
@override
void initState() {
  super.initState();

  debugPrint(widget.id);
  }
  void performActionBasedOnOption(String option) {
    switch (option) {
      case 'Option 1':
      // Perform action for Option 1
        context.read<HideRealEstateCubit>().emitHideRealEstateStates(widget.id!);
        debugPrint('Option 1 selected');
        break;
      case 'Option 2':
      // Perform action for Option 2
      context.read<DeleteRealEstateCubit>().emitDeleteRealEstateStates(widget.id!);
        debugPrint('Option 2 selected');
        break;
      case 'Option 3':
      // Perform action for Option 3
        context.read<ChangeToSaleCubit>().emitChangeToSaleStates(widget.id!);
        debugPrint('Option 3 selected');
        break;
      case 'Option 4':
      // Perform action for Option 4
        context.read<ChangeToBuyCubit>().emitChangeToBuyStates(widget.id!);
        debugPrint('Option 4 selected');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title:   Center(
        child: Text('تغيير حاله الاعلان' ,   style: GoogleFonts.almarai(
            textStyle: TextStyle(
              color: AppColors.primaryBackground,
              letterSpacing: 0,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            )),),
      ),
      content: Container(
        padding:
        EdgeInsets.only(right: 10.w),
        width: 335.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(250, 250, 253, 0.5019607843137255),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RadioListTile(
              title:   Text('تعليق' ,   style: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: AppColors.primaryBackground,
                    letterSpacing: 0,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  )),),
              value: 'Option 1',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
                activeColor: AppColors.primaryBackground
            ),
            RadioListTile(
              title:  Text('حذف' ,   style: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: AppColors.primaryBackground,
                    letterSpacing: 0,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  )),),
              value: 'Option 2',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
                activeColor: AppColors.primaryBackground
            ),
            RadioListTile(
              title:  Text('تم البيع' ,   style: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: AppColors.primaryBackground,
                    letterSpacing: 0,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  )),),
              value: 'Option 3',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
                activeColor: AppColors.primaryBackground
            ),
            RadioListTile(
              title:Text('تم الشراء' ,   style: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: AppColors.primaryBackground,
                    letterSpacing: 0,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  )),),
              value: 'Option 4',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
                activeColor: AppColors.primaryBackground
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15.h, right: 23.w, left: 10.w),
              child: ElevatedButton(
                onPressed: () {
                  performActionBasedOnOption(selectedOption);
                    Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.w),
                  ),
                  minimumSize: Size(100.w, 40.h),
                ),
                child: Text(
                  'تغيير',
                  style: GoogleFonts.almarai(
                    textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.h, right: 10.w, left: 15.w),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.w),
                  ),
                  minimumSize: Size(100.w, 40.h),
                ),
                child: Text(
                  'إلغاء',
                  style: GoogleFonts.almarai(
                    textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}