import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naffith/presentation/screens/privacy_policy_page/Cubit/privacy_policy_states.dart';
import 'package:naffith/presentation/screens/privacy_policy_page/Cubit/privay_policy_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../common/values/colors.dart';
import '../../../common/widgets/holder.dart';
import '../../../common/widgets/reusable_about_page.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  void initState() {
    super.initState();

    context.read<PrivacyPolicyCubit>().emitPrivacyPolicyStates();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyStates>(
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
        }, success: (privacyPolicyResponseBody){
          return AboutPage(titel: 'سياسة الخصوصية', supTitel: 'سياسة الخصوصية :', largText: privacyPolicyResponseBody.privacyPolicy ?? "", margin: EdgeInsets.only(right: 65.w ,left: 75.w),);
        }, error: (error){
          return const Center(
            child:  CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        });
      }
    );
  }
}
