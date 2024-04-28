import 'package:adlicity/config/themes/app_colors.dart';
import 'package:adlicity/core/utils/assets_manager.dart';
import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/proposal_full_item.dart';

class MyProposalsSection extends StatelessWidget {
  const MyProposalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 20),
      itemBuilder: (context, index) => SwipeAndStopWidget(),
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemCount: 10,
    );
  }
}

class DismissibleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.horizontal,
      background: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Implement delete functionality
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Implement edit functionality
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Center(
          child: Text(
            'Swipe to Dismiss',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          // Implement dismiss action
          print('Deleted');
        } else if (direction == DismissDirection.endToStart) {
          // Implement edit action
          print('Edited');
        }
      },
    );
  }
}

class SwipeAndStopWidget extends StatefulWidget {
  @override
  _SwipeAndStopWidgetState createState() => _SwipeAndStopWidgetState();
}

class _SwipeAndStopWidgetState extends State<SwipeAndStopWidget> {
  double _xOffset = 0.0;
  double _initialXOffset = 0.0;
  bool _isSwiped = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: GestureDetector(
        onHorizontalDragStart: (details) {
          _initialXOffset = _xOffset;
          print('===================');
          print(
              'onHorizontalDragStart: $_xOffset -   $_initialXOffset - ${details.globalPosition.dx}');
          print('===================');
        },
        onHorizontalDragUpdate: (details) {
          setState(() {
            _xOffset = details.globalPosition.dx - _initialXOffset;
            print('===================');
            print(
                'onHorizontalDragUpdate: $_xOffset -   $_initialXOffset - ${details.globalPosition.dx}');
            print('===================');
          });
        },
        onHorizontalDragEnd: (details) {
          if (_xOffset < MediaQuery.of(context).size.width / 3) {
            setState(() {
              _isSwiped = true;
            });
          } else {
            setState(() {
              _isSwiped = false;
              _xOffset = 0.0;
            });
          }
        },
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: _isSwiped
                  ? -MediaQuery.of(context).size.width / 2
                  : -_xOffset,
              child: ProposalFullItem(
                category: Constants.proposalsTest[1]['category'],
                description: Constants.proposalsTest[1]['description'],
                facebookFollowers: Constants.proposalsTest[1]
                    ['facebookFollowers'],
                instagramFollowers: Constants.proposalsTest[1]
                    ['instagramFollowers'],
                price: Constants.proposalsTest[1]['price'],
                profileImage: Constants.proposalsTest[0]['profileImage'],
                profileInfo: Constants.proposalsTest[1]['profileInfo'],
                profileName: Constants.proposalsTest[1]['profileName'],
                profileRate: Constants.proposalsTest[1]['profileRate'],
                tiktokFollowers: Constants.proposalsTest[1]['tiktokFollowers'],
                title: Constants.proposalsTest[1]['title'],
                twitterFollowers: Constants.proposalsTest[1]
                    ['twitterFollowers'],
                youTubeFollowers: Constants.proposalsTest[1]
                    ['youTubeFollowers'],
              ),
            ),
            if (_isSwiped)
              Positioned(
                top: 120,
                right: context.width * 0.14,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60, // Set width equal to height for square shape
                      height: 60, // Set height equal to width for square shape
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(Constants
                            .kRoundedCorner), // Set border radius for rounded corners
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _isSwiped = false;
                            _xOffset = 0.0;
                          });
                          // Implement delete functionality
                        },
                        icon: Image.asset(
                          IconsAssets.editWhite,
                          width: 20,
                        ),
                        color: Colors.white, // Adjust the color of the icon
                        iconSize: 20, // Adjust the size of the icon
                        padding: EdgeInsets.zero, // Remove default padding
                        splashRadius: 20, // Adjust the splash radius if needed
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.02,
                    ),
                    Container(
                      width: 60, // Set width equal to height for square shape
                      height: 60, // Set height equal to width for square shape
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(Constants
                            .kRoundedCorner), // Set border radius for rounded corners
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _isSwiped = false;
                            _xOffset = 0.0;
                          });
                          // Implement delete functionality
                        },
                        icon: Image.asset(
                          IconsAssets.deleteWhite,
                          width: 20,
                        ),
                        color: Colors.white, // Adjust the color of the icon
                        iconSize: 20, // Adjust the size of the icon
                        padding: EdgeInsets.zero, // Remove default padding
                        splashRadius: 20, // Adjust the splash radius if needed
                      ),
                    )
                  ],
                ),
              ).animate().fadeIn(delay: Duration(milliseconds: 100)),
          ],
        ),
      ),
    );
  }
}
