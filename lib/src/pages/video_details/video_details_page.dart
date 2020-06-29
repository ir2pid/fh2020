import 'package:Officerr/src/models/post.dart';
import 'package:Officerr/src/models/tags.dart';
import 'package:Officerr/src/providers/post_provider.dart';
import 'package:Officerr/src/providers/tag_provider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../util.dart';
import '../../utilui.dart';
import 'single_video_page.dart';

class VideoDetailsPage extends StatefulWidget {
  static String tag = 'video-details-page';

  @override
  State<StatefulWidget> createState() {
    return _VideoDetailsPage();
  }
}

class _VideoDetailsPage extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<PostProvider>(context).posts;

    return Scaffold(
      appBar: AppBar(title: UtilUI.getTextH1(constants.scAppName, constants, util.getTheme(context).accentColor)),
      body: getBody(posts),
    );
  }

  getBody(List<Post> posts) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: constants.d24,
          ),
          Row(children: [
            SizedBox(
              width: constants.d12,
            ),
            UtilUI.getTextH1(constants.sHashtags, constants, util.getTheme(context).accentColor)
          ]),
          SizedBox(
            height: constants.d250,
            child: HashtagWidget(),
          ),
          SizedBox(width: constants.d100, child: Divider(color: util.getTheme(context).accentColor)),
          Row(children: [
            SizedBox(
              width: constants.d12,
            ),
            UtilUI.getTextH1(constants.sTrending, constants, util.getTheme(context).accentColor)
          ]),
          Column(
            children: posts.map((post) => getVTile(post)).toList(),
          ),
        ],
      ),
    );
  }

  GestureDetector getVTile(Post post) {
    return GestureDetector(
        onTap: () {
          util.navigatePush(context, SingleVideoPage.tag, {});
        },
        child: Card(
          elevation: constants.dElevation,
          margin: constants.dPadding12,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(constants.dRadius)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(constants.dRadius),
                    topRight: Radius.circular(constants.dRadius),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(post.pictureUrl),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    post.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(post.description),
                ),
              ],
            ),
          ),
        ));
  }
}

class HashtagWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(autoPlay: true, aspectRatio: 2.0, enlargeCenterPage: true, disableCenter: true, viewportFraction: constants.d04),
          items: TagProvider().posts.map(
            (e) {
              return getHTile(e);
            },
          ).toList(),
        ),
      ],
    );
  }

  Widget getHTile(Tag e) {
    return Card(
      elevation: constants.dElevation,
      margin: constants.dPadding4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(constants.dRadius)),
      child: TagListItem(tag: e),
    ); //UtilUI.i//UtilUI.getLottie(constants.animLogo));
  }
}

class TagListItem extends StatelessWidget {
  final Tag tag;
  const TagListItem({this.tag});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            SizedBox(height: constants.d12),
            UtilUI.getTextH2(tag.tag, constants, util.getTheme(context).accentColor),
            SizedBox(height: constants.d8),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(tag.thumbnailUrl, fit: BoxFit.cover),
            ),
            SizedBox(height: constants.d8),
            Visibility(child: UtilUI.getIcon(Icons.play_arrow, util.getTheme(context).primaryColor, constants.d32)),
          ],
        ),
      ],
    );
  }
}
