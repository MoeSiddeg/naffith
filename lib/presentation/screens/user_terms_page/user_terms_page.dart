import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naffith/presentation/screens/user_terms_page/Cubit/user_terms_states.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/values/colors.dart';
import '../../../common/widgets/holder.dart';
import '../../../common/widgets/reusable_about_page.dart';
import 'Cubit/user_terms_cubit.dart';
class UserTermsPage extends StatefulWidget {
  const UserTermsPage({super.key});

  @override
  State<UserTermsPage> createState() => _UserTermsPageState();
}

class _UserTermsPageState extends State<UserTermsPage> {
  @override
  void initState() {
    super.initState();

    context.read<UserTermsCubit>().emitUserTermsStates();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserTermsCubit, UserTermsStates>(
      builder: (context , state){
        return state.when(initial: (){
          return  const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryBackground,
            ),
          );
        }, loading: (){
          return  const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryBackground,
            ),
          );
        }, success: (userTermsResponseBody){
          return AboutPage(titel: 'الشروط و الأحكام', supTitel: 'الشروط و الأحكام :', largText: userTermsResponseBody.userTermsOfUse ?? "",
             margin: EdgeInsets.only(right: 70.w, left: 70.w),);
        }, error: (error){
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        });
      }
    );
  }
}
