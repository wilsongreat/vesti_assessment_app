import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vesti_assessment_app/config/app_colors.dart';
import 'package:vesti_assessment_app/data/app_assets.dart';
import 'package:vesti_assessment_app/presentation/components/shared/custom_btn.dart';
import 'package:vesti_assessment_app/presentation/components/shared/custom_text.dart';
import 'package:vesti_assessment_app/utils/constants.dart';
import 'package:vesti_assessment_app/utils/screen_utils.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;

  final List<OnboardPageData> _pages = [
    OnboardPageData(
      image: 'assets/images/bg1.jpg',
      title: 'Enjoy the Best Features',
      subtitle: 'Experience the magic of requesting for books anytime,anywhere',
    ),
    OnboardPageData(
      image: 'assets/images/bg2.jpg',
      title: 'Fast and Reliable',
      subtitle: 'Get your books quickly and without hassle,on any device.',
    ),
    OnboardPageData(
      image: 'assets/images/bg3.jpg',
      title: 'Always Accessible',
      subtitle: 'Your bookshelf in your pocket,whenever you need it.',
    ),
  ];

  final List<String> _imagePaths = [
    AppAssets.onboardImg1,
    AppAssets.onboardImg2,
  ];

  late String _image1;
  late String _image2;
  bool _showFirst = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _image1 = _imagePaths[0];
    _image2 = _imagePaths[1 % _imagePaths.length];

    _startImageCycle();
    _startAutoScroll();
  }

  int _currentIndex = 0;
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentPage < _pages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _startImageCycle() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _showFirst = !_showFirst;

        _currentIndex = (_currentIndex + 1) % _imagePaths.length;
        int nextIndex = (_currentIndex + 1) % _imagePaths.length;

        // Prepare the image for the next layer
        if (_showFirst) {
          _image1 = _imagePaths[_currentIndex];
          _image2 = _imagePaths[nextIndex];
        } else {
          _image2 = _imagePaths[_currentIndex];
          _image1 = _imagePaths[nextIndex];
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Prevent flicker
      body: Stack(
        children: [
          _buildImage(_image1, _showFirst),
          _buildImage(_image2, !_showFirst),

          SizedBox(
            height: fullHeight(context),
            width: fullWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      AppAssets.logoWhite,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: fullHeight(context) * .13,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemCount: _pages.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: _pages[index].title,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.kWhite,
                                  height: 1.2,
                                ),
                                TextView(
                                  text: _pages[index].subtitle,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kWhite,
                                  height: 1.2,
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              _pages.length,
                                  (index) => _buildDot(index == _currentPage),
                            ),
                          ),
                          CustomAppButton(
                            voidCallback: (){
                              context.pushNamed(Constants.getStarted);
                            },
                            title: 'Get Started',
                            isActive: true,
                            width: fullWidth(context) * .32,
                          )
                        ],
                      ),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
  Widget _buildImage(String imagePath, bool visible) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 700),
      opacity: visible ? 1.0 : 0.0,
      curve: Curves.easeInOut,
      child: SizedBox.expand(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      margin: const EdgeInsets.only(right: 8),
      width:  12 ,
      height:  12 ,
      decoration: BoxDecoration(
        color: isActive ?  AppColors.kBlue : Colors.transparent,
        border: Border.all(color: isActive ?  AppColors.kBlue : AppColors.kWhite, width: 2),
        shape: BoxShape.circle,
      ),
    );
  }

}






class OnboardPageData {
  final String image;
  final String title;
  final String subtitle;

  OnboardPageData({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
