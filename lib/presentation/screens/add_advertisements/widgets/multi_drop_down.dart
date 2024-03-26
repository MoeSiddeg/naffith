import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:naffith/common/values/colors.dart';

class MultiDropdownFormField extends StatefulWidget {
  const MultiDropdownFormField({Key? key}) : super(key: key);

  @override
  State<MultiDropdownFormField> createState() => _MultiDropdownFormFieldState();
}

class _MultiDropdownFormFieldState extends State<MultiDropdownFormField> {
  final MultiSelectController<ValueItem> _controller = MultiSelectController<ValueItem>();

  final List<ValueItem> _selectedOptions = [];
  List<String> _selectedItems = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(right: 5.w, left: 10.w),
          child: Text(
            "التمويل",
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
        SizedBox(height: 5.h,),
        MultiSelectDropDown(
          borderWidth: 1,
          hint: 'التمويل',
          clearIcon: null,
          controller: _controller,
          onOptionSelected: (List<ValueItem> options) {
            setState(() {
              _selectedOptions.clear();
              _selectedOptions.addAll(options);
              _selectedItems = options.map((item) => item.label).toList();
              debugPrint(_selectedItems.toString()); // Print for debugging
            });
            debugPrint(_selectedOptions.toString());
          },
          options: const <ValueItem>[
            ValueItem(label: 'بنك', value: '1'),
            ValueItem(label: 'كاش', value: '2'),
          ],
          maxItems: 2,
          singleSelectItemStyle: GoogleFonts.almarai(
            textStyle: TextStyle(
              color: AppColors.primaryBackground,
              letterSpacing: 0,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          chipConfig:  ChipConfig(
              deleteIcon: null ,
              deleteIconColor: Colors.transparent,
              padding: EdgeInsets.only(right: 10.w),
              wrapType: WrapType.scroll, backgroundColor: AppColors.primaryBackground),
          optionTextStyle:  GoogleFonts.almarai(
            textStyle: TextStyle(
              color: AppColors.primaryBackground,
              letterSpacing: 0,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          dropdownMargin: 1,
          optionBuilder: (context, valueItem, isSelected) {
            return ListTile(
              title: Text(valueItem.label),
              trailing: isSelected
                  ? const Icon(Icons.check_circle)
                  : const Icon(Icons.radio_button_unchecked),
            );
          },
        )
        // SizedBox(height: 10), // Add some spacing between the dropdown and the selected options row
      ],
    );
  }
}
