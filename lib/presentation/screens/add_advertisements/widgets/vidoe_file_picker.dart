import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/values/colors.dart';

class VideoFileNameDisplay extends StatelessWidget {
  final String fileName;

  VideoFileNameDisplay({required this.fileName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'الفيديو المختار :',
            style: GoogleFonts.almarai(
              textStyle: TextStyle(
                color: AppColors.primaryBackground,
                letterSpacing: 0,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
          ),
          ),
          SizedBox(height: 10.h),
          Text(
            fileName,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}

class VideoSelectionWidget extends StatefulWidget {
  @override
  _VideoSelectionWidgetState createState() => _VideoSelectionWidgetState();
}

class _VideoSelectionWidgetState extends State<VideoSelectionWidget> {
  String? _selectedVideoFileName;

  Future<void> _pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedVideoFileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (_selectedVideoFileName != null)
          VideoFileNameDisplay(fileName: _selectedVideoFileName!)
        else
          SizedBox(
            height: 60.h,
          ),
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _pickVideo();
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
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'إضافة فيديو',
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
    );
  }
}
