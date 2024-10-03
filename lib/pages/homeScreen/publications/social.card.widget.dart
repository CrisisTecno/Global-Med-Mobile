import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:global_med/state/provider/globalmed.user.provider.dart';
import 'package:global_med/themes/themes.dart';
import 'package:global_med/utils/utils.dart';
import 'package:provider/provider.dart';

class SocialCard extends StatefulWidget {
  final String name;
  final String ocupation;
  final String userId;
  final String content;
  final String imageProfile;
  final List<String> imagesUrl;
  final List<String> topics;

  const SocialCard(
      {super.key,
      required this.name,
      required this.ocupation,
      required this.content,
      required this.imagesUrl,
      required this.topics,
      required this.imageProfile,
      required this.userId});
  @override
  _SocialCardState createState() => _SocialCardState();
}

class _SocialCardState extends State<SocialCard> {
  bool isFavorite = false;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final userProvider =
        Provider.of<GlobalMedProviderUser>(context, listen: false);

    Size screensize = MediaQuery.of(context).size;
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 15.h, right: 15.h, top: 15.h, bottom: 5.h),
            child: GestureDetector(
              onTap: () {
                userProvider.setPersonData(widget.userId);
                Navigator.of(context).pushNamed(RouteManager.homeScreen);
              },
              child: Row(
                children: [
                  CircleAvatar(
                    maxRadius: 25.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25.h)),
                      child: FadeInImage.assetNetwork(
                          placeholder: 'public/assets/loadings/lo3.gif',
                          image: widget.imageProfile),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.h,
                              color: primary),
                        ),
                        Text(
                          widget.ocupation,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 15.h),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      // GestureDetector(
                      //   onTap: () {
                      //     setState(() {
                      //       isFavorite = !isFavorite;
                      //     });
                      //   },
                      //   child: Container(
                      //     height: 40.h,
                      //     width: 40.h,
                      //     padding: EdgeInsets.all(5.h),
                      //     child: SvgPicture.asset(isFavorite
                      //         ? 'public/assets/icons/start_green.svg'
                      //         : 'public/assets/icons/start_grey.svg'), // Ajusta la ruta según tu proyecto
                      //     decoration: BoxDecoration(
                      //       color: Colors.transparent,
                      //       borderRadius: BorderRadius.all(Radius.circular(20.h)),
                      //     ),
                      //   ),
                      // ),
                      // GestureDetector(
                      //   onTap: () {},
                      //   child: Container(
                      //     height: 40.h,
                      //     width: 40.h,
                      //     padding: EdgeInsets.all(5.h),
                      //     child: SvgPicture.asset(
                      //         'public/assets/icons/options.svg'), // Ajusta la ruta según tu proyecto
                      //     decoration: BoxDecoration(
                      //       color: Colors.transparent,
                      //       borderRadius: BorderRadius.all(Radius.circular(20.h)),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.content,
                ),
                Wrap(
                  spacing: 5.h,
                  runSpacing: 1.h,
                  children: List<Widget>.from(
                      (widget.topics as List<String>).map((topic) {
                    // print("topics" + topic);
                    // return CustomTag(label: '#' + topic.toString());
                    return Text(
                      '#' + topic.toString(),
                      style: TextStyle(
                          color: Colors.blue.withOpacity(1), fontSize: 12),
                    );
                  })),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: FadeInImage.assetNetwork(
                      fit: BoxFit.fill,
                      placeholder: 'public/assets/loadings/lo3.gif',
                      image: widget.imagesUrl[0]),
                ),
                width: screensize.width,
                height: screensize.height * 0.25,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.h),
            child: Row(
              children: <Widget>[
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
                  color: isLiked ? primary : Colors.black.withOpacity(0.3),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
                Text('210'),
                IconButton(
                  icon: Icon(Icons.mode_comment_outlined),
                  color: Colors.black.withOpacity(0.3),
                  onPressed: () {},
                ),
                Text('2'),
                IconButton(
                  icon: Icon(Icons.reply),
                  color: Colors.black.withOpacity(0.3),
                  onPressed: () {},
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
