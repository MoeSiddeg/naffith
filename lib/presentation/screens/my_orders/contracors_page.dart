import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/my_orders/data/models/contractors_response_body.dart';
import 'package:naffith/presentation/screens/my_orders/data/models/order_response_goal.dart';
import 'package:naffith/presentation/screens/my_orders/logic/contractors/contractors_cubit.dart';
import 'package:naffith/presentation/screens/my_orders/logic/contractors/contractors_state.dart';
import 'package:naffith/presentation/screens/my_orders/widgets/contractors_card.dart';

import '../../../common/values/colors.dart';
class ContractorsPage extends StatefulWidget {
  String id;
   ContractorsPage({super.key, required this.id});

  @override
  State<ContractorsPage> createState() => _ContractorsPageState();
}

class _ContractorsPageState extends State<ContractorsPage> {
  @override
  void initState() {
    // context.read<ContractorCubit>().emitContractorsStates(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_right_sharp,
                        size: 30.h,
                        color: AppColors.primaryBackground,
                      )),
                  Container(
                    margin: EdgeInsets.only(right: 40.h, left: 70.h),
                    child: Text(
                      'المتعهدون على الاعلان',
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
            BlocBuilder<ContractorCubit, ContractorsState>(builder: (context , state){
              return state.when(

                  initial: (){
                    return Column(
                      children: [
                        SizedBox(height: 250.h,),
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    );
                  }, loading: (){
               return Column(
                  children: [
                    SizedBox(height: 250.h,),
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              }, success: (OrderResponseGoal contractorsResponse){

                      return const Center(
                        child: Text('لا يوجد متعهدون'),
                      );

              }, error: (error){
                    return Column(
                      children: [
                        SizedBox(height: 250.h,),
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    );
              });

            })
          ],
        ),
      ],
    );
  }
}
