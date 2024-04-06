import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/values/colors.dart';
import 'package:naffith/presentation/screens/filter/filter_page.dart';
import 'package:naffith/presentation/screens/filter/logic/filter_cubit.dart';
import 'package:naffith/presentation/screens/home_page/data/models/all_real_estates_response_body.dart';
import 'package:naffith/presentation/screens/home_page/logic/all_real_estate/all_real_estates_list_cubit.dart';
import 'package:naffith/presentation/screens/home_page/logic/all_real_estates_cubit.dart';
import 'package:naffith/presentation/screens/home_page/logic/all_real_estates_states.dart';
import 'package:naffith/presentation/screens/home_page/widget/advertisements_view.dart';
import 'package:naffith/presentation/screens/home_page/widget/interface_alet_without_title.dart';
import 'package:naffith/presentation/screens/home_page/widget/reuseable_text_field_without_title.dart';
import 'package:naffith/presentation/screens/home_page/widget/search_textfield.dart';
import '../../../common/category/Cubit/category_cubit.dart';
import '../../../common/cities/logic/cities_cubit.dart';
import '../../../common/cities/logic/cities_states.dart';
import '../../../common/state_list/Cubit/state_cubit.dart';
import '../../../common/values/constants_design.dart';
import '../../../common/widgets/card_holder.dart';
import '../../../common/widgets/login_alert.dart';
import '../../../global.dart';
import '../add_advertisements/widgets/inter_face_dialog.dart';
import '../add_advertisements/widgets/reusable_dropdown_with_text.dart';
import '../filter/widgets/filter_bloc_listener.dart';
import '../profile/profile_page.dart';
import 'logic/buy/all_real_estates_buy_cubit.dart';
import 'logic/buy/all_real_estates_buy_states.dart';
import 'widget/checkbox_search_list.dart';
import 'widget/reuseable_drop_down_without_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  //late  String? Function(String?)? validator;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Function to filter real estates by category name and search query

  List<Data> filterRealEstatesBySearchQuery({
    required List<Data> allRealEstates,
    required String searchQuery,
  }) {
    return allRealEstates.where((realEstate) {
      // Filter by search query (assuming the search query should match the sub_type or any other relevant field)
      return realEstate.subType!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          realEstate.state!.name!
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
      // You can add more conditions here for other fields if needed
    }).toList();
  }

  // for dropdown list

  String? selectedValue;

  // for check boxes
  bool? isLessPriceChecked = false;
  bool? isMorePriceChecked = false;
  bool? isLessAreaChecked = false;
  bool? isMoreAreaChecked = false;
  bool? isMarketPriceChecked = false;

  // for serch text field
  final TextEditingController _textSearchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  // List<String> _filteredSearchHistory = [];
  // bool _isSuggestionsVisible = false;
  bool tabTrigger = true;

  @override
  void initState() {
    super.initState();
    // _filteredSearchHistory = widget.searchHistory;
    _focusNode.addListener(() {
      setState(() {
        //_isSuggestionsVisible = _focusNode.hasFocus;
      });
    });
    context.read<AllRealEstatesCubit>().emitAllRealEstateStates();
    context.read<CategoryCubit>().emitCategoryStates();
    context.read<StateCubit>().emitCategoryStates();
    context.read<AllRealEstatesBuyCubit>().emitAllRealEstateBuyStates();
    context.read<AllRealEstatesListCubit>().emitAllRealEstateListStates();
    // context.read<EstateFilterCubit>().emitAllEstatesFilterStates();
  }

  // void _onSearchTextChanged(String text) {
  //   if (text.isEmpty) {
  //     setState(() {
  //       //  _filteredSearchHistory = widget.searchHistory;
  //     });
  //   } else {
  //     setState(() {
  //       //   _filteredSearchHistory = widget.searchHistory
  //       //     .where((history) => history.toLowerCase().contains(text.toLowerCase()))
  //       //       .toList();
  //     });
  //   }
  //   //widget.onSearch(text);
  // }
  //
  // void _onClearButtonPressed() {
  //   _textSearchController.clear();
  //   _focusNode.unfocus();
  //   setState(() {
  //     // _filteredSearchHistory = widget.searchHistory;
  //    // _isSuggestionsVisible = false;
  //   });
  //   //  widget.onClear();
  // }
  //
  // String? _validateText(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return "Search term cannot be empty.";
  //   } else if (value.length < 3) {
  //     return "Search term must be at least 3 characters long.";
  //   }
  //   return null;
  // }
  String? categoryValue;
  String? stateValue;
  String? selectedCity;
  List<String> tamoyl = [];

  /// price
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

  String? _areaValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء كتابة سعر البيع';
    }
    return null;
  }

  String? _areaEndValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء كتابة سعر البيع';
    }
    return null;
  }

  final _areaFocusNode = FocusNode();
  final _areaEndFocusNode = FocusNode();
  ElectricMeter? _electricMeter;
  WaterMeter? _waterMeter;
  RealGoal? _realGoal;
  String? _electricMeterValue;
  String? _goalValue;
  String? _goalView;
  String? _waterMeterValue;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(padding: EdgeInsets.only(top: 8.h)),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0.h),
                    child: GestureDetector(
                      onTap: () {
                        if (Global.storageService.getIsLoggedIn()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const LoginAlertDialog();
                              });
                        }
                      },
                      child: SizedBox(
                        height: 34.h,
                        width: 34.h,
                        child: Icon(Icons.account_circle_outlined,
                            color: AppColors.primaryBackground, size: 34.sp),
                      ),
                    ),
                  ),
                  Text(
                    Global.storageService.getUserName(),
                    style: GoogleFonts.almarai(
                        textStyle: TextStyle(
                      color: AppColors.primaryBackground,
                      letterSpacing: 0,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: ReusableFormField(
                      hintText: 'البحث',
                      controller: _textSearchController,
                      onChanged: (value) {
                        setState(() {});
                      },
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
                                    height: MediaQuery.of(context).size.height *
                                        0.95,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
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
                                        // Ensures minimum required height
                                        //  mainAxisSpacing: 4,
                                        children: [
                                          Flexible(
                                            child: RadioListTile<RealGoal>(
                                                title: Text(
                                                  'عرض',
                                                  style: GoogleFonts.almarai(
                                                    textStyle: TextStyle(
                                                      color: AppColors
                                                          .primaryBackground,
                                                      letterSpacing: 0,
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                activeColor:
                                                    AppColors.primaryBackground,
                                                fillColor: MaterialStateProperty
                                                    .all<Color>(AppColors
                                                        .primaryBackground),
                                                value: RealGoal.sell,
                                                groupValue: _realGoal,
                                                onChanged: (val) {
                                                  setStateSB(() {
                                                    _realGoal = val;
                                                    _goalValue = 'sale';
                                                    _goalView = "بيع";
                                                  });
                                                }),
                                          ),
                                          Flexible(
                                            child: RadioListTile<RealGoal>(
                                                title: Text(
                                                  'طلب',
                                                  style: GoogleFonts.almarai(
                                                    textStyle: TextStyle(
                                                      color: AppColors
                                                          .primaryBackground,
                                                      letterSpacing: 0,
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                activeColor:
                                                    AppColors.primaryBackground,
                                                fillColor: MaterialStateProperty
                                                    .all<Color>(AppColors
                                                        .primaryBackground),
                                                value: RealGoal.buy,
                                                groupValue: _realGoal,
                                                onChanged: (val) {
                                                  setStateSB(() {
                                                    _realGoal = val;
                                                    _goalValue = 'buy';
                                                    _goalView = "شراء";
                                                  });
                                                }),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding:
                                                EdgeInsets.only(right: 20.h),
                                            height: 30.h,
                                            width: 309.w,
                                            child: Text(
                                              'المنطقة و الحي',
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
                                          )
                                        ],
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            PropertyTypeDropdownWithOutTitle(
                                                selectedValue: stateValue,
                                                textWidgetString: 'المدينة',
                                                items: context
                                                    .read<StateCubit>()
                                                    .stateNames,
                                                onChanged:
                                                    (String? value) async {
                                                  setStateSB(() {
                                                    stateValue = value;
                                                    selectedCity = null;
                                                    context
                                                        .read<StateCubit>()
                                                        .getStateID(
                                                            name: value);
                                                    context
                                                        .read<CitiesCubit>()
                                                        .emitCitiesListStates(
                                                            context
                                                                .read<
                                                                    StateCubit>()
                                                                .id
                                                                .toString());
                                                  });
                                                }),
                                            BlocBuilder<CitiesCubit,
                                                CitiesStates>(
                                              builder: (context, state) {
                                                return state.when(initial: () {
                                                  return PropertyTypeDropdownWithOutTitle(
                                                      selectedValue:
                                                          selectedCity,
                                                      textWidgetString: 'الحي',
                                                      items: const [],
                                                      onChanged:
                                                          (String? value) {
                                                        setStateSB(() {
                                                          selectedCity = value;
                                                          context
                                                              .read<
                                                                  CitiesCubit>()
                                                              .getCityID(
                                                                  name: value);
                                                        });
                                                      });
                                                }, loading: () {
                                                  return Center(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 30.w),
                                                      child:
                                                          const CircularProgressIndicator(
                                                        color: AppColors
                                                            .primaryBackground,
                                                      ),
                                                    ),
                                                  );
                                                }, success: (cities) {
                                                  return PropertyTypeDropdownWithOutTitle(
                                                      selectedValue:
                                                          selectedCity,
                                                      textWidgetString: 'الحي',
                                                      items: context
                                                          .read<CitiesCubit>()
                                                          .stateNames,
                                                      onChanged:
                                                          (String? value) {
                                                        setStateSB(() {
                                                          selectedCity = value;
                                                          context
                                                              .read<
                                                                  CitiesCubit>()
                                                              .getCityID(
                                                                  name: value);
                                                        });
                                                      });
                                                }, error: (error) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: AppColors
                                                          .primaryBackground,
                                                    ),
                                                  );
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5.w),
                                              child:
                                                  InterfaceListAlertDialogWithoutTilte(
                                                stringList: [
                                                  'بنك',
                                                  "كاش",
                                                ],
                                                title: 'التمويل',
                                                selectedItems: tamoyl,
                                              ),
                                            ),
                                            PropertyTypeDropdownWithOutTitle(
                                                selectedValue: categoryValue,
                                                textWidgetString: 'نوع العقار',
                                                items: context
                                                    .read<CategoryCubit>()
                                                    .names,
                                                onChanged: (String? value) {
                                                  setStateSB(() {
                                                    categoryValue = value;
                                                    context
                                                        .read<CategoryCubit>()
                                                        .getCategoryID(
                                                            name: value);
                                                  });
                                                }),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding:
                                                EdgeInsets.only(right: 20.h),
                                            height: 30.h,
                                            width: 309.w,
                                            child: Text(
                                              'السعر',
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
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ReusableFormFieldWithOutTitle(
                                            labelText: 'السعر',
                                            hintText: 'من',
                                            controller:
                                                _postPriceStartController,
                                            focusNode: _postPriceFocusNode,
                                            validator: (value) =>
                                                _postPriceValidator(value),
                                            keyboardType: TextInputType.number,
                                          ),
                                          ReusableFormFieldWithOutTitle(
                                            labelText: 'السعر',
                                            hintText: 'الى',
                                            controller: _postPriceEndController,
                                            focusNode: _postPriceEndFocusNode,
                                            validator: (value) =>
                                                _postPriceEndValidator(value),
                                            keyboardType: TextInputType.number,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding:
                                                EdgeInsets.only(right: 20.h),
                                            height: 30.h,
                                            width: 309.w,
                                            child: Text(
                                              'المساحة',
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
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ReusableFormFieldWithOutTitle(
                                            labelText: 'المساحة',
                                            hintText: 'من',
                                            controller: _areaStartController,
                                            focusNode: _areaFocusNode,
                                            validator: (value) =>
                                                _postPriceValidator(value),
                                            keyboardType: TextInputType.number,
                                          ),
                                          ReusableFormFieldWithOutTitle(
                                            labelText: 'المساعة',
                                            hintText: 'الى',
                                            controller: _areaEndController,
                                            focusNode: _areaEndFocusNode,
                                            validator: (value) =>
                                                _postPriceEndValidator(value),
                                            keyboardType: TextInputType.number,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 260.h,
                                            width: 300.w,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0),
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
                                                  // Row(
                                                  //   children: [
                                                  //     Checkbox(
                                                  //       //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                                                  //       activeColor:
                                                  //       Color.fromRGBO(
                                                  //           23, 56, 61, 1),
                                                  //       value: isLessPriceChecked,
                                                  //       onChanged:
                                                  //           (bool? value) {
                                                  //         setStateSB(() {
                                                  //           isLessPriceChecked = value;
                                                  //         });
                                                  //       },
                                                  //     ),
                                                  //     Text(
                                                  //       'السعر من أقل الى أكثر',
                                                  //       style:
                                                  //       GoogleFonts.almarai(
                                                  //         textStyle: TextStyle(
                                                  //           color: AppColors
                                                  //               .primaryBackground,
                                                  //           letterSpacing: 0,
                                                  //           fontSize: 13.sp,
                                                  //           fontWeight:
                                                  //           FontWeight.w700,
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  // Row(
                                                  //   children: [
                                                  //     Checkbox(
                                                  //       //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                                                  //       activeColor:
                                                  //       Color.fromRGBO(
                                                  //           23, 56, 61, 1),
                                                  //       value: isMorePriceChecked,
                                                  //       onChanged:
                                                  //           (bool? value) {
                                                  //         setStateSB(() {
                                                  //           isMorePriceChecked = value;
                                                  //         });
                                                  //       },
                                                  //     ),
                                                  //     Text(
                                                  //       'السعر من أكثر الى اقل',
                                                  //       style:
                                                  //       GoogleFonts.almarai(
                                                  //         textStyle: TextStyle(
                                                  //           color: AppColors
                                                  //               .primaryBackground,
                                                  //           letterSpacing: 0,
                                                  //           fontSize: 13.sp,
                                                  //           fontWeight:
                                                  //           FontWeight.w700,
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  Flexible(
                                                    child: RadioListTile<
                                                            ElectricMeter>(
                                                        title: Text(
                                                          'السعر من أقل الى أكثر',
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle:
                                                                TextStyle(
                                                              color: AppColors
                                                                  .primaryBackground,
                                                              letterSpacing: 0,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        activeColor: AppColors
                                                            .primaryBackground,
                                                        fillColor: MaterialStateProperty
                                                            .all<Color>(AppColors
                                                                .primaryBackground),
                                                        value: ElectricMeter.no,
                                                        groupValue:
                                                            _electricMeter,
                                                        onChanged: (val) {
                                                          setStateSB(() {
                                                            _electricMeter =
                                                                val;
                                                            _electricMeterValue =
                                                                'ASC';
                                                          });
                                                        }),
                                                  ),
                                                  Flexible(
                                                    child: RadioListTile<
                                                            ElectricMeter>(
                                                        title: Text(
                                                          'السعر من أكثر الى أقل',
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle:
                                                                TextStyle(
                                                              color: AppColors
                                                                  .primaryBackground,
                                                              letterSpacing: 0,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        activeColor: AppColors
                                                            .primaryBackground,
                                                        fillColor: MaterialStateProperty
                                                            .all<Color>(AppColors
                                                                .primaryBackground),
                                                        value:
                                                            ElectricMeter.yes,
                                                        groupValue:
                                                            _electricMeter,
                                                        onChanged: (val) {
                                                          setStateSB(() {
                                                            _electricMeter =
                                                                val;
                                                            _electricMeterValue =
                                                                'DESC';
                                                          });
                                                        }),
                                                  ),
                                                  // Row(
                                                  //   children: [
                                                  //     Checkbox(
                                                  //       //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                                                  //       activeColor:
                                                  //       Color.fromRGBO(
                                                  //           23, 56, 61, 1),
                                                  //       value: isLessAreaChecked,
                                                  //       onChanged:
                                                  //           (bool? value) {
                                                  //         setStateSB(() {
                                                  //           isLessAreaChecked = value;
                                                  //         });
                                                  //       },
                                                  //     ),
                                                  //     Text(
                                                  //       ' المساحة من أقل الى أكثر',
                                                  //       style:
                                                  //       GoogleFonts.almarai(
                                                  //         textStyle: TextStyle(
                                                  //           color: AppColors
                                                  //               .primaryBackground,
                                                  //           letterSpacing: 0,
                                                  //           fontSize: 13.sp,
                                                  //           fontWeight:
                                                  //           FontWeight.w700,
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  // Row(
                                                  //   children: [
                                                  //     Checkbox(
                                                  //       //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                                                  //       activeColor:
                                                  //       Color.fromRGBO(
                                                  //           23, 56, 61, 1),
                                                  //       value: isMoreAreaChecked,
                                                  //       onChanged:
                                                  //           (bool? value) {
                                                  //         setStateSB(() {
                                                  //           isMoreAreaChecked = value;
                                                  //         });
                                                  //       },
                                                  //     ),
                                                  //     Text(
                                                  //       'المساحة من أكثر الى اقل',
                                                  //       style:
                                                  //       GoogleFonts.almarai(
                                                  //         textStyle: TextStyle(
                                                  //           color: AppColors
                                                  //               .primaryBackground,
                                                  //           letterSpacing: 0,
                                                  //           fontSize: 13.sp,
                                                  //           fontWeight:
                                                  //           FontWeight.w700,
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  Flexible(
                                                    child: RadioListTile<
                                                            WaterMeter>(
                                                        title: Text(
                                                          'المساحة من أقل الى أكثر',
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle:
                                                                TextStyle(
                                                              color: AppColors
                                                                  .primaryBackground,
                                                              letterSpacing: 0,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        activeColor: AppColors
                                                            .primaryBackground,
                                                        fillColor: MaterialStateProperty
                                                            .all<Color>(AppColors
                                                                .primaryBackground),
                                                        value: WaterMeter.no,
                                                        groupValue: _waterMeter,
                                                        onChanged: (val) {
                                                          setStateSB(() {
                                                            _waterMeter = val;
                                                            _waterMeterValue =
                                                                'ASC';
                                                          });
                                                        }),
                                                  ),
                                                  Flexible(
                                                    child: RadioListTile<
                                                            WaterMeter>(
                                                        title: Text(
                                                          'المساحة من أكثر الى أقل',
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle:
                                                                TextStyle(
                                                              color: AppColors
                                                                  .primaryBackground,
                                                              letterSpacing: 0,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        activeColor: AppColors
                                                            .primaryBackground,
                                                        fillColor: MaterialStateProperty
                                                            .all<Color>(AppColors
                                                                .primaryBackground),
                                                        value: WaterMeter.yes,
                                                        groupValue: _waterMeter,
                                                        onChanged: (val) {
                                                          setStateSB(() {
                                                            _waterMeter = val;
                                                            _waterMeterValue =
                                                                'DESC';
                                                          });
                                                        }),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 11.w),
                                                    child: Row(
                                                      children: [
                                                        Checkbox(
                                                          //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                                                          activeColor:
                                                              Color.fromRGBO(23,
                                                                  56, 61, 1),
                                                          value:
                                                              isMarketPriceChecked,
                                                          onChanged:
                                                              (bool? value) {
                                                            setStateSB(() {
                                                              isMarketPriceChecked =
                                                                  value;
                                                            });
                                                          },
                                                        ),
                                                        Text(
                                                          'سعر السوق',
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle:
                                                                TextStyle(
                                                              color: AppColors
                                                                  .primaryBackground,
                                                              letterSpacing: 0,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
                                          context
                                              .read<EstateFilterCubit>()
                                              .emitAllEstatesFilterStates(
                                                  // goal: '',
                                                  priceFrom: int.tryParse(
                                                      _postPriceStartController
                                                          .text),
                                                  priceTo: int.tryParse(
                                                      _postPriceEndController
                                                          .text),
                                                  stateId: context.read<StateCubit>().id != 0
                                                      ? context
                                                          .read<StateCubit>()
                                                          .id
                                                      : null,
                                                  cityId: context.read<CitiesCubit>().id != 0
                                                      ? context
                                                          .read<CitiesCubit>()
                                                          .id
                                                      : null,
                                                  areaFrom: int.tryParse(
                                                      _areaStartController
                                                          .text),
                                                  areaTo: int.tryParse(
                                                      _areaEndController.text),
                                                  price_direction:
                                                      _electricMeterValue,
                                                  area_direction:
                                                      _waterMeterValue,
                                                  market_price:
                                                      isMarketPriceChecked == true
                                                          ? 1
                                                          : 0);
                                          context.read<StateCubit>().id = 0;
                                          context.read<CitiesCubit>().id = 0;
                                          selectedCity = null;
                                          stateValue = null;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FilterPage()));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 20.h,
                                              left: 25.w,
                                              right: 25.w),
                                          width: 200.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  23, 56, 61, 1),
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
                height: 12.h,
              ),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 812.h * 0.80,
                        child: TabBarView(
                          children: [
                            BlocBuilder<AllRealEstatesCubit,
                                AllRealEstateStates>(
                              builder: (context, state) {
                                return state.when(initial: () {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 55.h),
                                    child: SizedBox(
                                      height: 812.h * 0.715,
                                      child: ListView.builder(
                                          padding:
                                              EdgeInsets.only(bottom: 10.h),
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
                                          padding:
                                              EdgeInsets.only(bottom: 10.h),
                                          itemCount: 2,
                                          //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                          itemBuilder: (context, index) {
                                            return const AdvertisementCardPlaceholder();
                                          }),
                                    ),
                                  );
                                }, success: (AllRealEstatesResponseBody
                                    allRealEstatesResponseBody) {
                                  if (allRealEstatesResponseBody
                                      .data!.isEmpty) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 0.h),
                                      child: Center(
                                        child: Text(
                                          'لاتوجد عقارات',
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
                                    List<Data> filteredList =
                                        filterRealEstatesBySearchQuery(
                                      allRealEstates:
                                          allRealEstatesResponseBody.data!,
                                      searchQuery: _textSearchController.text,
                                    );

                                    return AdvertisementsView(
                                        allRealEstatesResponseBody:
                                            filteredList);
                                  }
                                }, error: (error) {
                                  return Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 200.h,
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
                                            width: 160.w,
                                            height: 42.h,
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    23, 56, 61, 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30.w)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                      spreadRadius: 1,
                                                      blurRadius: 2,
                                                      offset:
                                                          const Offset(0, 1))
                                                ]),
                                            child: Center(
                                              child: Text(
                                                'حاول مرة اخرى',
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
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              },
                            ),
                            BlocBuilder<AllRealEstatesBuyCubit,
                                AllRealEstateBuyStates>(
                              builder: (context, state) {
                                return state.when(initial: () {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 55.h),
                                    child: SizedBox(
                                      height: 812.h * 0.715,
                                      child: ListView.builder(
                                          padding:
                                              EdgeInsets.only(bottom: 10.h),
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
                                          padding:
                                              EdgeInsets.only(bottom: 10.h),
                                          itemCount: 2,
                                          //   separatorBuilder: (BuildContext context, int index) => const Divider(),
                                          itemBuilder: (context, index) {
                                            return const AdvertisementCardPlaceholder();
                                          }),
                                    ),
                                  );
                                }, success: (AllRealEstatesResponseBody
                                    allRealEstatesResponseBody) {
                                  if (allRealEstatesResponseBody
                                      .data!.isEmpty) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 0.h),
                                      child: Center(
                                        child: Text(
                                          'لاتوجد عقارات',
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
                                    List<Data> filteredList =
                                        filterRealEstatesBySearchQuery(
                                      allRealEstates:
                                          allRealEstatesResponseBody.data!,
                                      searchQuery: _textSearchController.text,
                                    );

                                    return AdvertisementsView(
                                        allRealEstatesResponseBody:
                                            filteredList);
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
                                            width: 180.w,
                                            height: 42.h,
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    23, 56, 61, 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30.w)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                      spreadRadius: 1,
                                                      blurRadius: 2,
                                                      offset:
                                                          const Offset(0, 1))
                                                ]),
                                            child: Center(
                                              child: Text(
                                                'حاول مرة اخرى',
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
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 315.h,
                          height: 38.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromRGBO(23, 56, 61, 0.1),
                          ),
                          child: TabBar(
                            // overlayColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                            dividerColor: Colors.transparent,
                            labelColor: Colors.white,
                            physics: const ClampingScrollPhysics(),
                            unselectedLabelColor:
                                const Color.fromRGBO(23, 56, 61, 1),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color.fromRGBO(23, 56, 61, 1)),
                            tabs: [
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "العرض",
                                      style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          //  color: AppColors.primaryBackground,
                                          letterSpacing: 0,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "الطلب",
                                      style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          //  color: AppColors.primaryBackground,
                                          letterSpacing: 0,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ])),
      ),
    );
  }
}
