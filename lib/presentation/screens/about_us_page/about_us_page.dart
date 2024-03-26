import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naffith/common/values/colors.dart';
import 'package:naffith/presentation/screens/about_us_page/Cubit/about_us_cubit.dart';
import 'package:naffith/presentation/screens/about_us_page/Cubit/about_us_states.dart';
import 'package:shimmer/shimmer.dart';
import '../../../common/widgets/holder.dart';
import '../../../common/widgets/reusable_about_page.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  void initState() {
    super.initState();

    context.read<AboutUsCubit>().emitAboutUsStates();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsCubit, AboutUsStates>(
        builder: (context , state){
          return state.when(initial: (){
            return const Center(
              child:  CircularProgressIndicator(
                color: AppColors.primaryBackground,
              ),
            );
          }, loading: (){
            return const Center(
              child:  CircularProgressIndicator(
                color: AppColors.primaryBackground,
              ),
            );
          }, success: (aboutUsResponseBody){
            return AboutPage(titel: 'عن نفّذ', supTitel: 'عن نفّذ :', largText: aboutUsResponseBody.aboutUs ?? "", margin: EdgeInsets.only(right: 110.w ,left: 70.w),);
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
