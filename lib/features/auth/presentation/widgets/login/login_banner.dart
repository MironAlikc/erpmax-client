// lib/features/auth/presentation/widgets/login/login_banner.dart

import 'dart:async';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:flutter/material.dart';

class LoginSlideData {
  final String image;
  final String title;
  final String sub;

  const LoginSlideData({
    required this.image,
    required this.title,
    required this.sub,
  });
}

class LoginBanner extends StatefulWidget {
  const LoginBanner({super.key});

  @override
  State<LoginBanner> createState() => _LoginBannerState();
}

class _LoginBannerState extends State<LoginBanner> {
  late final PageController _controller;
  int _currentPage = 0;
  Timer? _timer;

  final List<LoginSlideData> _slides = const [
    LoginSlideData(
      image: 'assets/images/slide-1.png',
      title: 'Fast Scanning',
      sub: 'Use mobile devices for instant tracking and efficiency.',
    ),
    LoginSlideData(
      image: 'assets/images/slide-2.png',
      title: 'Inventory Control',
      sub: 'Monitor movements in real time across all warehouses.',
    ),
    LoginSlideData(
      image: 'assets/images/slide-3.png',
      title: 'Unified Data',
      sub: 'Everything organized in one place for better decisions.',
    ),
    LoginSlideData(
      image: 'assets/images/slide-4.png',
      title: 'Secure Access',
      sub: 'Multi-factor authentication to keep your data safe.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 8), (_) {
      if (_controller.hasClients && mounted) {
        _currentPage = (_currentPage + 1) % _slides.length;
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _slides.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) => _SlideItem(data: _slides[index]),
          ),
          const Positioned(top: 50, left: 50, child: _BannerLogo()),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: _SlideIndicators(
              count: _slides.length,
              currentIndex: _currentPage,
            ),
          ),
        ],
      ),
    );
  }
}

class _SlideItem extends StatelessWidget {
  final LoginSlideData data;
  const _SlideItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(data.image, fit: BoxFit.cover)),
        const _BottomGradient(),
        Positioned(
          bottom: 120,
          left: 40,
          right: 40,
          child: _SlideContent(title: data.title, sub: data.sub),
        ),
      ],
    );
  }
}

class _SlideContent extends StatelessWidget {
  final String title;
  final String sub;
  const _SlideContent({required this.title, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.bannerTitle.copyWith(
            fontSize: 38,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          sub,
          textAlign: TextAlign.center,
          style: AppTextStyles.base.copyWith(
            color: Colors.white.withOpacity(0.9),
            fontSize: 18,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class _SlideIndicators extends StatelessWidget {
  final int count;
  final int currentIndex;
  const _SlideIndicators({required this.count, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => _Dot(isActive: index == currentIndex),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isActive;
  const _Dot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _BottomGradient extends StatelessWidget {
  const _BottomGradient();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
          ),
        ),
      ),
    );
  }
}

class _BannerLogo extends StatelessWidget {
  const _BannerLogo();

  @override
  Widget build(BuildContext context) {
    return Text(
      'ERPMax',
      style: AppTextStyles.bannerTitle.copyWith(
        fontSize: 32,
        color: Colors.white,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
