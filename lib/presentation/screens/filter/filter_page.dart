import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/category/Cubit/category_cubit.dart';
import '../../../common/cities/logic/cities_cubit.dart';
import '../../../common/cities/logic/cities_states.dart';
import '../../../common/state_list/Cubit/state_cubit.dart';
import '../../../common/values/colors.dart';
import '../../../common/widgets/card_holder.dart';
import '../home_page/widget/interface_alet_without_title.dart';
import '../home_page/widget/reuseable_drop_down_without_title.dart';
import '../home_page/widget/reuseable_text_field_without_title.dart';
import '../home_page/widget/search_textfield.dart';
import 'data/models/filter_real_estate_respone.dart';
import 'logic/filter_cubit.dart';
import 'logic/filter_state.dart';
import 'widgets/filter_estate_card.dart';

class FilterPage extends StatefulWidget {
  FilterPage({super.key});

  @override
  State<FilterPage> createState() =>
      _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<FilterRealEstateResponse> filterRealEstatesByCategoryAndBuyGoalSearchQuery({
    required List<FilterRealEstateResponse> allRealEstates,
    required String searchQuery,
    required String categoryName,
  }) {
    return allRealEstates.where((realEstate) {
      // Filter by category name (assuming category name is stored in `category.name`)
      bool matchesCategory = realEstate.subType.toLowerCase() == categoryName.toLowerCase();

      // Check if the search query is not equal to the lowercase version of the subtype
      bool doesNotEqualSearchQuery = realEstate.subType.toLowerCase() != searchQuery.toLowerCase();

      // Check if the subtype contains the search query (partial match)
      bool containsSearchQuery = realEstate.subType.toLowerCase().contains(searchQuery.toLowerCase());

      // Return true only if it matches the category and contains the search query but does not equal the search query
      return matchesCategory && containsSearchQuery && doesNotEqualSearchQuery;
    }).toList();
  }



