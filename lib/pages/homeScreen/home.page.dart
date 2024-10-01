import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_med/pages/homeScreen/agend.body.dart';
import 'package:global_med/pages/homeScreen/favorites.body.dart';
import 'package:global_med/pages/homeScreen/home.body.dart';
import 'package:global_med/pages/homeScreen/pharmacy.body.dart';
import 'package:global_med/themes/themes.dart';
import 'package:global_med/utils/Size/sizer.dart';
import 'package:global_med/utils/routes/routes.dart';
import 'package:global_med/widgets/nav_bar.dart';

import '../../../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  bool isFabVisible = true;

  OverlayEntry? overlayEntry;
  final List<Widget> _screens = [
    HomePart(),
    PharmacyPart(),
    FavoritesPart(),
    AgendPart(),
  ];

  void showOverlay(BuildContext context) {
    overlayEntry = OverlayEntry(
      builder: (context) => Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0.2),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: 20.h),
                height: 150.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildOptionButton(
                            'public/assets/icons/publication.svg',
                            'Publicación', () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.doctorScreen);
                        }),
                        // _buildOptionButton(
                        //     'public/assets/icons/coruse.svg', 'Curso', () {}),
                        // _buildOptionButton('public/assets/icons/meeting.svg',
                        //     'Meeting', () {}),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),

        //       // floatingActionButton: Container(
        //       //   color: Colors.white,
        //       //   width: double.infinity,
        //       //   child: Row(
        //       //     children: [
        //       //       Spacer(
        //       //         flex: 1,
        //       //       ),
        //       //       FloatingActionButton(
        //       //         heroTag: 1,
        //       //         elevation: 0.0,
        //       //         backgroundColor: primary,
        //       //         shape: CircleBorder(),
        //       //         child:
        //       //             Icon(Icons.close_rounded, color: Colors.white, size: 35.h),
        //       //         onPressed: () {
        //       //           hideOverlay();
        //       //         },
        //       //       ),
        //       //       Spacer(
        //       //         flex: 1,
        //       //       ),
        //       //     ],
        //       //   ),
        //       // ),
        floatingActionButton: FloatingActionButton(
          heroTag: 1,
          elevation: 0.0,
          backgroundColor: tree,
          shape: CircleBorder(),
          child: Icon(Icons.close_rounded, color: Colors.white, size: 35.h),
          onPressed: () {
            hideOverlay();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyBottomAppBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _NoneTapped,
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry!);
    setState(() {
      isFabVisible = false;
    });
  }

  void hideOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
    setState(() {
      isFabVisible = true;
    });
  }

  Widget _buildOptionButton(String svgPath, String title, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          hideOverlay();
          onTap();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.h),
              // padding: EdgeInsets.only(left: 15.h,right: 15.h,top: 5.h),

              decoration: BoxDecoration(
                  color: Color(0xffF8F9FF).withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xffD9D9D9), width: 2.h)),
              child: SvgPicture.asset(
                svgPath,
                width: 30.h,
                height: 30.h,
              ),
            ),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          child: _screens.elementAt(_selectedIndex),
        ),
        floatingActionButton: isFabVisible
            ? FloatingActionButton(
                heroTag: 1,
                backgroundColor: tree,
                shape: CircleBorder(),
                child: Icon(Icons.add, color: Colors.white, size: 35.h),
                onPressed: () {
                  if (overlayEntry == null) {
                    showOverlay(context);
                  } else {
                    hideOverlay();
                  }
                },
                elevation: 0.0,
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: isFabVisible
            ? MyBottomAppBar(
                selectedIndex: _selectedIndex,
                onItemTapped: _onItemTapped,
              )
            : null,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _NoneTapped(int index) {}
}
