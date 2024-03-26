import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/users_data/Cubit/get_users_cubit.dart';

import '../../../../common/values/colors.dart';

class CheckboxListWithSearch extends StatefulWidget {
  final List<String> usersNames;
  final ValueChanged<String>? onItemSelected;

  CheckboxListWithSearch({required this.usersNames, required this.onItemSelected});

  @override
  _CheckboxListWithSearchState createState() => _CheckboxListWithSearchState();
}

class _CheckboxListWithSearchState extends State<CheckboxListWithSearch> {
  String? selectedItem;
  late List<String> filteredList;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    filteredList = widget.usersNames;
    searchController = TextEditingController();
  }

  void filterList(String query) {
    setState(() {
      filteredList = widget.usersNames
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.w, top: 10.h),
      width: 320.w,
      height: 220.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(color: const Color.fromRGBO(243, 244, 246, 1), width: 1.0),
      ),
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Column(children: [
          Container(
            width: 310.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              color: Color.fromRGBO(23, 56, 61, 0.1),
            ),
            child: TextField(
              controller: searchController,
              onChanged: filterList,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  size: 22.sp,
                ),
                labelStyle: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(23, 56, 61, 0.5),
                    letterSpacing: 0,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                hintText: 'البحث',
                hintStyle: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(23, 56, 61, 0.5),
                    letterSpacing: 0,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0x00000000),
                    width: 2.sp,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsetsDirectional.fromSTEB(20.w, 20.h, 0, 12.h),
              ),
              style: GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: AppColors.primaryText,
                  letterSpacing: 0,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final item = filteredList[index];
                return RowCheckBox(
                  isChecked: selectedItem == item,
                  itemsText: item,
    onTap: () {
      setState(() {
        if (selectedItem == item) {
          selectedItem = null;
        } else {
          selectedItem = item;
          widget.onItemSelected?.call(item);
          if (widget.usersNames.contains(selectedItem)) {
            context.read<GetUsersCubit>().getUserID(name: selectedItem!);
          } else {
            print('Selected item not found in the list');
          }
        }
      });
    }
    );
              },
            ),
          ),
        ]),
      ),
    );
  }

  Widget RowCheckBox({required bool isChecked, required String itemsText, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: Color.fromRGBO(23, 56, 61, 1),
            value: isChecked,
            onChanged: (_) {
              onTap();
            },
          ),
          Text(
            itemsText,
            style: GoogleFonts.almarai(
              textStyle: TextStyle(
                color: AppColors.primaryBackground,
                letterSpacing: 0,
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

