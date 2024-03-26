import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/home_page/logic/all_real_estate/all_real_estates_list_cubit.dart';
import 'package:naffith/presentation/screens/home_page/logic/all_real_estate/all_real_estates_list_states.dart';

import '../../../common/category/Cubit/category_cubit.dart';
import '../../../common/values/colors.dart';
import '../../../common/widgets/card_holder.dart';
import '../home_page/data/models/all_real_estates_response_body.dart';
import '../home_page/logic/all_real_estates_cubit.dart';
import '../home_page/logic/all_real_estates_states.dart';
import '../home_page/widget/advertisements_view.dart';
import '../home_page/widget/checkbox_search_list.dart';
import '../home_page/widget/search_textfield.dart';

class ShowAllAdvertisementsPage extends StatefulWidget {
  ShowAllAdvertisementsPage({super.key});

  @override
  State<ShowAllAdvertisementsPage> createState() =>
      _ShowAllAdvertisementsPageState();
}

class _ShowAllAdvertisementsPageState extends State<ShowAllAdvertisementsPage> {
  List<Data> filterRealEstatesByCategoryAndBuyGoalSearchQuery({
    required List<Data> allRealEstates,
    required String searchQuery,
    required String categoryName, // Pass category name instead of ID
  }) {
    return allRealEstates.where((realEstate) {
      // Filter by category name (assuming category name is stored in `category.name`)
      return realEstate.subType!.toLowerCase() == categoryName.toLowerCase() &&
          (realEstate.subType!.toLowerCase().contains(searchQuery.toLowerCase()));
    }).toList();
  }
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

  String? selectedValue;

