import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/values/colors.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/update_note/update_note_cubit.dart';

import '../../../../common/report/logic/report_cubit.dart';
import '../../add_advertisements/widgets/reusable_dropdown_with_text.dart';
import 'reusable_drop_down_meduim.dart';

class ChangePrivateNoteAlertDialog extends StatefulWidget {
  String id;

  @override
  _ChangePrivateNoteAlertDialogState createState() => _ChangePrivateNoteAlertDialogState();

  ChangePrivateNoteAlertDialog({super.key, required this.id,});
}

class _ChangePrivateNoteAlertDialogState extends State<ChangePrivateNoteAlertDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();
  String? selectedType;
  String _errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Center(
        child: Text('رفع بلاغ' ,   style: GoogleFonts.almarai(
            textStyle: TextStyle(
              color: AppColors.primaryBackground,
              letterSpacing: 0,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            )),),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PropertyTypeDropdownMedium(selectedValue: selectedType, textWidgetString: 'النوع', items: ['شكوي' , "نصب و احتيال" , " بيانات غير صحيحة" , " أخرى"], onChanged: (String? value ) {
              setState(() {
                selectedType= value;
              });
            },),
            SizedBox(height: 15.h),
            TextFormField(
              cursorColor: Colors.black,
              controller: _textEditingController,
              maxLines: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'ملاحظاتك',
                labelStyle: GoogleFonts.almarai(
                  textStyle:  TextStyle(
                    color: const Color.fromRGBO(23, 56, 61, 0.5),
                    letterSpacing: 0,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                hintText: 'اكتب ملاحظاتك هنا',
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
              style: GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: AppColors.primaryText,
                  letterSpacing: 0,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'برجاء كتابة ملاحظاتك'; // Localized error message
                }
                return null;
              },
            ),


            Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15.h, right: 10.w, left: 10.w),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && selectedType != null) {
                    // Form is valid, you can proceed with your submit logic
                    Navigator.of(context).pop();
                    context.read<ReportRealEstatesCubit>().emitAddRealEstateStates(text: _textEditingController.text, real_estate_id: widget.id, type: selectedType ?? "اخرى");
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
                  minimumSize: Size(100.w, 40.h),
                ),
                child: Text(
                  'إبلاغ',
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
              margin: EdgeInsets.only(top: 15.h, right: 10.w, left: 10.w),
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
