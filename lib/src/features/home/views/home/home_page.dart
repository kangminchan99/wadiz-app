import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:wabiz/src/core/theme/theme.dart';
import 'package:wabiz/src/features/home/view_model/home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final numberFormatter = NumberFormat('###,###,###,###');
  final ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.maxScrollExtent > 0) {
      setState(() {
        _scrollProgress =
            (_scrollController.offset /
                    _scrollController.position.maxScrollExtent)
                .clamp(0.0, 1.0);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              height: 324,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              onTap: () {},
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: AppColors.wabizGray[100]!,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                hintText: '새로운 일상이 필요하신가요?',
                                suffixIcon: const Icon(Icons.search),
                                suffixIconColor: AppColors.wabizGray[400],
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notifications_none),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final categories = ref.watch(
                            fetchHomeCategoriesProvider,
                          );
                          return switch (categories) {
                            AsyncData(:final value) => GridView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 0,
                                  ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 38,
                                        backgroundColor: AppColors.bg,
                                        child: Image.asset(
                                          value[index].iconPath ?? "",
                                          height: 42,
                                          width: 42,
                                        ),
                                      ),
                                      Gap(4),
                                      Text(value[index].title ?? ""),
                                    ],
                                  ),
                                );
                              },
                              itemCount: value.length,
                            ),
                            AsyncError(:final error) => Text('Error: $error'),
                            _ => Center(child: CircularProgressIndicator()),
                          };
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    height: 4,
                    child: Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppColors.bg,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Positioned(
                          left: _scrollProgress * 40,
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(12),
                ],
              ),
            ),
            Gap(12),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  // final projects = ref
                  //     .watch(homeViewModelProvider.notifier)
                  //     .fetchHomeData();
                  final homeData = ref.watch(fetchHomeProjectsProvider);
                  return homeData.when(
                    data: (data) {
                      if (data.projects.isEmpty) {
                        return Column(
                          children: [
                            Text('No projects found'),
                            TextButton(onPressed: () {}, child: Text('새로고침')),
                          ],
                        );
                      }
                      return Container(
                        color: AppColors.white,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final project = data.projects[index];
                            return InkWell(
                              child: Container(
                                margin: const EdgeInsets.only(
                                  bottom: 8,
                                  left: 16,
                                  right: 16,
                                  top: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 8),
                                      color: Colors.black.withValues(alpha: .1),
                                      blurRadius: 30,
                                      spreadRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 220,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            project.thumbnail ?? '',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            project.isOpen == 'close'
                                                ? "${numberFormatter.format(project.waitlistCount)} 명이 기다려요"
                                                : "${numberFormatter.format(project.totalFundedCount)} 명이 인증했어요",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Gap(8),
                                          Text('${project.title}'),
                                          Gap(16),
                                          Text(
                                            '${project.owner}',
                                            style: TextStyle(
                                              color: AppColors.wabizGray[500],
                                            ),
                                          ),
                                          Gap(16),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.bg,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            child: Text(
                                              project.isOpen == 'close'
                                                  ? "오픈예정"
                                                  : "바로구매",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: 10,
                        ),
                      );
                    },
                    error: (error, stackTrace) {
                      return Text('Error: $error');
                    },
                    loading: () => Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