  // for check boxes
  bool? isChecked = true;
  final TextEditingController _textSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(children: [
            Container(
              padding: EdgeInsets.only(top: 35.h),
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
                    margin: EdgeInsets.only(right: 80.w, left: 70.h),
                    child: Text(
                      'جميع العقارات',
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: ReusableFormField(
                    hintText: 'البحث',
                    controller: _textSearchController,
                  ),
                ),
                SizedBox(
                  width: 20.h,
                ),
                SizedBox(
                  height: 32.h,
                  width: 20.h,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => StatefulBuilder(
                              builder: (context, setStateSB) => Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(25.0),
                                      topRight: const Radius.circular(25.0),
                                    ),
                                  ),
                                  child: Column(children: [
                                    // Header
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100.h,
                                          ),
                                          Center(
                                            child: Text(
                                              'تصنيف العقار',
                                              style: GoogleFonts.almarai(
                                                textStyle: TextStyle(
                                                  color: AppColors
                                                      .primaryBackground,
                                                  letterSpacing: 0,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 92.9.h,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 30.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 20.h),
                                          height: 26.h,
                                          width: 309.w,
                                          child: Text(
                                            'المنطقة و الحي',
                                            style: GoogleFonts.almarai(
                                              textStyle: TextStyle(
                                                color:
                                                    AppColors.primaryBackground,
                                                letterSpacing: 0,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 20.h, left: 20.h, top: 20.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton2<String>(
                                              isExpanded: true,
                                              hint: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'الرياض',
                                                      style:
                                                          GoogleFonts.almarai(
                                                        textStyle: TextStyle(
                                                          color: Color.fromRGBO(
                                                              180, 180, 180, 1),
                                                          letterSpacing: 0,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              items: items
                                                  .map((String item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle:
                                                                TextStyle(
                                                              color: AppColors
                                                                  .primaryBackground,
                                                              letterSpacing: 0,
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ))
                                                  .toList(),
                                              value: selectedValue,
                                              onChanged: (String? value) {
                                                setStateSB(() {
                                                  selectedValue = value;
                                                });
                                              },
                                              buttonStyleData: ButtonStyleData(
                                                height: 50,
                                                width: 160,
                                                padding: const EdgeInsets.only(
                                                    left: 14, right: 14),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    border: Border.all(
                                                      color: Color.fromRGBO(
                                                          180, 180, 180, 1),
                                                    ),
                                                    color: Colors.white),
                                                elevation: 2,
                                              ),
                                              iconStyleData: IconStyleData(
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                ),
                                                iconSize: 24.h,
                                                iconEnabledColor:
                                                    Color.fromRGBO(
                                                        180, 180, 180, 1),
                                                iconDisabledColor:
                                                    Color.fromRGBO(
                                                        180, 180, 180, 1),
                                              ),
                                              dropdownStyleData:
                                                  DropdownStyleData(
                                                maxHeight: 200,
                                                width: 300,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  color: Colors.white,
                                                ),
                                                offset: Offset(-20, 0),
                                                scrollbarTheme:
                                                    ScrollbarThemeData(
                                                  radius: Radius.circular(40),
                                                  thickness:
                                                      MaterialStateProperty.all<
                                                          double>(6),
                                                  thumbVisibility:
                                                      MaterialStateProperty.all<
                                                          bool>(true),
                                                ),
                                              ),
                                              menuItemStyleData:
                                                  MenuItemStyleData(
                                                height: 40.h,
                                                padding: EdgeInsets.only(
                                                    left: 14.h, right: 14.h),
                                              ),
                                            ),
                                          ),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton2<String>(
                                              isExpanded: true,
                                              hint: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'الحي',
                                                      style:
                                                          GoogleFonts.almarai(
                                                        textStyle: TextStyle(
                                                          color: Color.fromRGBO(
                                                              180, 180, 180, 1),
                                                          letterSpacing: 0,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              items: items
                                                  .map((String item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle:
                                                                TextStyle(
                                                              color: AppColors
                                                                  .primaryBackground,
                                                              letterSpacing: 0,
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ))
                                                  .toList(),
                                              value: selectedValue,
                                              onChanged: (String? value) {
                                                setStateSB(() {
                                                  selectedValue = value;
                                                });
                                              },
                                              buttonStyleData: ButtonStyleData(
                                                height: 50,
                                                width: 160,
                                                padding: const EdgeInsets.only(
                                                    left: 14, right: 14),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    border: Border.all(
                                                      color: Color.fromRGBO(
                                                          180, 180, 180, 1),
                                                    ),
                                                    color: Colors.white),
                                                elevation: 2,
                                              ),
                                              iconStyleData: IconStyleData(
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                ),
                                                iconSize: 24.h,
                                                iconEnabledColor:
                                                    Color.fromRGBO(
                                                        180, 180, 180, 1),
                                                iconDisabledColor:
                                                    Color.fromRGBO(
                                                        180, 180, 180, 1),
                                              ),
                                              dropdownStyleData:
                                                  DropdownStyleData(
                                                maxHeight: 200,
                                                width: 300,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  color: Colors.white,
                                                ),
                                                offset: Offset(-20, 0),
                                                scrollbarTheme:
                                                    ScrollbarThemeData(
                                                  radius: Radius.circular(40),
                                                  thickness:
                                                      MaterialStateProperty.all<
                                                          double>(6),
                                                  thumbVisibility:
                                                      MaterialStateProperty.all<
                                                          bool>(true),
                                                ),
                                              ),
                                              menuItemStyleData:
                                                  MenuItemStyleData(
                                                height: 40.h,
                                                padding: EdgeInsets.only(
                                                    left: 14.h, right: 14.h),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 5.h),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 220.h,
                                              width: 168.w,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 15.h),
                                                        child: Text(
                                                          'تصنيف',
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle:
                                                                TextStyle(
                                                              color: AppColors
                                                                  .primaryBackground,
                                                              letterSpacing: 0,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                                                        activeColor:
                                                            Color.fromRGBO(
                                                                23, 56, 61, 1),
                                                        value: isChecked,
                                                        onChanged:
                                                            (bool? value) {
                                                          setStateSB(() {
                                                            isChecked = value;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'الأقل',
                                                        style:
                                                            GoogleFonts.almarai(
                                                          textStyle: TextStyle(
                                                            color: AppColors
                                                                .primaryBackground,
                                                            letterSpacing: 0,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                                                        activeColor:
                                                            Color.fromRGBO(
                                                                23, 56, 61, 1),
                                                        value: isChecked,
                                                        onChanged:
                                                            (bool? value) {
                                                          setStateSB(() {
                                                            isChecked = value;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'الأعلى سعر',
                                                        style:
                                                            GoogleFonts.almarai(
                                                          textStyle: TextStyle(
                                                            color: AppColors
                                                                .primaryBackground,
                                                            letterSpacing: 0,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                                                        activeColor:
                                                            Color.fromRGBO(
                                                                23, 56, 61, 1),
                                                        value: isChecked,
                                                        onChanged:
                                                            (bool? value) {
                                                          setStateSB(() {
                                                            isChecked = value;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'الأصغر مساحة',
                                                        style:
                                                            GoogleFonts.almarai(
                                                          textStyle: TextStyle(
                                                            color: AppColors
                                                                .primaryBackground,
                                                            letterSpacing: 0,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                                                        activeColor:
                                                            Color.fromRGBO(
                                                                23, 56, 61, 1),
                                                        value: isChecked,
                                                        onChanged:
                                                            (bool? value) {
                                                          setStateSB(() {
                                                            isChecked = value;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'الأكبر مساحة',
                                                        style:
                                                            GoogleFonts.almarai(
                                                          textStyle: TextStyle(
                                                            color: AppColors
                                                                .primaryBackground,
                                                            letterSpacing: 0,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            CheckboxListWithSearch(
                                              itemList: items,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 100.h,
                                            left: 25.w,
                                            right: 25.w),
                                        width: 239.w,
                                        height: 52.h,
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(23, 56, 61, 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.w)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                  spreadRadius: 1,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 1))
                                            ]),
                                        child: Center(
                                          child: Text(
                                            'تطبيق التصفية',
                                            style: GoogleFonts.almarai(
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 0,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]))));
                    },
                    child: Image.asset(
                      'assets/icons/filterIcon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            BlocBuilder<AllRealEstatesListCubit, AllRealEstateListStates>(
              builder: (context, state) {
                return state.when(initial: () {
                  return Padding(
                    padding: EdgeInsets.only(top: 55.h),
                    child: SizedBox(
                      height: 812.h * 0.715,
                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 10.h),
                          itemCount: 2,
                          //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                          itemBuilder: (context, index) {
                            return const AdvertisementCardPlaceholder();
                          }),
                    ),
                  );
                }, loading: () {
                  return Padding(
                    padding: EdgeInsets.only(top: 55.h),
                    child: SizedBox(
                      height: 812.h * 0.715,
                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 10.h),
                          itemCount: 2,
                          //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                          itemBuilder: (context, index) {
                            return const AdvertisementCardPlaceholder();
                          }),
                    ),
                  );
                }, success: (AllRealEstatesResponseBody allRealEstatesResponseBody) {
                  if(allRealEstatesResponseBody.data!.isEmpty){
                    return Padding(
                      padding:  EdgeInsets.only(top: 200.h),
                      child: Center(
                        child: Text(
                          'لا توجد عقارات',
                          style: GoogleFonts.almarai(
                              textStyle: TextStyle(
                                color: AppColors.primaryBackground,
                                letterSpacing: 0,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 812.h * 0.80,
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 10.h),
                        itemCount: allRealEstatesResponseBody.data!.length,
                        //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                        itemBuilder: (context, index) {
                          return  AdvertisementCard(
                            allRealEstatesResponseBody: allRealEstatesResponseBody.data!,
                            index: index,
                          );
                        },
                      ),
                    );
                  }
                }, error: (error) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 350.h,
                        ),
                        Text(
                          'حدث خطأ ما ',
                          style: GoogleFonts.almarai(
                              textStyle: TextStyle(
                            color: AppColors.primaryBackground,
                            letterSpacing: 0,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<AllRealEstatesCubit>()
                                .emitAllRealEstateStates();
                          },
                          child: Container(
                            width: 239.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(23, 56, 61, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.w)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(0, 1))
                                ]),
                            child: Center(
                              child: Text(
                                'حاول مرة اخرى',
                                style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 0,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
              },
            ),
          ]),
        ],
      ),
    );
  }
}
