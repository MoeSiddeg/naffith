import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:naffith/common/category/Cubit/category_cubit.dart';
import 'package:naffith/common/helpers/extensions.dart';
import 'package:naffith/common/state_list/Cubit/state_cubit.dart';
import 'package:naffith/common/values/colors.dart';
import 'package:naffith/presentation/screens/add_advertisements/BloC/add_post_state.dart';
import 'package:naffith/presentation/screens/add_advertisements/Cubit/add_real_estates_cubit.dart';
import 'package:naffith/presentation/screens/add_advertisements/widgets/add_real_estate_listener.dart';
import 'package:naffith/presentation/screens/add_advertisements/widgets/large_drop_down.dart';
import 'package:naffith/presentation/screens/add_advertisements/widgets/reusable_dropdown_with_text.dart';
import 'package:naffith/presentation/screens/add_advertisements/widgets/reusable_property_field.dart';
import 'package:naffith/presentation/screens/add_advertisements/widgets/street_drop_down.dart';
import '../../../common/cities/logic/cities_cubit.dart';
import '../../../common/cities/logic/cities_states.dart';
import '../../../common/values/constants_design.dart';
import '../../../common/widgets/interface_container.dart';
import '../application/application_page.dart';
import '../profile/logic/get_faal_cubit.dart';
import 'BloC/add_post_bloc.dart';
import 'data/models/add_real_estates_request_model.dart';
import 'widgets/inter_face_dialog.dart';
import 'widgets/multi_files_picker.dart';
import 'widgets/reusable_form_field.dart';

enum ElectricMeter { yes, no }

enum WaterMeter { yes, no }

enum RealGoal { sell, buy }

class AddAdvertisementLandPage extends StatefulWidget {
  const AddAdvertisementLandPage({Key? key}) : super(key: key);

  @override
  State<AddAdvertisementLandPage> createState() =>
      _AddAdvertisementLandPageState();
}

class _AddAdvertisementLandPageState extends State<AddAdvertisementLandPage> {
  StageBloc myBloc = StageBloc();
  final stageOneFormKey = GlobalKey<FormState>();
  final stageTwoFormKey = GlobalKey<FormState>();
  final stageThereFormKey = GlobalKey<FormState>();

  // for dropdown list
  List<File> selectedFiles = [];
  final List<String> streetList = [
    'شارع',
    "شارعين",
    "ثلاث شوارع",
    "اربع شوارع"
  ];

  bool oneStreet = false;
  bool twoStreet = false;
  bool thereStreet = false;
  bool fourStreet = false;
  String? selectedValue;
  String? selectedStreetOneValue;
  String? selectedStreetTwoValue;
  String? selectedStreetThereValue;
  String? selectedStreetFourValue;
  List<String?> street_space = [];
  bool getStreetName(String numbers) {
    switch (numbers) {
      case 'شارع':
        oneStreet = true;
        twoStreet = false;
        thereStreet = false;
        fourStreet = false;
        return true;
      case "شارعين":
        oneStreet = true;
        twoStreet = true;
        thereStreet = false;
        fourStreet = false;
        return true;
      case "ثلاث شوارع":
        oneStreet = true;
        twoStreet = true;
        thereStreet = true;
        fourStreet = false;
        return true;
      case "اربع شوارع":
        oneStreet = true;
        twoStreet = true;
        thereStreet = true;
        fourStreet = true;
        return true;
      default:
        return true;
    }
  }
///////////////////////////////////////////
  List<String> tamoyl = [];
  String? userType;
  String? selectedUserType;

  //////////////////////////////////////////
  List<String> ageList() {
    List<String> result = ["اقل من سنة"];
    for (int i = 2; i <= 35; i++) {
      result.add('$i سنة');
    }
    return result;
  }

  String? selectedAge;

////////////////////////
  String? selectFloor;

  ///////////////////////////////
  List<String> floorGenerateList() {
    List<String> result = [];
    for (int i = 1; i <= 50; i++) {
      result.add('$i');
    }
    return result;
  }

  String? selectedFloorNumber;

  //////////////////////////////////////////////
  List<String> areaGenerateList() {
    List<String> result = [];
    for (int i = 100; i <= 10000; i += 25) {
      result.add('المساحة $i م');
    }
    return result;
  }

  String? selectedArea;

  ////////////////////////////////////////
  List<String> streetAreaGenerateList() {
    List<String> result = [];
    for (int i = 5; i <= 100; i += 5) {
      result.add('م$i');
    }
    return result;
  }

  String? streetAreaValue;

