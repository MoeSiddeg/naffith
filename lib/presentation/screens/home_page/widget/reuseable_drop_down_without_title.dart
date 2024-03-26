import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../common/values/colors.dart';

class PropertyTypeDropdownWithOutTitle extends StatefulWidget {
  final String? textWidgetString;
  final String? selectedValue;
  final List<String> items;
  final Function(String?) onChanged;

  const PropertyTypeDropdownWithOutTitle({
    Key? key,
    required this.selectedValue,
    required this.textWidgetString,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PropertyTypeDropdownWithOutTitle> createState() => _PropertyTypeDropdownWithOutTitleState();
}

class _PropertyTypeDropdownWithOutTitleState extends State<PropertyTypeDropdownWithOutTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 5.h),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Row(
                children: [
                  Text(
                    widget.textWidgetString!,
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: const Color.fromRGBO(180, 180, 180, 1),
                        letterSpacing: 0,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              items: widget.items
                  .map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: GoogleFonts.almarai(
                    textStyle: TextStyle(
                      color: AppColors.primaryBackground,
                      letterSpacing: 0,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
              value: widget.selectedValue,
              onChanged: widget.onChanged,
              buttonStyleData: ButtonStyleData(
                height: 50.h,
                width: 163.w,
                padding: EdgeInsets.only(left: 14.h, right: 14.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color.fromRGBO(180, 180, 180, 1),
                  ),
                  color: Colors.white,
                ),
                elevation: 0, // Removed the elevation
              ),
              iconStyleData: IconStyleData(
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                ),
                iconSize: 24.h,
                iconEnabledColor: const Color.fromRGBO(180, 180, 180, 1),
                iconDisabledColor: const Color.fromRGBO(180, 180, 180, 1),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 150.h,
                width: 165.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                offset: const Offset(0, 0),
                scrollbarTheme: ScrollbarThemeData(
                  radius: Radius.circular(40.h),
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
