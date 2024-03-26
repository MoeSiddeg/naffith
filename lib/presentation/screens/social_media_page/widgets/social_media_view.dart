import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../common/values/colors.dart';
import 'package:url_launcher/url_launcher.dart';
class SocialMediaView extends StatelessWidget {
  final String imagePath;
  final String text;
  final String? url;

  const SocialMediaView({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(url!.contains('05')){
          Uri phoneno = Uri.parse('tel:$url');
          await launch(phoneno.toString());
        }else if (url!.contains('@')){
          final Uri _emailLaunchUri = Uri(
              scheme: 'mailto',
              path: '$url',
              queryParameters: {
                'subject': ''
              }
          );
          await launch(_emailLaunchUri.toString());
        }else {
          await launch(url!);
        }

      },
      child: Padding(
        padding: EdgeInsets.only(right: 8.w),
        child: Row(
          children: [
            Image.asset(imagePath, width: 40.w, height: 40.h, fit: BoxFit.contain,),
            SizedBox(width: 15.w), // Add spacing
            Text(
              text,
              style: GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: AppColors.primaryBackground,
                  letterSpacing: 0,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}