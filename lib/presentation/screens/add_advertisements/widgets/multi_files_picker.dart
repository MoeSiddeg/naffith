import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/values/colors.dart';

class MultiFilePicker extends StatefulWidget {
  final Function(List<File>) onFilesSelected;

  const MultiFilePicker({Key? key, required this.onFilesSelected})
      : super(key: key);

  @override
  State<MultiFilePicker> createState() => _MultiFilePickerState();
}

class _MultiFilePickerState extends State<MultiFilePicker> {
  final List<PlatformFile> _selectedFiles = [];

  Widget filePreview(PlatformFile file) {
      return Image.file(
        File(file.path.toString()),
        fit: BoxFit.cover,
      );
    }

  Widget _buildFilePreview(List<PlatformFile> file) {
    return Container(
      height: 150.h, // Set a fixed height for the container
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _selectedFiles.length,
        // Replace with the actual length of your list
        itemBuilder: (context, index) {
          final file =
              _selectedFiles[index]; // Replace with your actual list item

          return SizedBox(

            // margin: EdgeInsets.symmetric(horizontal: 10.),
            width: 115.w, // Set a fixed width for the child widget
              child: Stack(
                children: [
                  Container(
                    // padding: EdgeInsets.all(3.h),
                    width: 100.w,
                    height: 105.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primarySecondaryBackground

                    ),
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: filePreview(file),
                    ),
                  ),
                  Positioned(
                    top: 1.h,
                    right: 2.w,
                    child: Container(
                      height: 25.h,
                      width: 25.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent, // Change color as desired
                        ),
                      child: Center(
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              // Implement your logic for removing the file
                              setState(() {
                                _selectedFiles.removeAt(index);
                              });
                            },
                            icon:  Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 10.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      // height: 130.h,
      margin: EdgeInsets.only(top: 5.h, bottom: 10.h, right: 20.h, left: 20.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          if(_selectedFiles.length == 0)
          GestureDetector(
            onTap: () {
              _pickFiles();
            },
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15.h),
                    width: 70.w,
                    height: 80.h,
                    child: Image.asset('assets/images/uploadImage.png',
                        fit: BoxFit.cover),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        right: 15.h, left: 10.h, bottom: 5.h, top: 10.h),
                    child: Text(
                      ' رفع صور إن وجدت (14 صورة كحد أقصى) ',
                      style: GoogleFonts.almarai(
                        textStyle: TextStyle(
                          color: const Color.fromRGBO(23, 56, 61, 0.5),
                          letterSpacing: 0,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          if (_selectedFiles.isNotEmpty) _buildFilePreview(_selectedFiles),
        ],
      ),
    );
  }

  Future<void> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {
      if ((_selectedFiles.length + result.files.length) <= 14) {
        List<MultipartFile> imageFiles = result.files.map((file) {
          return MultipartFile.fromFileSync(
            file.path!,
            filename: file.name,
          );
        }).toList();
        List<File> files = result.paths.map((path) => File(path!)).toList();
        widget.onFilesSelected(files);

        setState(() {
          _selectedFiles.addAll(result.files);
        });
      } else {
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'مسموح بإضافة 14 صورة فقط',
              style: GoogleFonts.almarai(
                textStyle: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  letterSpacing: 0,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        );
      }
    }
  }
}
