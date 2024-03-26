import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/values/colors.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/chane_status/change_status_cubit.dart';


class ChangeStatusAlertDialog extends StatefulWidget {
  String id;

  @override
  _ChangeStatusAlertDialogState createState() => _ChangeStatusAlertDialogState();

  ChangeStatusAlertDialog({super.key, required this.id});
}

class _ChangeStatusAlertDialogState extends State<ChangeStatusAlertDialog> {
  final TextEditingController selectedValueController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    String? showValue;
    List<String> items = ['مكتمل', 'مستمر'];
    return AlertDialog(

      title: Center(child:  Text('تحديث الحالة', style:  GoogleFonts.almarai(
        textStyle:  TextStyle(
        color: AppColors.primaryBackground,
    letterSpacing: 0,
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    ),)),),
      content:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField2<String>(
                  // Assuming you have a list of options for the dropdown
                  items: items.map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: GoogleFonts.almarai(
                        textStyle: TextStyle(
                          color: AppColors.primarySecondaryBackground,
                          letterSpacing: 0,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )).toList(),
                  value: showValue, // Initialize with a default value if needed
                  onChanged: (value) {
                    setState(() {
                      showValue = value;
                      if (showValue!.contains("مكتمل")) {
                        selectedValueController.text = 'complate';
                      } else {
                        selectedValueController.text = 'ongoing';
                      }
                    });
                    print(showValue);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'اختر الحالة',
                    labelStyle: GoogleFonts.almarai(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(23, 56, 61, 0.5),
                        letterSpacing: 0,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    hintText: 'اختر الحالة',
                    hintStyle: GoogleFonts.almarai(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(23, 56, 61, 0.5),
                        letterSpacing: 0,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(180, 180, 180, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(180, 180, 180, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(180, 180, 180, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(180, 180, 180, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'برجاء اختيار حالة'; // Localized error message
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),


      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15.h , left: 5.w, right: 5.w),
              child: ElevatedButton(
                onPressed: () {
                  print(selectedValueController.text);
                  if (selectedValueController.text.isNotEmpty) {
                    // Form is valid, you can proceed with your submit logic
                 Navigator.of(context).pop();
                    context.read<ChangeStatusCubit>().emitChangeStatusStates(
                        widget.id, selectedValueController.text);
                  } else {
                    setState(() {
                      // Set error message if validation fails
                      _errorMessage = 'الرجاء التأكد من البيانات';
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.w),
                  ),
                  minimumSize: Size(235.w, 40.h),
                ),
                child: Text(
                  'تحديث الحالة',
                  style: GoogleFonts.almarai(
                    textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0,
                      fontSize: 11.sp,
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
