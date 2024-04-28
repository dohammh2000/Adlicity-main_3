import 'package:adlicity/core/utils/assets_manager.dart';
import 'package:adlicity/core/utils/constants.dart';
import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:adlicity/core/widgets/main_button.dart';
import 'package:adlicity/core/widgets/profile_item.dart';
import 'package:adlicity/features/profile/presentation/widgets/profile_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/profile_info_section.dart';
import '../widgets/profile_portfolio_section.dart';
import '../widgets/profile_statistics_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.profileImage, required this.profileInfo, required this.tiktokFollowers, required this.facebookFollowers, required this.twitterFollowers, required this.youTubeFollowers, required this.instagramFollowers, required this.profileName, required this.profileRate});

    final String profileImage;
  final String profileInfo;
  final String tiktokFollowers;
  final String facebookFollowers;
  final String twitterFollowers;
  final String youTubeFollowers;
  final String instagramFollowers;
  final String profileName;
  final double profileRate;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3,
        vsync:
            this); // Change the length according to the number of tabs you want

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileBody(isScrolling: _isScrolling, scrollController: _scrollController, tabController: _tabController, facebookFollowers: widget.facebookFollowers,
        instagramFollowers: widget.instagramFollowers,
        profileImage: widget.profileImage,
        profileInfo: widget.profileInfo,
        profileName: widget.profileName,
        profileRate: widget.profileRate,
        tiktokFollowers: widget.tiktokFollowers,
        twitterFollowers: widget.twitterFollowers,
        youTubeFollowers: widget.youTubeFollowers,)
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset > 0 ) {
      // User started scrolling
      setState(() {
        _isScrolling = true;
      });
    } else {
      // User stopped scrolling
      setState(() {
        _isScrolling = false;
      });
    }
  }
}
