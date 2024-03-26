import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/application/widgets/application_widgets.dart';
import '../../../common/values/colors.dart';
import '../../../common/values/constants_design.dart';
import 'bloc/app_blocs.dart';
import 'bloc/app_events.dart';
import 'bloc/app_states.dart';
class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {

  @override
  void initState(){
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(builder: (context, state){

      return PopScope(
        canPop:  false,
        child: Container(
          color:kBackgroundColor,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.h),
                        topRight: Radius.circular(20.h)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                      )
                    ]
                ),
                child: BottomNavigationBar(
                  backgroundColor: kBackgroundColor,
                  currentIndex: state.index,
                  onTap: (value) {
                    context.read<AppBlocs>().add(TriggerAppEvent(value));
                  },
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primarySecondaryElementText,
                  items: bottomTabs,
                    selectedLabelStyle:GoogleFonts.almarai(
                        textStyle: TextStyle(
                          color: AppColors.primaryBackground,
                          letterSpacing: 0,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        )),
                  unselectedLabelStyle:GoogleFonts.almarai(
                      textStyle: TextStyle(
                        color: AppColors.primaryBackground,
                        letterSpacing: 0,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

}
