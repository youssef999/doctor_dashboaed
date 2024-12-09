import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/core/const/strings.dart';
import 'package:doctor/core/resources/app_colors.dart';
import 'package:doctor/features/splash/intro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  var currentPage = 0.obs;
  final box = GetStorage();
  @override
  void initState() {
    box.write('isOpen', true);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('onBoarding').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            // Make sure the docs list is not empty
            if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No data available'));
            }
            // Get the first document snapshot
            var firstDoc = snapshot.data!.docs.first;
            var secondDoc = snapshot.data!.docs[1];
            var thirdDoc = snapshot.data!.docs[2];

            return Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.off(IntroView()),
                      child: Container(
                        width: 60,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(right: 10,left: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,color: const Color.fromARGB(255, 220, 220, 220)),
                          borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'تخطي',
                            style: GoogleFonts.cairo(
                              color: AppColors.primaryBGLightColor,
                                fontSize: 10, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 430,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        currentPage.value = page;
                      });
                    },
                    children: [
                     
                      buildPage(
                        image: 'assets/images/intro1.jpeg',
                        // image: firstDoc['image'],
                        title: firstDoc['title'],
                        subtitle: firstDoc['subtitle'],
                      ),
                      buildPage(
                        image: 'assets/images/intro2.png',
                        //  image: secondDoc['image'],
                        title: secondDoc['title'],
                        subtitle: secondDoc['subtitle'],
                      ),
                      buildPage(
                        image: 'assets/images/intro3.jpeg',
                        //  image: thirdDoc['image'],
                        title: thirdDoc['title'],
                        subtitle: thirdDoc['subtitle'],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //  crossAxisAlignment: CrossAxisAlignment.end,
                  children:
                      List.generate(3, (index) => buildDot(index, context)),
                ),
                SizedBox(
                  height: 20,
                ),
                buildSubtitle(context),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                       MaterialButton(
                              color: AppColors.primaryBGLightColor,
                              minWidth: .9 * mediawidth(context),
                              height: 45,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: () {
                                if (currentPage.value < 2) {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                } else {
                                  Get.off(IntroView());
                                }
                              },
                              child: Text(
                                "التالي",
                                style: GoogleFonts.cairo(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ))
                         
                    
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget buildPage(
      {
      //required String image,
      required String title,
      required String subtitle,required String image}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            image,
            width: double.infinity,
            height: 400, // Fixed height to ensure all images have the same size
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentPage.value == index ? 20 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage.value == index
            ? AppColors.primaryBGLightColor
            : Colors.grey,
      ),
    );
  }

  Widget buildSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          currentPage.value == 0
              ? Text(
                  'احصل عل رعاية صحية في منزلك',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.w700),
                )
              : const SizedBox(),
          currentPage.value == 0
              ? const SizedBox(
                  height: 30,
                )
              : const SizedBox(),
          currentPage.value == 0
              ? Text(
                  'احصل على الرعاية التي تحتاجها من راحة منزلك بميزة زيارتنا الافتراضية.',
                     textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      fontSize: 16,
                      color: const Color.fromRGBO(144, 144, 144, 1)),
                )
              : const SizedBox(),
          currentPage.value == 1
              ? Text(
                  'تبسيط الرعاية الصحية الخاصة بك',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.w700),
                )
              : const SizedBox(),
          currentPage.value == 1
              ? const SizedBox(
                  height: 30,
                )
              : const SizedBox(),
          currentPage.value == 1
              ? Text(
                  'حجز المواعيد ، وتتبع تاريخك الطبي ، والتواصل مع طبيبك في تطبيق واحد مناسب.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      fontSize: 16,
                      color: const Color.fromRGBO(144, 144, 144, 1)),
                )
              : const SizedBox(),
          currentPage.value == 2
              ? Text(
                  'ابحث عن مزودك المثالي',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.w700),
                )
              : const SizedBox(),
          currentPage.value == 2
              ? const SizedBox(
                  height: 30,
                )
              : const SizedBox(),
          currentPage.value == 2
              ? Text(
                  'اكتشف أخصائي الرعاية الصحية المناسبة لتلبية احتياجاتك من خلال وظيفة البحث التي سهلة الاستخدام.',
                     textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      fontSize: 16,
                      color: const Color.fromRGBO(144, 144, 144, 1)),
                )
              : const SizedBox(),
        
        ],
      ),
    );
  }
}
