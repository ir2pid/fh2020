import 'package:Officerr/src/models/comment.dart';
import 'package:Officerr/src/models/post.dart';
import 'package:flutter/cupertino.dart';

class PostProvider extends ChangeNotifier {
  // mock data for posts, replace this when having upload and fetch mechanism
  List<Post> _posts = [
    Post(
      id: 1,
      name: 'Police officer saved the day',
      description:
          'Dramatic bodycam footage has captured a South Carolina deputy saving the life of a newborn baby during a traffic stop. Deputy William Kimbro, of the Berkeley County Sheriff\'s Office, says he was on patrol on June 11 in Summerville when he stopped a car that was speeding. One of the passengers told Kimbro that they were rushing a 12-day-old infant named Ryleigh to the hospital because she had stopped breathing after drinking a bottle. That\'s when the deputy jumped into action and started performing first aid to get the baby breathing again. ',
      rating: 5,
      comments: [
        Comment(
          1,
          'Fantastic hero',
          DateTime.now().toIso8601String(),
        )
      ],
      pictureUrl:
          'https://www.mtlblog.com/uploads/230764a357f1c14a940f69753ed40b4ee07a39a6.png_facebook.png',
    ),
    Post(
      id: 2,
      name: 'Man arrested after two men stabbed in Hackney',
      description:
          'A man has been arrested after two men suffered knife injuries in Hackney. Police were called at 23.24hrs on 27 June to reports of the incident near Clapton Common, E5. Officers and London Ambulance Service attended the scene where they found two men, both aged in their 20s, suffering from injuries. They have been taken to hospital, where the condition of both has been assessed as neither life-threatening nor life-changing.s',
      comments: [
        Comment(
          1,
          'No word to say',
          DateTime.now().toIso8601String(),
        )
      ],
      pictureUrl:
          'https://resources.mynewsdesk.com/image/upload/c_limit,dpr_1.0,f_auto,h_700,q_auto,w_670/mw6pi4vc3xnxhbfzxuzs.jpg',
    ),
    Post(
      id: 3,
      name:
          'George Floyd: What we know about the officers charged over his death',
      description:
          'The officers - Derek Chauvin, J Alexander Kueng, Thomas Lane and Tou Thao - arrested Mr Floyd for an alleged fake \$20 (17.5 euros; £16) bill. Mr Floyd, an unarmed black man, died in custody on 25 May. White officer Mr Chauvin was filmed pressing his knee on Mr Floyd\'s neck for almost nine minutes before he died. Mr Kueng and Mr Lane, two trainee officers, were days into the job when the incident happened.',
      comments: [
        Comment(
          1,
          'Cannot believe it',
          DateTime.now().toIso8601String(),
        )
      ],
      pictureUrl:
          'https://www.thesun.co.uk/wp-content/uploads/2020/05/Minneapolis_Police_Death_12149jpg-8d235jpg-JS585353491.jpg',
    ),
    Post(
      id: 4,
      name:
          'Police officer stabbed in Glasgow says his colleagues saved lives',
      description: 'The policeman injured in a knife attack at a Glasgow hotel has thanked his colleagues for saving lives. Constable David Whyte, 42, was one of six people injured during the incident at the Park Inn hotel on Friday, in which a male suspect was shot and killed by police. Three of the other people who were injured are asylum seekers, Police Scotland said, while two are members of staff. All remain in hospital, one in a critical but stable condition, the others in a stable condition.',
      comments: [
        Comment(
          1,
          'Cannot believe it',
          DateTime.now().toIso8601String(),
        )
      ],
      pictureUrl:
          'https://i.guim.co.uk/img/media/de734418e5fe172c1bbcb941c996635433a55942/0_233_3500_2100/master/3500.jpg?width=620&quality=85&auto=format&fit=max&s=f2d959c1a42cacbfd514aa9313f25d69',
    ),
  ];

  List<Post> get posts {
    return _posts;
  }

  void addPost(Post post) {
    _posts.add(post);
    notifyListeners();
  }
}