  // for check boxes
  bool? isLessPriceChecked = false;
  bool? isMorePriceChecked = false;
  bool? isLessAreaChecked = false;
  bool? isMoreAreaChecked = false;
  bool? isMarketPriceChecked = false;
  String? selectedValue;
  String? categoryValue;
  String? stateValue;
  String? selectedCity;
  List<String> tamoyl = [];
  // for check boxes
  final _postPriceStartController = TextEditingController();
  final _postPriceEndController = TextEditingController();
  String? _postPriceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء كتابة سعر البيع';
    }
    return null;
  }
  String? _postPriceEndValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء كتابة سعر البيع';
    }
    return null;
  }
  final _postPriceFocusNode = FocusNode();
  final _postPriceEndFocusNode = FocusNode();
  /// area
  final _areaStartController = TextEditingController();
  final _areaEndController = TextEditingController();

  final _areaFocusNode = FocusNode();
  final _areaEndFocusNode = FocusNode();
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
                      'تصفية العقارات',
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
                                  MediaQuery.of(context).size.height * 0.92,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:  BorderRadius.only(
                                      topLeft: Radius.circular(25.0),
                                      topRight: Radius.circular(25.0),
                                    ),
                                  ),
                                  child: Column(children: [
                                    // Header
                                    Container(
                                      padding: const EdgeInsets.all(16),
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
                                                  color:
                                                  AppColors.primaryBackground,
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
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 20.h),
                                          height: 30.h,
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
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          PropertyTypeDropdownWithOutTitle(
                                              selectedValue: stateValue,
                                              textWidgetString: 'المدينة',
                                              items: context.read<StateCubit>().stateNames,
                                              onChanged: (String? value) async {
                                                setStateSB(() {
                                                  stateValue = value;
                                                  selectedCity = null;
                                                  context.read<StateCubit>().getStateID(name: value);
                                                  context.read<CitiesCubit>().emitCitiesListStates(
                                                      context.read<StateCubit>().id.toString());
                                                });
                                              }),
                                          BlocBuilder<CitiesCubit, CitiesStates>(
                                            builder: (context, state) {
                                              return state.when(initial: () {
                                                return PropertyTypeDropdownWithOutTitle(
                                                    selectedValue: selectedCity,
                                                    textWidgetString: 'الحي',
                                                    items: const [],
                                                    onChanged: (String? value) {
                                                      setStateSB(() {
                                                        selectedCity = value;
                                                        context
                                                            .read<CitiesCubit>()
                                                            .getCityID(name: value);
                                                      });
                                                    });
                                              }, loading: () {
                                                return  Center(
                                                  child: Padding(
                                                    padding:  EdgeInsets.only(left : 30.w),
                                                    child: const CircularProgressIndicator(
                                                      color: AppColors.primaryBackground,
                                                    ),
                                                  ),
                                                );
                                              }, success: (cities) {
                                                return PropertyTypeDropdownWithOutTitle(
                                                    selectedValue: selectedCity,
                                                    textWidgetString: 'الحي',
                                                    items: context.read<CitiesCubit>().stateNames,
                                                    onChanged: (String? value) {
                                                      setStateSB(() {
                                                        selectedCity = value;
                                                        context
                                                            .read<CitiesCubit>()
                                                            .getCityID(name: value);
                                                      });
                                                    });
                                              }, error: (error) {
                                                return const Center(
                                                  child: CircularProgressIndicator(
                                                    color: AppColors.primaryBackground,
                                                  ),
                                                );
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.only(right: 5.w),
                                            child: InterfaceListAlertDialogWithoutTilte(
                                              stringList: ['بنك', "كاش",],
                                              title: 'التمويل',
                                              selectedItems: tamoyl,
                                            ),
                                          ),
                                          PropertyTypeDropdownWithOutTitle(
                                              selectedValue: categoryValue,
                                              textWidgetString: 'نوع العقار',
                                              items: context.read<CategoryCubit>().names,
                                              onChanged: (String? value) {
                                                setStateSB(() {
                                                  categoryValue = value;
                                                  context
                                                      .read<CategoryCubit>()
                                                      .getCategoryID(name: value);
                                                });
                                              }),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 20.h),
                                          height: 30.h,
                                          width: 309.w,
                                          child: Text(
                                            'السعر',
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
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ReusableFormFieldWithOutTitle(
                                          labelText: 'السعر',
                                          hintText: 'من',
                                          controller: _postPriceStartController,
                                          focusNode: _postPriceFocusNode,
                                          validator: (value) => _postPriceValidator(value),
                                          keyboardType: TextInputType.number,
                                        ),
                                        ReusableFormFieldWithOutTitle(
                                          labelText: 'السعر',
                                          hintText: 'الى',
                                          controller: _postPriceEndController,
                                          focusNode: _postPriceEndFocusNode,
                                          validator: (value) => _postPriceEndValidator(value),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 20.h),
                                          height: 30.h,
                                          width: 309.w,
                                          child: Text(
                                            'المساحة',
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
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ReusableFormFieldWithOutTitle(
                                          labelText: 'المساحة',
                                          hintText: 'من',
                                          controller: _areaStartController,
                                          focusNode: _areaFocusNode,
                                          validator: (value) => _postPriceValidator(value),
                                          keyboardType: TextInputType.number,
                                        ),
                                        ReusableFormFieldWithOutTitle(
                                          labelText: 'المساعة',
                                          hintText: 'الى',
                                          controller: _areaEndController,
                                          focusNode: _areaEndFocusNode,
                                          validator: (value) => _postPriceEndValidator(value),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 260.h,
                                          width: 200.w,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 0),
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
                                                      value: isLessPriceChecked,
                                                      onChanged:
                                                          (bool? value) {
                                                        setStateSB(() {
                                                          isLessPriceChecked = value;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      'السعر من أقل الى أكثر',
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
                                                      value: isMorePriceChecked,
                                                      onChanged:
                                                          (bool? value) {
                                                        setStateSB(() {
                                                          isMorePriceChecked = value;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      'السعر من أكثر الى اقل',
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
                                                      value: isLessAreaChecked,
                                                      onChanged:
                                                          (bool? value) {
                                                        setStateSB(() {
                                                          isLessAreaChecked = value;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      ' المساحة من أقل الى أكثر',
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
                                                      value: isMoreAreaChecked,
                                                      onChanged:
                                                          (bool? value) {
                                                        setStateSB(() {
                                                          isMoreAreaChecked = value;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      'المساحة من أكثر الى اقل',
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
                                                      value: isMarketPriceChecked,
                                                      onChanged:
                                                          (bool? value) {
                                                        setStateSB(() {
                                                          isMarketPriceChecked = value;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      'سعر السوق',
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
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        context.read<EstateFilterCubit>().emitAllEstatesFilterStates(
                                          // goal: '',
                                          priceFrom: int.tryParse(_postPriceStartController.text),
                                          priceTo: int.tryParse(_postPriceEndController.text),
                                          stateId: context
                                              .read<StateCubit>().id != 0 ? context
                                              .read<StateCubit>().id : null,
                                          cityId: context
                                              .read<CitiesCubit>().id != 0 ? context
                                              .read<CitiesCubit>().id: null,
                                          areaFrom: int.tryParse(_areaStartController.text),
                                          areaTo: int.tryParse(_areaEndController.text),
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 20.h, left: 25.w, right: 25.w),
                                        width: 239.w,
                                        height: 52.h,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(23, 56, 61, 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.w)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                  spreadRadius: 1,
                                                  blurRadius: 2,
                                                  offset: const Offset(0, 1))
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
            BlocBuilder<EstateFilterCubit, EstateFilterState>(
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
                }, success: (List<FilterRealEstateResponse> allRealEstatesResponseBody) {
                  if(allRealEstatesResponseBody.isEmpty){
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
                        itemCount: allRealEstatesResponseBody.length,
                        //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                        itemBuilder: (context, index) {
                          return  FilterCard(
                            allRealEstatesResponseBody: allRealEstatesResponseBody,
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
