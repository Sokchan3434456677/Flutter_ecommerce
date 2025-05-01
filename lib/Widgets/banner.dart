import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Banner {
  final int id;
  final String title;
  final String description;
  final String images;
  final int userId;
  final String createdAt;
  final String updatedAt;

  Banner({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      images: json['images'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class MyBanner extends StatefulWidget {
  const MyBanner({super.key});

  @override
  State<MyBanner> createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<Banner> banners = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchBanners();
    _startAutoScroll();
  }

  Future<void> _fetchBanners() async {
    try {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/banners'),
        headers: {
          'Authorization':
              'Bearer 2|TuzjU7r606veBceqjHrd27GkBgc2oCbamD0RrUds122047b4',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['success'] == true) {
          setState(() {
            banners =
                (jsonData['data'] as List)
                    .map((item) => Banner.fromJson(item))
                    .toList();
            isLoading = false;
          });
        }
      } else {
        throw Exception('Failed to load banners');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching banners: $e');
    }
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_pageController.hasClients && banners.isNotEmpty) {
        if (_currentPage < banners.length - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                children: [
                  // Main banner with padding
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: banners.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              banners[index].images,
                              fit: BoxFit.cover,
                              loadingBuilder: (
                                context,
                                child,
                                loadingProgress,
                              ) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: Icon(Icons.error, color: Colors.red),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Page indicators
                  Positioned(
                    bottom: 12,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        banners.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index ? 12 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _currentPage == index
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
