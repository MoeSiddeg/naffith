import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/values/colors.dart';

class InterfaceListAlertDialogWithoutTilte extends StatefulWidget {
  final List<String> stringList;
  final String title;
  List<String> selectedItems;

  InterfaceListAlertDialogWithoutTilte({required this.stringList, required this.title , required this.selectedItems});

  @override
  _InterfaceListAlertDialogWithoutTilteState createState() => _InterfaceListAlertDialogWithoutTilteState();
}

class _InterfaceListAlertDialogWithoutTilteState extends State<InterfaceListAlertDialogWithoutTilte> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showStringListDialog(context);
      },
      child: Container(
        margin: EdgeInsets.only(left: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(right: 7.5.w, left: 7.5.w, top: 5.h),
              height: 50.h,
              width: 163.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
                border: Border.all(
                  width: 1.sp, // Increase the width here
                  color:const Color.fromRGBO(180, 180, 180, 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left : 8.w),
                    child: Text(
                      widget.title,
                      style: GoogleFonts.almarai(
                        textStyle: TextStyle(
                            color: const Color.fromRGBO(180, 180, 180, 1),
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp),
                      ),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined , size: 20.sp, color: const Color.fromRGBO(180, 180, 180, 1),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showStringListDialog(BuildContext context) async {
    return showDialog(

      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (context, setStateSB) => AlertDialog(
              title: SizedBox(height: 10.h,),
              content: SingleChildScrollView(
                child: Container(
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
                  child: ListBody(
                    children: widget.stringList.map((String item) {
                      return CheckboxListTile(
                          title: Text(
                            item,
                            style: GoogleFonts.almarai(
                              textStyle: TextStyle(
                                  color: AppColors.primaryBackground,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp),
                            ),
                          ),
                          value: widget.selectedItems.contains(item),
                          onChanged: (bool? value) {
                            setStateSB(() {
                              if (value != null) {
                                if (value) {
                                  widget.selectedItems.add(item);
                                } else {
                                  widget.selectedItems.remove(item);
                                }
                              }
                            });
                          },
                          activeColor: AppColors.primaryBackground);
                    }).toList(),
                  ),
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
                          Navigator.of(context).pop(widget.selectedItems);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.w),
                          ),
                          minimumSize: Size(100.w, 40.h),
                        ),
                        child: Text(
                          'حفظ',
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
            ));
      },
    );
  }
}
