import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/common/values/colors.dart';
import 'package:naffith/presentation/screens/home_page/logic/favorites/add_favorites_cubit.dart';

import '../data/models/one_real_estate_response.dart';


class ImageCarouselSlider extends StatefulWidget {
List<Images> images;
String id;
ImageCarouselSlider({required this.images, required this.id});
  @override
  _ImageCarouselSliderState createState() => _ImageCarouselSliderState();
}

class _ImageCarouselSliderState extends State<ImageCarouselSlider> {
 late List<Images> image;
 late List<String> _images;
  @override
  void initState() {
    image = widget.images.map((item) => Images(url: item.url))
        .toList();
    _images = image.map((item) => (item.url!)).toList();
  }
  final CarouselController _carouselController = CarouselController();


  int _currentIndex = 0;
  bool isFavorited = false; // Initially set to false

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
             Stack(
                children: [
                  CarouselSlider(
                    carouselController: _carouselController,
                    items: (_images != null && _images.isNotEmpty)
                        ? _images.map((image) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 370.h, // Adjust height as needed
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child; // Loaded successfully
                            return Image.asset(
                              'assets/images/placeholder.png',
                              fit: BoxFit.cover,
                            ); // Show placeholder while loading
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/errorload.png',
                              fit: BoxFit.cover,
                            ); // Show error image
                          },
                        ),
                      );
                    }).toList()
                        : [
                      Image.asset(
                        'assets/images/placeholder.png',
                        fit: BoxFit.cover,
                      )
                    ], // Use a placeholder image if _images is null or empty
                    options: CarouselOptions(
                      height: 420.h, // Match the height of the SizedBox
                      viewportFraction: 1.0, // Each item occupies the entire viewport horizontally
                      initialPage: 0,
                      enableInfiniteScroll:
                      (_images != null && _images.length > 1), // Check if there's more than one image
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(milliseconds: 300),
                      pageSnapping: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),


                  Positioned(
                    top: 344.h,
                    left: 160.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _images.asMap().entries.map((entry) {
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == entry.key
                                ? const Color.fromRGBO(23, 56, 61, 1)
                              : const Color.fromRGBO(255, 255, 255, 0.7),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Positioned(
                    top: 17.h,
                    left: 16.h,
                    child: Container(
                      width: 40, // Adjust width as needed
                      height: 40, // Adjust height as needed
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(196, 196, 196, 0.44),// Set your desired color
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            debugPrint(isFavorited.toString());
                            setState(() {
                              isFavorited = !isFavorited;
                            });
                            context.read<AddFavoritesCubit>().emitAddFavoritesStates(id: widget.id);
                          },
                          icon: Icon(
                            isFavorited ? Icons.favorite
                                : Icons.favorite_border,
                            color:isFavorited ? Colors.red : Colors.white,
                          ),
                        ),
                      ),
                    ),),
                  Positioned(
                    top: 17.h,
                    left: 321.w,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon( Icons.arrow_back_ios,
                        color: AppColors.primaryBackground,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25.h,
                    left: 170.w,
                    child: Text(
                      "${_currentIndex + 1}/${_images.length}",
                      style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                            color: AppColors.primaryBackground,
                            letterSpacing: 0,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ),
                ],
              ),

          ],
        ),
      ),
    );
  }
}
