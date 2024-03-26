import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AdvertisementCardPlaceholder extends StatelessWidget {
  const AdvertisementCardPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.all(10),
      height: 197.h,
      width: 370.w,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(243, 244, 246, 1), width: 2.0),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Column(
          children: [
            Container(
              height: 130.h,
              width: 335.w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Use a placeholder for image with a border
                  Container(
                    width: 100.h,
                    height: 110.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Colors.grey[400]!,
                        width: 1,
                      ),
                    ),
                    child: SizedBox.expand(
                      child: Icon(Icons.image, color: Colors.grey[300]),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100.w,
                              height: 10.h,
                              color: Colors.grey,
                            ),
                            Container(
                              width: 50,
                              height: 10,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              width: 80.w,
                              height: 10.h,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 40.w,
                              height: 10.h,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 120.w,
                          height: 10.h,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 70.w,
                          height: 10.h,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8),
              width: 323.w,
              height: 48.5.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 5),
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 10.h,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 30.w,
                        height: 10.h,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Container(
                    width: 64.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}