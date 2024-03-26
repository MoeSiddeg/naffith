import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/values/colors.dart';

class CheckboxListWithSearch extends StatefulWidget {
  final List<String> itemList;
  bool? isChecked = false;

  CheckboxListWithSearch({required this.itemList});

  @override
  _CheckboxListWithSearchState createState() => _CheckboxListWithSearchState();
}

class _CheckboxListWithSearchState extends State<CheckboxListWithSearch> {
  late List<String> filteredList;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    filteredList = widget.itemList;
    searchController = TextEditingController();
  }

  void filterList(String query) {
    setState(() {
      filteredList = widget.itemList
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.w , top: 10.h),
      width: 200.w,
      height: 220.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Column(children: [
          Container(
            width: 180.w,
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
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
              ),
              style: GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: AppColors.primarySecondaryBackground,
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
                    return RowCheckBox(isChecked: widget.isChecked!, itemsText: filteredList[index]);
                  }))
        ]),
      ),
    );
  }
  Widget RowCheckBox({required bool isChecked , required String itemsText })  {
    return  Row(
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
          activeColor:
          Color.fromRGBO(
              23, 56, 61, 1),
          value: isChecked,
          onChanged:(bool? value) {
    setState(() {
    widget.isChecked = value;
    });} ,
        ),
        Text(
          itemsText,
          style:
          GoogleFonts.almarai(
            textStyle: TextStyle(
              color: AppColors
                  .primaryBackground,
              letterSpacing: 0,
              fontSize: 10.sp,
              fontWeight:
              FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
