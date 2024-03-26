import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naffith/presentation/screens/order_steps/logic/create_order/create_order_cubit.dart';
import 'package:naffith/presentation/screens/order_steps/widgets/create_order_bloc_listener.dart';

import '../../../common/values/colors.dart';

class OrderPage extends StatefulWidget {
String id;
   OrderPage({super.key, required this.id});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 40.h),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 30.h,
                          color: AppColors.primaryBackground,
                        )),
                    Container(
                      margin: EdgeInsets.only(right: 70.h, left: 70.h),
                      child: Text(
                        'عملية متابعة الطلب',
                        style: GoogleFonts.almarai(
                            textStyle: const TextStyle(
                          color: AppColors.primaryBackground,
                          letterSpacing: 0,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
          ),
            Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.only(
                        //bottom: 70.h  ,
                        top: 166.h),
                    child: Text(
                      'لظهور بيانات المعلن يجب الموافقة على\n سرية حفظ وعدم نشر معلوماتة للغير  ',
                      style: GoogleFonts.almarai(
                          textStyle: TextStyle(
                        color: AppColors.primaryBackground,
                        letterSpacing: 0,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                      )),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          //fillColor:MaterialStateProperty.all<Color>(Color.fromRGBO(23, 56, 61, 1)),
                          activeColor: const Color.fromRGBO(23, 56, 61, 1),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          'التعهد بصحة البيانات  ',
                          style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                              color: const Color.fromRGBO(23, 56, 61, 0.5),
                              letterSpacing: 0,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(25.0),
                                      topRight: const Radius.circular(25.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 150.w,
                                            ),
                                            Center(
                                              child: Text(
                                                'التعهد',
                                                style: GoogleFonts
                                                    .almarai(
                                                  textStyle:
                                                  TextStyle(
                                                    color: AppColors
                                                        .primaryBackground,
                                                    letterSpacing: 0,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 92.9.h,
                                            ),
                                            Row(mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context);
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down,
                                                    size: 30.h,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 323.w,
                                        height: 542.h,
                                        child: TextFormField(


                                          maxLines: null,

                                          // controller: _textEditingController,

                                          initialValue: "نص التعهد يعتمد على طبيعة الاتفاق والظروف الخاصة، وقد يكون مختلفًا حسب الغرض والقانون المعمول به في المنطقة المعنية. لكن يمكنني تقديم نص قاعدى للتعهد بشكل عام، ويمكنك تخصيصه حسب احتياجاتك وظروفك الخاصة. يجب عليك الرجوع إلى محامٍ أو مستشار قانوني لضمان أن النص يلبي جميع الاحتياجات القانونية.نص التعهدأنا، [اسم الشخص الملتزم]، المقيم في [عنوان السكن]، أتعهد بموجب هذا التعهد بالالتزام بجميع الالتزامات والشروط المتفق عليها فيما يخص [وصف الالتزام] بتاريخ [تاريخ الاتفاق].أتعهد بأداء واجباتي وفقًا للاتفاق الذي تم التوصل إليه بيني وبين [اسم الطرف الآخر أو الجهة المستفيدة]، والتي تشمل [تحديد الواجبات والالتزامات بمزيد من التفصيل إذا لزم الأمر]أتعهد بأن ألتزم بمواعيد التسليم والأداء المتفق عليها، وأن أقدم الخدمات أو المنتجات بجودة عالية وفقًا للمعايير المتفق عليها.أقر بأن أي انتهاك لهذا التعهد قد يؤدي إلى عواقب قانونية ومالية، وأتحمل المسؤولية الكاملة عن أي تبعات تنجم عن عدم الامتثال للالتزامات المذكورة.",
                                          readOnly: true,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          style: GoogleFonts.almarai(
                                            textStyle: TextStyle(
                                              color: AppColors.primaryBackground,
                                              letterSpacing: 0,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )));
                        },
                        child: Text(
                          'قراءة التعهد',
                          style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                              color: AppColors.primaryBackground,
                              letterSpacing: 0,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 60.h, left: 60.w, right: 60.w, bottom: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: isChecked,
                        child: GestureDetector(
                          onTap: () {
                         context.read<CreateOrderCubit>().emitCreateOrderStates(widget.id);
                          },
                          child: Container(
                            width: 113.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(23, 56, 61, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.w)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 1))
                                ]),
                            child: Center(
                              child: Text(
                                'الموافقة',
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 113.w,
                          height: 42.h,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(144, 117, 60, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.w)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 1))
                              ]),
                          child: Center(
                            child: Text(
                              'إلغاء',
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
                    ],
                  ),
                ),
                CreateOrderBlocListener(),
              ],
            ),
        ]),
      ),
    );
  }
}
