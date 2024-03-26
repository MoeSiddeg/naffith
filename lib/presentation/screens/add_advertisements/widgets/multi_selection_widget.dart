import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../../common/values/colors.dart';

class MultiTypeDropdown extends StatefulWidget {
  final String? textWidgetString;
  final List<String> selectedValues;
  final List<String> items;
  final Function(List<String>?) onChanged;

  const MultiTypeDropdown({
    Key? key,
    required this.selectedValues,
    required this.textWidgetString,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<MultiTypeDropdown> createState() => _MultiTypeDropdownState();
}

class _MultiTypeDropdownState extends State<MultiTypeDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(right: 5.w, left: 10.w),
          child: Text(
            widget.textWidgetString!,
            style: GoogleFonts.almarai(
              textStyle: TextStyle(
                color: AppColors.primaryBackground,
                letterSpacing: 0,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 5.h),
          child: InkWell(
            onTap: () async {
              final selectedValues = await showDialog<List<String>>(
                context: context,
                builder: (BuildContext context) {
                  return MultiSelectDialog<String>(
                    items: widget.items
                        .map((String item) => MultiSelectItem<String>(item, item))
                        .toList(),
                    initialValue: widget.selectedValues.toList(), // Convert Set to List
                  );
                },
              );

              if (selectedValues != null) {
                widget.onChanged(selectedValues);
              }
            },
            child: InputDecorator(
              decoration: InputDecoration(
                hintText: widget.textWidgetString,
                hintStyle: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(180, 180, 180, 1),
                    letterSpacing: 0,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromRGBO(180, 180, 180, 1)),
                  borderRadius: BorderRadius.circular(14),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.selectedValues.isNotEmpty
                          ? widget.selectedValues.join(", ")
                          : widget.textWidgetString!,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.almarai(
                        textStyle: TextStyle(
                          color: AppColors.primaryBackground,
                          letterSpacing: 0,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 24.h,
                    color: const Color.fromRGBO(180, 180, 180, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
