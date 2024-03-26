import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/helpers/extensions.dart';
import 'package:naffith/presentation/screens/profile/data/models/update_faal_request.dart';
import 'package:naffith/presentation/screens/profile/logic/delete_faal_cubit.dart';
import 'package:naffith/presentation/screens/profile/logic/get_faal_cubit.dart';
import 'package:naffith/presentation/screens/profile/logic/get_faal_state.dart';
import 'package:naffith/presentation/screens/profile/logic/update_faal_cubit.dart';
import 'package:naffith/presentation/screens/profile/logic/upload_faal_cubit.dart';
import 'package:naffith/presentation/screens/profile/widgets/delete_faal_listener.dart';
import 'package:file_picker/file_picker.dart';
import 'package:naffith/presentation/screens/profile/widgets/update_faal_listener.dart';
import 'package:naffith/presentation/screens/profile/widgets/upload_faal_listener.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/values/colors.dart';
import '../../../global.dart';


class ProfilePage extends StatefulWidget {

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();

    context.read<GetFaalCubit>().emitGetFaalStates();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top:40.h),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.keyboard_arrow_right_sharp, size: 30.h,
                      color: AppColors.primaryBackground,)),
                      Container(
                        margin: EdgeInsets.only(right: 50.w  , left: 50.h),
                        child: Text(
                          'المعلومات الشخصية',
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
           SingleChildScrollView(
             child: Column(
               children: [
                 Container(
                   padding: EdgeInsets.only(top:10.h , right: 50.h),
                   child: Row(
                     children: [
                       SizedBox(
                         height: 75.h,
                         width: 70.w,
                         child:
                        Icon(Icons.account_circle_outlined,
                             color: AppColors.primaryBackground,
                             size: 72.sp),
                       ),
                       Container(
                         margin: EdgeInsets.only(right:10.w),
                         child: Column(
                           children: [
                             Padding(
                               padding: EdgeInsets.only(right: 0.h),
                               child: Text(
                                 Global.storageService.getUserName(),
                                 style: GoogleFonts.almarai(
                                     textStyle: TextStyle(
                                       color: AppColors.primaryBackground,
                                       letterSpacing: 0,
                                       fontSize: 16.sp,
                                       fontWeight: FontWeight.w700,
                                     )),),
                             ),

                           ],
                         ),
                       )
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 22.h,
                 ), Container(
                     padding: EdgeInsets.only(right: 10.w , bottom: 10.h),
                     width: 335.w,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color:
                       const Color.fromRGBO(243, 244, 245, 1),
                     ),
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment:
                           MainAxisAlignment.start,
                           children: [
                             Padding(
                               padding: EdgeInsets.only(top: 10.w),
                               child: Text(
                                 "نبذة عني :",
                                 style: GoogleFonts.almarai(
                                   textStyle: TextStyle(
                                     color: AppColors
                                         .primaryBackground,
                                     letterSpacing: 0,
                                     fontSize: 14.sp,
                                     fontWeight: FontWeight.w700,
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 15.h,),
                         Padding(
                           padding:  EdgeInsets.only(left:8.w),
                           child: Column(
                             children: [
                               Padding(
                                 padding: EdgeInsets.only(
                                     right: 2.w),
                                 child: Text(
                                   "مندوب مبيعات العقارات مسؤول عن مساعدة الناس في شراء وبيع العقارات. وهذا يشمل مساعدة العملاء في العثور على العقارات المناسبة ، وإدارة الأعمال الورقية المتعلقة بالبيع ، والتفاوض على الصفقات. كما يقدمون المشورة بشأن اتجاهات السوق والرهون العقارية والمسائل القانونية المتعلقة بالمعاملات العقارية.",
                                   style: GoogleFonts.almarai(
                                     textStyle: TextStyle(
                                       color:
                                       AppColors.primaryBackground,
                                       letterSpacing: 0,
                                       fontSize: 14.sp,
                                       fontWeight: FontWeight.w300,
                                     ),
                                   ),
                                 ),
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                   IconButton(onPressed: (){}, icon: Icon(Icons.edit, size: 22.sp,))
                                 ],
                               )
                             ],
                           ),
                         )
                       ],
                     )),
                 SizedBox(height: 20.h,),
                 BlocBuilder<GetFaalCubit,GetFaalStates>(builder: (context, state){
                   return state.when(initial: (){
                     return const Center(
                       child:  CircularProgressIndicator(
                         color:  AppColors.primaryBackground,
                       ),
                     );
                   }, loading: (){
                     return const Center(
                       child:  CircularProgressIndicator(
                         color:  AppColors.primaryBackground,
                       ),
                     );
                   }, success: (getFaalResponseBody){
                     return Container(
                       margin: EdgeInsets.only(top: 20.h ,right: 20.h , left: 20.h , bottom: 20.h),
                       padding: EdgeInsets.only(right: 10.w , bottom: 10.h),
                       width: 335.w,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color:
                         const Color.fromRGBO(243, 244, 245, 1),
                       ),
                       child: Column(
                         children: [
                           Padding(
                             padding: EdgeInsets.only( top: 15.h),
                             child:
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     Text(
                                       "رخصة فال",
                                       style: GoogleFonts.almarai(
                                           textStyle: TextStyle(
                                             color: AppColors.primaryBackground,
                                             letterSpacing: 0,
                                             fontSize: 15.sp,
                                             fontWeight: FontWeight.w700,
                                           )),),

                                     Container(
                                       margin: EdgeInsets.only(right: 10.w),
                                       padding: EdgeInsets.all(3.sp),
                                       decoration: BoxDecoration(
                                           color: const Color.fromRGBO(
                                               55, 205, 55, 0.3),
                                           borderRadius: BorderRadius.all(
                                               Radius.circular(5.sp)),
                                           border: Border.all(
                                             color: Colors.green, // Set the border color to red
                                             width: 1, // Set the border width as desired
                                           )
                                       ),
                                       // TODO CHECK SALE STATUS WITH BASIL
                                       child: Text("متوفرة", style: GoogleFonts.almarai(
                                         textStyle: TextStyle(
                                           color: Colors.green.shade500,
                                           letterSpacing: 0,
                                           fontSize: 11.sp,
                                           fontWeight: FontWeight.w500, ),)),
                                     ),
                                     SizedBox(width: 50.w,),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.end,
                                       children: [
                                         IconButton(onPressed: (){
                                           launchUrl(Uri.parse(getFaalResponseBody.data!.faalDocument!)); }, icon: const Icon(Icons.document_scanner_sharp)),
                                         IconButton(onPressed: (){
                                           _updateFaalFile(); }, icon: const Icon(Icons.upload_file)),
                                         IconButton(onPressed: (){
                                           context.read<DeleteFaalCubit>().emitDeleteFaalStates(UpdateFaalRequest(method: 'DELETE')); }, icon: const Icon(Icons.delete, color: Colors.redAccent,)),
                                       ],
                                     )
                                   ],
                                 ),
                               ],
                             ),

                           ),
                         ],
                       ),
                     );
                   }, error: (error){
                    return GestureDetector(
                       onTap: (){},
                       child: Container(
                         margin: EdgeInsets.only(top: 20.h ,right: 20.h , left: 20.h , bottom: 20.h),
                         padding: EdgeInsets.only(right: 10.w , bottom: 10.h),
                         width: 335.w,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color:
                           const Color.fromRGBO(243, 244, 245, 1),
                         ),
                         child: Column(
                           children: [
                             Padding(
                               padding: EdgeInsets.only( top: 15.h),
                               child:
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(
                                     children: [
                                        Text(
                                           "رخصة فال",
                                           style: GoogleFonts.almarai(
                                               textStyle: TextStyle(
                                                 color: AppColors.primaryBackground,
                                                 letterSpacing: 0,
                                                 fontSize: 15.sp,
                                                 fontWeight: FontWeight.w700,
                                               )),),
                                       SizedBox(width: 10.w,),
                                       Container(
                                         padding: EdgeInsets.all(3.sp),
                                         decoration: BoxDecoration(
                                             color: const Color.fromRGBO(
                                                 255, 55, 55, 0.3),
                                             borderRadius: BorderRadius.all(
                                                 Radius.circular(5.sp)),
                                             border: Border.all(
                                               color: Colors.red, // Set the border color to red
                                               width: 1, // Set the border width as desired
                                             )
                                         ),
                                         // TODO CHECK SALE STATUS WITH BASIL
                                         child: Text("غير متوفرة", style: GoogleFonts.almarai(
                                           textStyle: TextStyle(
                                             color: Colors.redAccent,
                                             letterSpacing: 0,
                                             fontSize: 11.sp,
                                             fontWeight: FontWeight.w500, ),)),
                                       ),
                                       SizedBox(width: 120.w,),
                                       IconButton(onPressed: (){
                                         _selectFile(); }, icon: const Icon(Icons.upload_file))
                                     ],
                                   ),
                                 ],
                               ),

                             ),
                           ],
                         ),
                       ),
                     );
                   });
                 }),
                 const UploadFaalBlocListener(),
                 const UpdateFaalBlocListener(),
                 const DeleteFaalBlocListener()
               ],
             ),
           )
          ],
        ),

    );
  }
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
  void _showFileInfoDialog(String fileName, int fileSize) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('معلومات رخصة فال',
                style: GoogleFonts.almarai(
                textStyle: TextStyle(
                color: const Color.fromRGBO(23, 56, 61, 1),
                letterSpacing: 0,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                      ),),),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: $fileName'),
              Text('Size: ${fileSize / (1024 * 1024)} MB'),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                    context.read<UploadFaalCubit>().emitUploadFaalStates(docFaal!);
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
                        'رفع رخصة فال',
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
        );
      },
    );
  }
  void _updateFaalFileInfoDialog(String fileName, int fileSize) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('معلومات رخصة فال',
                style: GoogleFonts.almarai(
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(23, 56, 61, 1),
                    letterSpacing: 0,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),),),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: $fileName'),
              Text('Size: ${fileSize / (1024 * 1024)} MB'),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                    if(updateFall!=null) {
                      context.read<UpdateFaalCubit>().emitUpdateFaalStates(
                          updateFall!,UpdateFaalRequest(method: 'put'));
                    } },
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
                        'تحديث رخصة فال',
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
        );
      },
    );
  }
  String? filePath;
  FilePickerResult? docFaal;
  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'], // Add more file types if needed
    );

    if (result != null) {
      String path = result.files.single.path ?? '';
      int fileSize = result.files.single.size ?? 0;
      String fileName = result.files.single.name ?? '';

      if (fileSize <= 2 * 1024 * 1024) {
        setState(() {
          filePath = path;
          docFaal =result;
        });

        // Show file information dialog
        _showFileInfoDialog(fileName,fileSize);
      } else {
        // File exceeds the maximum allowed size
        _showSnackBar('Please select a file with a maximum size of 2 MB.');
      }
    }


  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  FilePickerResult? updateFall;
  Future<void> _updateFaalFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'], // Add more file types if needed
    );

    if (result != null) {
      String path = result.files.single.path ?? '';
      int fileSize = result.files.single.size ?? 0;
      String fileName = result.files.single.name ?? '';

      if (fileSize <= 2 * 1024 * 1024) {
        setState(() {
          filePath = path;
          updateFall =result;
        });

        // Show file information dialog
        _updateFaalFileInfoDialog(fileName,fileSize);
      } else {
        // File exceeds the maximum allowed size
        _showSnackBar('Please select a file with a maximum size of 2 MB.');
      }
    }


  }

}

