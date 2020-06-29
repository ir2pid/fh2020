import 'package:Officerr/src/models/post.dart';
import 'package:Officerr/src/providers/post_provider.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: Theme.of(context).textTheme.headline6),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: _UserInfoSection(),
          ),
          _SocialInfoSection(),
          _PostsSection(),
        ],
      ),
    );
  }
}

class _UserInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _CircularImage(imageUrl: 'https://avatars2.githubusercontent.com/u/33294549?s=460&u=c832597c58517e4eb4ad1df0c5c98b0998a973af&v=4'),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Pedro Massango', style: Theme.of(context).textTheme.headline6),
              Text('pedromassango', style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
        ),
      ],
    );
  }
}

class _SocialInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12.withOpacity(0.1),
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _SocialInfoItem(title: '58', subtitle: 'posts'),
          _SocialInfoItem(title: '120k', subtitle: 'followers'),
          _SocialInfoItem(title: '80', subtitle: 'following'),
        ],
      ),
    );
  }
}

class _SocialInfoItem extends StatelessWidget {
  final String title, subtitle;

  const _SocialInfoItem({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.subtitle2),
        Text(subtitle, style: Theme.of(context).textTheme.subtitle1),
      ],
    );
  }
}

class _CircularImage extends StatelessWidget {
  final String  imageUrl;

  const _CircularImage({Key key, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.network(imageUrl,
        width: 60,
        height: 60,
        alignment: Alignment.center,
        fit: BoxFit.fill,
      ),
    );
  }
}

class _PostsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postsProvider = PostProvider();

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 1.3;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text('Posts', style: Theme.of(context).textTheme.headline6),
          ),
          SizedBox(
            width: size.width,
            height: size.height * .53,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: postsProvider.posts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // TODO: Navigate to Post details page
                  },
                  child: PostListItem(post: postsProvider.posts.elementAt(index)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PostListItem extends StatelessWidget {
  final Post post;
  const PostListItem({this.post});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.network(post.pictureUrl, fit: BoxFit.cover),
    );
  }
}