  /////////////////////////////////
  List<String> roomGenerateList() {
    List<String> result = [];
    for (int i = 5; i <= 30; i++) {
      result.add('$i');
    }
    return result;
  }

  String? bedRoomValue;
  String? bathRoomValue;

////////////////////////////////////////////
  bool? isChecked = false;
  bool? _firstagree = false;
  bool? _3thagree = false;
  bool? _4thagree = false;
  bool _scendagree = false;
  String? categoryValue;
  String? stateValue;
  String? selectedCity;
  ElectricMeter? _electricMeter;
  WaterMeter? _waterMeter;
  RealGoal? _realGoal;
  String? _electricMeterValue;
  String? _goalValue;
  String? _goalView;
  String? _waterMeterValue;
  List<String> selectedInterface = [];

  // Controllers for each TextField
  final _postPriceController = TextEditingController();


  final _commentsController = TextEditingController();
  final _privetNoteController = TextEditingController();

  // FocusNodes for each TextField
  final _postPriceFocusNode = FocusNode();


  final List<ValueItem> _selectedOptionsTamoyl = [];
  List<String> _selectedItemsTamoyl = [];


  final List<ValueItem> _selectedOptionsWajah = [];
  final List<ValueItem<String>> optionsWajah = [
    ValueItem(label: 'الشرق', value: '1'),
    ValueItem(label: 'الشمال', value: '2'),
    ValueItem(label: 'الغرب', value: '3'),
    ValueItem(label: 'الجنوب', value: '4'),
  ];
  final List<ValueItem<String>> optionsTamoyl = [
    ValueItem(label: 'كاش', value: '1'),
    ValueItem(label: 'بنك', value: '2'),

  ];
  List<String> _selectedItemsWajah = [];
  String? _postPriceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء كتابة سعر البيع';
    }
    return null;
  }

  String? _commentsValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().emitCategoryStates();
    context.read<StateCubit>().emitCategoryStates();
  }

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Column(
          children: [
            Container(
              color: kBackgroundColor,
              padding: EdgeInsets.only(top: 40.h),
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
                    margin: EdgeInsets.only(right: 90.w, left: 70.h),
                    child: Text(
                      'إضافة إعلان',
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
            Container(color: kBackgroundColor, child: const Divider()),
          ],
        ),
        Container(
          color: kBackgroundColor,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 5.h, right: 15.h, top: 15.h, bottom: 1.h),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 28.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: myBloc.state.page >= 0
                                    ? AppColors.primaryBackground
                                    : const Color.fromRGBO(106, 115, 128, 0.9)),
                            child: Center(
                              child: Text('1',
                                  style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                    color: AppColors.primaryElementText,
                                    letterSpacing: 0,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ))),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 53.2.w, // Matches parent width
                        height: 1.h, // Line thickness
                        color: myBloc.state.page >= 1
                            ? AppColors.primaryBackground
                            : const Color.fromRGBO(
                                106, 115, 128, 1), // Line color
                      ),
                      Column(
                        children: [
                          Container(
                            width: 28.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: myBloc.state.page >= 1
                                    ? AppColors.primaryBackground
                                    : const Color.fromRGBO(106, 115, 128, 0.5)),
                            child: Center(
                              child: Text('2',
                                  style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                    color: AppColors.primaryElementText,
                                    letterSpacing: 0,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ))),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 53.2.w, // Matches parent width
                        height: 1.h, // Line thickness
                        color: myBloc.state.page >= 2
                            ? AppColors.primaryBackground
                            : const Color.fromRGBO(
                                106, 115, 128, 0.5), // Line color
                      ),
                      Container(
                        width: 28.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: myBloc.state.page >= 2
                                ? AppColors.primaryBackground
                                : const Color.fromRGBO(106, 115, 128, 0.5)),
                        child: Center(
                          child: Text('3',
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                color: AppColors.primaryElementText,
                                letterSpacing: 0,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ))),
                        ),
                      ),
                      Container(
                        width: 53.2.w, // Matches parent width
                        height: 1.h, // Line thickness
                        color: myBloc.state.page >= 3
                            ? AppColors.primaryBackground
                            : const Color.fromRGBO(
                                106, 115, 128, 0.5), // Line color
                      ),
                      Container(
                        width: 28.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: myBloc.state.page >= 3
                                ? AppColors.primaryBackground
                                : const Color.fromRGBO(106, 115, 128, 0.5)),
                        child: Center(
                          child: Text('4',
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                color: AppColors.primaryElementText,
                                letterSpacing: 0,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ))),
                        ),
                      ),
                      Container(
                        width: 53.2.w, // Matches parent width
                        height: 1.h, // Line thickness
                        color: myBloc.state.page >= 4
                            ? AppColors.primaryBackground
                            : const Color.fromRGBO(
                                106, 115, 128, 0.5), // Line color
                      ),
                      Container(
                        width: 28.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: myBloc.state.page >= 4
                              ? AppColors.primaryBackground
                              : const Color.fromRGBO(106, 115, 128, 0.5),
                        ),
                        child: Center(
                          child: Text('5',
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                color: AppColors.primaryElementText,
                                letterSpacing: 0,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h, right: 2.w),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15.w),
                        width: 70.w,
                        height: 15.h,
                        child: Center(
                          child: Text('العقار',
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                color: myBloc.state.page >= 0
                                    ? AppColors.primaryBackground
                                    : const Color.fromRGBO(106, 115, 128, 0.5),
                                letterSpacing: 0,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                              ))),
                        ),
                      ),
                      /* Container(
                                width: 40.w, // Matches parent width
                                height: 1.h, // Line thickness
                                color: Colors.transparent, // Line color
                              ),*/
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: SizedBox(
                          width: 70.w,
                          height: 15.h,
                          child: Center(
                            child: Text('التفاصيل',
                                style: GoogleFonts.almarai(
                                    textStyle: TextStyle(
                                  color: myBloc.state.page >= 1
                                      ? AppColors.primaryBackground
                                      : const Color.fromRGBO(
                                          106, 115, 128, 0.5),
                                  letterSpacing: 0,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                ))),
                          ),
                        ),
                      ),
                      /*    Container(
                                width: 36.w, // Matches parent width
                                height: 1.h, // Line thickness
                                color: Colors.transparent, // Line color
                              ),*/
                      SizedBox(
                        width: 75.w,
                        height: 15.h,
                        child: Center(
                          child: Text('تفاصيل اخرى',
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                color: myBloc.state.page >= 2
                                    ? AppColors.primaryBackground
                                    : const Color.fromRGBO(106, 115, 128, 0.5),
                                letterSpacing: 0,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                              ))),
                        ),
                      ),
                      /* Container(
                                width: 28.w, // Matches parent width
                                height: 1.h, // Line thickness
                                color: Colors.transparent, // Line color
                              ),*/
                      Container(
                        padding: EdgeInsets.only(right: 10.w),
                        width: 75.w,
                        height: 15.h,
                        child: Center(
                          child: Text('مراجعة العقار',
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                color: myBloc.state.page >= 3
                                    ? AppColors.primaryBackground
                                    : const Color.fromRGBO(106, 115, 128, 0.5),
                                letterSpacing: 0,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                              ))),
                        ),
                      ),
                      /*   Container(
                                width: 37.w, // Matches parent width
                                height: 1.h, // Line thickness
                                color: Colors.transparent, // Line color
                              ),*/
                      Container(
                        padding: EdgeInsets.only(right: 28.w),
                        width: 75.w,
                        height: 15.h,
                        child: Center(
                          child: Text('تم التأكيد',
                              style: GoogleFonts.almarai(
                                  textStyle: TextStyle(
                                color: myBloc.state.page >= 4
                                    ? AppColors.primaryBackground
                                    : const Color.fromRGBO(106, 115, 128, 0.5),
                                letterSpacing: 0,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                              ))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.h.h,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 365.w,
          height: 600.h,
          child: BlocBuilder<StageBloc, StageState>(
            builder: (context, state) {
              return PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (index) {
                  state.page = index;
                  // BlocProvider.of<StageBloc>(context).add(StageEvent());
                },
                children: [
                  stageOne(index: 1),
                  stageTwo(index: 2),
                  stageThere(index: 3),
                  stageFour(index: 4),
                  stageFive(),
                ],
              );
            },
          ),
        ),
        AddRealEstatesBlocListener(
          callBack: () {
            setState(() {
              pageController.animateToPage(4,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
              myBloc.state.page++;
            });
            context.pop();
          },
        )
      ]),
    );
  }

  Widget stageOne({required int index}) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: stageOneFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
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
                                  color: AppColors.primaryBackground,
                                  letterSpacing: 0,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            activeColor: AppColors.primaryBackground,
                            fillColor: MaterialStateProperty.all<Color>(
                                AppColors.primaryBackground),
                            value: RealGoal.sell,
                            groupValue: _realGoal,
                            onChanged: (val) {
                              setState(() {
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
                                  color: AppColors.primaryBackground,
                                  letterSpacing: 0,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            activeColor: AppColors.primaryBackground,
                            fillColor: MaterialStateProperty.all<Color>(
                                AppColors.primaryBackground),
                            value: RealGoal.buy,
                            groupValue: _realGoal,
                            onChanged: (val) {
                              setState(() {
                                _realGoal = val;
                                _goalValue = 'buy';
                                _goalView = "شراء";
                              });
                            }),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: LargeTypeDropdown(
                            selectedValue: categoryValue,
                            textWidgetString: 'نوع العقار',
                            items: context.read<CategoryCubit>().names,
                            onChanged: (String? value) {
                              setState(() {
                                categoryValue = value;
                                context
                                    .read<CategoryCubit>()
                                    .getCategoryID(name: value);
                              });
                            }),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PropertyTypeDropdown(
                      selectedValue: stateValue,
                      textWidgetString: 'المدينة',
                      items: context.read<StateCubit>().stateNames,
                      onChanged: (String? value) async {
                        setState(() {
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
                        return PropertyTypeDropdown(
                            selectedValue: selectedCity,
                            textWidgetString: 'الحي',
                            items: const [],
                            onChanged: (String? value) {
                              setState(() {
                                selectedCity = value;
                                context
                                    .read<CitiesCubit>()
                                    .getCityID(name: value);
                              });
                            });
                      }, loading: () {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: const CircularProgressIndicator(
                              color: AppColors.primaryBackground,
                            ),
                          ),
                        );
                      }, success: (cities) {
                        return PropertyTypeDropdown(
                            selectedValue: selectedCity,
                            textWidgetString: 'الحي',
                            items: context.read<CitiesCubit>().stateNames,
                            onChanged: (String? value) {
                              setState(() {
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
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableFormField(
                    labelText: 'السعر',
                    hintText: 'السعر',
                    controller: _postPriceController,
                    focusNode: _postPriceFocusNode,
                    validator: (value) => _postPriceValidator(value),
                    keyboardType: TextInputType.number,
                  ),
                  Container(
                      height: 79.h,
                      width: 163.w,
                      margin: EdgeInsets.only(left: 7.w),
                      child: Column(
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
                          MultiSelectDropDown<String>(
                            borderWidth: 1,
                            hint: 'التمويل',
                            clearIcon: null,
                            onOptionSelected: (List<ValueItem<String>> options) {
                              setState(() {
                                _selectedOptionsTamoyl.clear();
                                _selectedOptionsTamoyl.addAll(options);
                                _selectedItemsTamoyl = options.map((item) => item.label).toList();
                                debugPrint(_selectedItemsTamoyl.toString()); // Print for debugging
                              });
                              debugPrint(_selectedOptionsTamoyl.toString());
                            },
                            options:optionsTamoyl,
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
                                    ? const Icon(Icons.check_circle , color: AppColors.primaryBackground,)
                                    : const Icon(Icons.radio_button_unchecked , color: AppColors.primaryBackground,),
                              );
                            },
                          )
                          // SizedBox(height: 10), // Add some spacing between the dropdown and the selected options row
                        ],
                      )),
                  // InterfaceListAlertDialog(
                  //   stringList: ['بنك', "كاش",],
                  //   title: 'التمويل',
                  //   selectedItems: tamoyl,
                  // ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                    right: 15.h, left: 10.h, bottom: 5.h, top: 10.h),
                child: Text(
                  'سعر السوق',
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
              Row(
                children: [
                  Checkbox(
                    //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                    activeColor: const Color.fromRGBO(23, 56, 61, 1),
                    value: _scendagree,
                    onChanged: (bool? value) {
                      setState(() {
                        _scendagree = value!;
                      });
                      print(_scendagree);
                    },
                  ),
                  Text(
                    'بناء على متر السوق الحالي ',
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: const Color.fromRGBO(23, 56, 61, 0.5),
                        letterSpacing: 0,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 6.5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: 79.h,
                        width: 163.w,
                        margin: EdgeInsets.only(left: 7.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 5.w, left: 10.w),
                              child: Text(
                                "الواجهة",
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
                            MultiSelectDropDown<String>(
                              borderWidth: 1,
                              hint: 'الواجهة',
                              clearIcon: null,
                              onOptionSelected: (List<ValueItem<String>> selectedOptions) {
                                setState(() {
                                  _selectedOptionsWajah.clear();
                                  _selectedOptionsWajah.addAll(selectedOptions);
                                  _selectedItemsWajah = selectedOptions.map((item) => item.label).toList();
                                  debugPrint(_selectedItemsWajah.toString()); // Print for debugging
                                });
                                debugPrint(_selectedOptionsTamoyl.toString());
                              },
                              options:optionsWajah,
                              maxItems: 4,
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
                                      ? const Icon(Icons.check_circle , color: AppColors.primaryBackground,)
                                      : const Icon(Icons.radio_button_unchecked , color: AppColors.primaryBackground,),
                                );
                              },
                            )
                            // SizedBox(height: 10), // Add some spacing between the dropdown and the selected options row
                          ],
                        )),
                    // InterfaceListAlertDialog(
                    //   stringList: ['الشمال', "الجنوب", "الغرب", "الشرق"],
                    //   title: 'الواجهة',
                    //   selectedItems: selectedInterface,
                    // ),
                    SizedBox(
                      width: 15.w,
                    ),
                    PropertyTypeDropdown(
                      selectedValue: selectedArea,
                      textWidgetString: 'المساحة',
                      items: areaGenerateList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedArea = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    right: 10.h, left: 10.h, bottom: 5.h, top: 10.h),
                child: Text(
                  'صور من العقار :',
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
              MultiFilePicker(
                onFilesSelected: (files) {
                  // Handle the selected files here
                  setState(() {
                    selectedFiles = files;
                  });
                },
              ),
              SizedBox(
                height: 35.h,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_goalValue == null ||
                          categoryValue == null ||
                          stateValue == null ||
                          selectedCity == null ||
                          _postPriceController.text.isEmpty ||
                          _selectedItemsTamoyl.isEmpty ||
                          _selectedItemsWajah.isEmpty){
                        setupErrorState(context);
                      } else {
                        pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                        myBloc.state.page++;
                      }
                    });
                  },
                  child: Container(
                    width: 239.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(23, 56, 61, 1),
                        borderRadius: BorderRadius.all(Radius.circular(30.w)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 1))
                        ]),
                    child: Center(
                      child: Text(
                        'التالي',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget stageTwo({required int index}) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: stageTwoFormKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
                child:     Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PropertyTypeDropdown(
                      selectedValue: selectedValue,
                      textWidgetString: 'عدد الشوارع',
                      items: streetList,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                          street_space.clear();
                          getStreetName(value!);
                        });
                      },
                    ),
                    // PropertyTypeDropdown(
                    //   selectedValue: streetAreaValue,
                    //   textWidgetString: 'عرض الشوارع',
                    //   items: streetAreaGenerateList(),
                    //   onChanged: (String? value) {
                    //     setState(() {
                    //       streetAreaValue = value;
                    //     });
                    //   },
                    // ),
                  ],
                ),
              ),
              if(oneStreet)
                Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5.w, left: 10.w),
                        child: Text(
                          'مساحة الشوارع',
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
                    ],
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if(oneStreet)
                    StreetTypeDropdown(
                      selectedValue: selectedStreetOneValue,
                      textWidgetString: 'الاول',
                      items: streetAreaGenerateList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedStreetOneValue = value;
                          street_space.add(selectedStreetOneValue);
                        });
                      },
                    ),
                  if(twoStreet)
                    StreetTypeDropdown(
                      selectedValue: selectedStreetTwoValue,
                      textWidgetString: 'الثاني',
                      items: streetAreaGenerateList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedStreetTwoValue = value;
                          street_space.add(selectedStreetTwoValue);
                        });
                      },
                    ),
                  if(thereStreet)
                    StreetTypeDropdown(
                      selectedValue: selectedStreetThereValue,
                      textWidgetString: 'الثالث',
                      items: streetAreaGenerateList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedStreetThereValue = value;
                          street_space.add(selectedStreetTwoValue);
                        });
                      },
                    ),
                  if(fourStreet)
                    StreetTypeDropdown(
                      selectedValue: selectedStreetFourValue,
                      textWidgetString: 'الرابع',
                      items: streetAreaGenerateList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedStreetFourValue = value;
                          street_space.add(selectedStreetTwoValue);
                        });
                      },
                    ),
                ],
              ),
              ReusablePropertyField(
                label: 'الملاحظات ',
                hint: 'الملاحظات',
                padding: EdgeInsets.only(
                    right: 5.h, left: 10.h, bottom: 15.h, top: 25.h),
                margin: EdgeInsets.only(right: 5.h, left: 0.h),
                controller: _commentsController,
                validator: _commentsValidator,
              ),
              ReusablePropertyField(
                label: ' الملاحضات الخاصة ',
                hint: 'فير قابلة لل النشر',
                padding: EdgeInsets.only(
                    right: 5.h, left: 10.h, bottom: 15.h, top: 25.h),
                margin: const EdgeInsets.all(0),
                controller: _privetNoteController,
                validator: _commentsValidator,
              ),
              SizedBox(
                height: 70.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pageController.animateToPage(index - 2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                        myBloc.state.page--;
                      });
                    },
                    child: Container(
                      width: 120.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(30.w)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 1))
                          ]),
                      child: Center(
                        child: Text(
                          'رجوع',
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_commentsController.text.isNotEmpty &&
                            _privetNoteController.text.isNotEmpty &&
                            street_space.isNotEmpty &&
                            selectedValue != null) {
                          pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                          myBloc.state.page++;
                        } else {
                          setupErrorState(context);
                        }
                      });
                    },
                    child: Container(
                      width: 120.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(23, 56, 61, 1),
                          borderRadius: BorderRadius.all(Radius.circular(30.w)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 1))
                          ]),
                      child: Center(
                        child: Text(
                          'التالي',
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
            ],
          ),
        ),
      ),
    );
  }

  Widget stageThere({required int index}) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          //
          child: Form(
              key: stageThereFormKey,
              child: Column(children: [
                SizedBox(
                  height: 130.h,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                right: 15.h,
                                left: 10.h,
                                bottom: 5.h,
                                top: 10.h),
                            child: Text(
                              'هل توجد كهرباء ؟',
                              style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color: AppColors.primaryBackground,
                                  letterSpacing: 0,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: RadioListTile<ElectricMeter>(
                            title: Text(
                              'لا',
                              style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color: AppColors.primaryBackground,
                                  letterSpacing: 0,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            activeColor: AppColors.primaryBackground,
                            fillColor: MaterialStateProperty.all<Color>(
                                AppColors.primaryBackground),
                            value: ElectricMeter.no,
                            groupValue: _electricMeter,
                            onChanged: (val) {
                              setState(() {
                                _electricMeter = val;
                                _electricMeterValue = 'لا';
                              });
                            }),
                      ),
                      Flexible(
                        child: RadioListTile<ElectricMeter>(
                            title: Text(
                              'نعم',
                              style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color: AppColors.primaryBackground,
                                  letterSpacing: 0,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            activeColor: AppColors.primaryBackground,
                            fillColor: MaterialStateProperty.all<Color>(
                                AppColors.primaryBackground),
                            value: ElectricMeter.yes,
                            groupValue: _electricMeter,
                            onChanged: (val) {
                              setState(() {
                                _electricMeter = val;
                                _electricMeterValue = 'نعم';
                              });
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 130.h,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                right: 15.h,
                                left: 10.h,
                                bottom: 5.h,
                                top: 10.h),
                            child: Text(
                              'هل توجد مياه ؟',
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
                        ],
                      ),
                      Flexible(
                        child: RadioListTile<WaterMeter>(
                            title: Text(
                              'لا',
                              style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color: AppColors.primaryBackground,
                                  letterSpacing: 0,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            activeColor: AppColors.primaryBackground,
                            fillColor: MaterialStateProperty.all<Color>(
                                AppColors.primaryBackground),
                            value: WaterMeter.no,
                            groupValue: _waterMeter,
                            onChanged: (val) {
                              setState(() {
                                _waterMeter = val;
                                _waterMeterValue = 'لا';
                              });
                            }),
                      ),
                      Flexible(
                        child: RadioListTile<WaterMeter>(
                            title: Text(
                              'نعم',
                              style: GoogleFonts.almarai(
                                textStyle: TextStyle(
                                  color: AppColors.primaryBackground,
                                  letterSpacing: 0,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            activeColor: AppColors.primaryBackground,
                            fillColor: MaterialStateProperty.all<Color>(
                                AppColors.primaryBackground),
                            value: WaterMeter.yes,
                            groupValue: _waterMeter,
                            onChanged: (val) {
                              setState(() {
                                _waterMeter = val;
                                _waterMeterValue = 'نعم';
                              });
                            }),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 0.w),
                      child: LargeTypeDropdown(
                        selectedValue: selectedUserType,
                        textWidgetString: 'صفة المعلن',
                        items: const [
                          'مالك',
                          'وسيط بائع',
                          'مشتري',
                          'سيط مشتري'
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            switch (value) {
                              case 'مالك':
                                userType = 'seller';
                              case 'وسيط بائع':
                                userType = "seller_agent";
                              case 'مشتري':
                                userType = "buyer";
                              case 'وسيط مشتري':
                                userType = "buyer_agent";
                              default:
                                userType = "unKnown";
                            }
                            selectedUserType = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          right: 15.h, left: 10.h, bottom: 5.h, top: 10.h),
                      child: Text(
                        'التعهد بصحة البيانات',
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
                    Row(
                      children: [
                        Checkbox(
                          //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                          activeColor: const Color.fromRGBO(23, 56, 61, 1),
                          value: _firstagree,
                          onChanged: (bool? value) {
                            setState(() {
                              _firstagree = value;
                            });
                            print(_firstagree);
                          },
                        ),
                        Text(
                          'التعهد بصحة البيانات المدخلة وأني المسؤول عن كل شيء ',
                          style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                              color: const Color.fromRGBO(23, 56, 61, 0.5),
                              letterSpacing: 0,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: 15.h, left: 10.h, bottom: 5.h, top: 10.h),
                      child: Text(
                        'التعهد بصفتة',
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
                    Row(
                      children: [
                        Checkbox(
                          //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                          activeColor: const Color.fromRGBO(23, 56, 61, 1),
                          value: _3thagree,
                          onChanged: (bool? value) {
                            setState(() {
                              _3thagree = value;
                            });
                            print(_firstagree);
                          },
                        ),
                        Text(
                          'التعهد بصحة البيانات المدخلة وأني المسؤول عن كل شيء ',
                          style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                              color: const Color.fromRGBO(23, 56, 61, 0.5),
                              letterSpacing: 0,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: 15.h, left: 10.h, bottom: 5.h, top: 10.h),
                      child: Text(
                        'لا يوجد وسيط أخر',
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
                    Row(
                      children: [
                        Checkbox(
                          //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                          activeColor: const Color.fromRGBO(23, 56, 61, 1),
                          value: _4thagree,
                          onChanged: (bool? value) {
                            setState(() {
                              _4thagree = value;
                            });
                            print(_firstagree);
                          },
                        ),
                        Text(
                          'التعهد بصحة البيانات المدخلة وأني المسؤول عن كل شيء ',
                          style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                              color: const Color.fromRGBO(23, 56, 61, 0.5),
                              letterSpacing: 0,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          pageController.animateToPage(index - 2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                          myBloc.state.page--;
                        });
                      },
                      child: Container(
                        width: 120.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                            color: Colors.red,
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
                            'رجوع',
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
                    GestureDetector(
                      onTap: () {
                        if (userType == 'seller_agent' ||
                            userType == 'buyer_agent' &&
                                context.read<GetFaalCubit>().isHaveFaal ==
                                    false) {
                          setupErrorFaalState(context);
                        } else if (_electricMeterValue == null ||
                            _waterMeterValue == null ||
                            selectedUserType == null ||
                            _firstagree != true ||
                            _3thagree != true ||
                            _4thagree != true) {
                          setupErrorState(context);
                        } else {
                          setState(() {
                            pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                            myBloc.state.page++;
                          });
                        }
                      },
                      child: Container(
                        width: 120.w,
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
                            'التالي',
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
              ])),
        ),
      ),
    );
  }

  Widget stageFour({required int index}) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20.h, right: 20.h, left: 20.h, bottom: 20.h),
            width: 370.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromRGBO(23, 56, 61, 0.1),
            ),
            child: Container(
              // height: 500.h,
              margin: EdgeInsets.all(10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'هدف العقار',
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: AppColors.primaryBackground,
                        letterSpacing: 0,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    _goalView ?? "بيع",
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: const Color.fromRGBO(52, 73, 94, 1),
                        letterSpacing: 0,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    'نوع العقار',
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: AppColors.primaryBackground,
                        letterSpacing: 0,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    categoryValue ?? "",
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: const Color.fromRGBO(52, 73, 94, 1),
                        letterSpacing: 0,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    'السعر',
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: AppColors.primaryBackground,
                        letterSpacing: 0,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    '${_postPriceController.text} ريال سعودي',
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: const Color.fromRGBO(52, 73, 94, 1),
                        letterSpacing: 0,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    'صفة المعلن',
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: AppColors.primaryBackground,
                        letterSpacing: 0,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    selectedUserType ?? "مالك",
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: const Color.fromRGBO(52, 73, 94, 1),
                        letterSpacing: 0,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    'عداد المياه',
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: AppColors.primaryBackground,
                        letterSpacing: 0,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    _waterMeterValue ?? "لا",
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: const Color.fromRGBO(52, 73, 94, 1),
                        letterSpacing: 0,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    'المساحة',
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: AppColors.primaryBackground,
                        letterSpacing: 0,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    selectedArea ?? "0",
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: const Color.fromRGBO(52, 73, 94, 1),
                        letterSpacing: 0,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    'عدد الشوارع',
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: AppColors.primaryBackground,
                        letterSpacing: 0,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    selectedValue ?? "",
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: const Color.fromRGBO(52, 73, 94, 1),
                        letterSpacing: 0,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    'عدد الواجهات',
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: AppColors.primaryBackground,
                        letterSpacing: 0,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _selectedItemsWajah.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 5.w, top: 3.h),
                            child: InterFaceContainer(
                                title: _selectedItemsWajah[index]),
                          );
                        }),
                  ),
                  const Divider(),
                  Text(
                    'الحي',
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: AppColors.primaryBackground,
                        letterSpacing: 0,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    selectedCity ?? "",
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: const Color.fromRGBO(52, 73, 94, 1),
                        letterSpacing: 0,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    'نوع التمويل',
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: AppColors.primaryBackground,
                        letterSpacing: 0,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _selectedItemsTamoyl.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 5.w, top: 3.h),
                            child: InterFaceContainer(title: _selectedItemsTamoyl[index]),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          selectedFiles.isEmpty
              ? const SizedBox()
              : SizedBox(
                  height: 180.h,
                  width: 350.w,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Number of images per row
                    ),
                    itemCount: selectedFiles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.file(selectedFiles[index]);
                    },
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController.animateToPage(index - 2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                    myBloc.state.page--;
                  });
                },
                child: Container(
                  width: 120.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(30.w)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1))
                      ]),
                  child: Center(
                    child: Text(
                      'رجوع',
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
              GestureDetector(
                onTap: () {
                  String area = selectedArea!.replaceAll(RegExp(r'[^0-9]'), '');
                  context.read<AddRealEstatesCubit>().emitAddRealEstateStates(
                      AddRealEstatesRequest(
                        goal: _goalValue!,
                        price: _scendagree ? '0' : _postPriceController.text,
                        area: area,
                        interface: _selectedItemsWajah,
                        water_meter: _waterMeterValue!,
                        number_streets: selectedValue!,
                        street_spaces: '0',
                        electricity_meter: _electricMeterValue!,
                        adjective_advertiser: userType!,
                        type: 'land',
                        sub_type: categoryValue!,
                        state_id: context.read<StateCubit>().id.toString(),
                        city_id: context.read<CitiesCubit>().id.toString(),
                        data_validity: '1',
                        note: _commentsController.text,
                        bathroom: '3',
                        financing_type: _selectedItemsTamoyl,
                        street_space: street_space,
                        private_note: _privetNoteController.text,
                        market_price: _scendagree ? '1' : '0',
                      ),
                      selectedFiles);
                },
                child: Container(
                  width: 120.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(23, 56, 61, 1),
                      borderRadius: BorderRadius.all(Radius.circular(30.w)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1))
                      ]),
                  child: Center(
                    child: Text(
                      'التالي',
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
          SizedBox(
            height: 25.h,
          )
        ],
      ),
    );
  }

  Widget stageFive() {
    return Container(
      color: kBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60.h),
          SizedBox(
            width: 150.w,
            height: 153.h,
            child: Image.asset(
              'assets/images/check.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Text(
            'تم إضافة الاعلان بنجاح',
            style: GoogleFonts.almarai(
              textStyle: TextStyle(
                color: AppColors.primaryBackground,
                letterSpacing: 0,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 150.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ApplicationPage(),
              ));
            },
            child: Container(
              width: 239.w,
              height: 42.h,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(144, 117, 60, 1),
                  borderRadius: BorderRadius.all(Radius.circular(30.w)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 1))
                  ]),
              child: Center(
                child: Text(
                  'قائمة إعلاناتي',
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
          )
        ],
      ),
    );
  }

  void setupErrorState(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 150.w,
              height: 153.h,
              child: Image.asset(
                'assets/images/warning.png',
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'الرجاء التأكد من صحة جميع البيانات',
              style: GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: const Color.fromRGBO(23, 56, 61, 1),
                  letterSpacing: 0,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 139.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(23, 56, 61, 1),
                      borderRadius: BorderRadius.all(Radius.circular(30.w)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1))
                      ]),
                  child: Center(
                    child: Text(
                      'حسنا',
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
        ],
      ),
    );
  }

  void setupErrorFaalState(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 150.w,
              height: 153.h,
              child: Image.asset(
                'assets/images/warning.png',
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'يجب ان تكون لديك رخصة فال لتكون وسيط',
              style: GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: const Color.fromRGBO(23, 56, 61, 1),
                  letterSpacing: 0,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 139.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(23, 56, 61, 1),
                      borderRadius: BorderRadius.all(Radius.circular(30.w)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1))
                      ]),
                  child: Center(
                    child: Text(
                      'حسنا',
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
        ],
      ),
    );
  }
}
