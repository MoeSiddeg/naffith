import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/values/colors.dart';
import 'package:naffith/common/widgets/holder.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/comman_questions_page/Cubit/comman_questions_cubit.dart';
import 'package:naffith/presentation/screens/comman_questions_page/Cubit/comman_questions_states.dart';

import '../application/application_page.dart';

class CommanQuestionsPage extends StatefulWidget {
  const CommanQuestionsPage({super.key});

  @override
  State<CommanQuestionsPage> createState() => _CommanQuestionsPageState();
}

class _CommanQuestionsPageState extends State<CommanQuestionsPage> {
  @override
  void initState() {
    super.initState();
    context.read<CommanQuestionsCubit>().emitCommanQuestionsStates();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommanQuestionsCubit, CommanQuestionsStates>(
        builder: (context, state) {
      return state.when(initial: () {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryBackground,
          ),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryBackground,
          ),
        );
      }, success: (commanQuestionsResponseBody) {
        if(commanQuestionsResponseBody.commanQuestions != null &&
            commanQuestionsResponseBody.commanQuestions!.isNotEmpty){
          return Scaffold(
              body: SingleChildScrollView(
                child:PopScope(
                    canPop:  false,
                  child: Column(

                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>const ApplicationPage(),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.keyboard_arrow_right_sharp,
                                      size: 30.h,
                                      color: AppColors.primaryBackground,
                                    )),
                                Container(
                                  margin: EdgeInsets.only(right: 75.h, left: 70.h),
                                  child: Text(
                                    'الأسئلة الشائعة',
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
                          const Divider()
                        ],
                      ),
                      SizedBox(
                        height: 812.h * 0.9,
                        child: ListView.builder(
                            itemCount: commanQuestionsResponseBody.commanQuestions!.length,
                            itemBuilder: (context, index) {
                              return Container(

                                margin:  EdgeInsets.only( top: 10.h , bottom: 10.h, right: 10.w , left: 10.w ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.sp),
                                  color: const Color.fromRGBO(23, 56, 61, 0.1),
                                ),
                                child: ExpansionTile(
                                    collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
                                    iconColor: AppColors.primaryBackground,
                                    collapsedIconColor:AppColors.primaryBackground,
                                    childrenPadding:
                                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                    expandedCrossAxisAlignment: CrossAxisAlignment.end,
                                    title: Text('${commanQuestionsResponseBody.commanQuestions![index].question}', style: GoogleFonts.almarai(
                                      textStyle: TextStyle(
                                        color: AppColors.primaryBackground,
                                        letterSpacing: 0,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),

                                    ),),
                                    children: [
                                      Text( '${commanQuestionsResponseBody.commanQuestions![index].answer}', style: GoogleFonts.almarai(
                                        textStyle: TextStyle(
                                          color: AppColors.primaryBackground,
                                          letterSpacing: 0,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                        ),

                                      )),
                                    ]
                                ),
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
              )
          );
        } else{
          return Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>const ApplicationPage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_right_sharp,
                              size: 30.h,
                              color: AppColors.primaryBackground,
                            )),
                        Container(
                          margin: EdgeInsets.only(right: 75.h, left: 70.h),
                          child: Text(
                            'الأسئلة الشائعة',
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
                  const Divider()
                ],
              ),
              SizedBox(
                height: 150.h,
              ),
              Center(
                child: Text('لاتوجد اسئلة',   style: GoogleFonts.almarai(
                    textStyle: TextStyle(
                      color: AppColors.primaryBackground,
                      letterSpacing: 0,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    )),),
              ),
            ],
          );
        }
      }, error: (error) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        );
      });
    });
  }
}
