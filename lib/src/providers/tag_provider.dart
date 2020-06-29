import 'package:Officerr/src/models/comment.dart';
import 'package:Officerr/src/models/tags.dart';
import 'package:flutter/cupertino.dart';

class TagProvider extends ChangeNotifier {
  static var hashtagList = [
    "#BLM",
    "#justice",
    "#racism",
    "#love",
    "#blackouttuesday",
    "#together",
    "#blacklivesmatter",
    "#icantbreathe",
  ];
  static var urlList = [
    "https://www.hna.de/bilder/2020/06/07/13790156/2024941232-demonstration-in-goettingen-rassen-diskriminierung-gibt-es-nach-meinung-teilnehmer-auch-in-deutschland-daran-liessen-redner-2oMA5M6Fe9.jpg",
    "https://www.rtl.de/resizer/1fLyrUHmnyWuZ0V7kfd7CT9JKSs=/1200x0/smart/cloudfront-eu-central-1.images.arcpublishing.com/rtl/Q2QAN3PLWTBE53RSX4DVJJXHME.jpg",
    "https://rp-online.de/imgs/32/8/4/8/4/7/4/5/3/tok_7304fd0d7bc23f868686f6fbe7884bae/w1900_h1191_x1500_y940_DPA_bfunk_dpa_5FA19200F9B967D0-02d53d344cff8d84.jpg",
    "https://i2.wp.com/transitpolice.ca/wp-content/uploads/2016/05/Chung-and-homeless-man-higher-res.jpg?w=750",
    "https://cdn.bigfm.de/sites/default/files/styles/wide/public/scald/image/Black-Out-Tuesday-.png?itok=8ZjLlvUZ",
    "https://wehco.media.clients.ellingtoncms.com/img/photos/2016/07/11/resized_99261-nlr-cop-norman2_79-21489.JPG",
    "https://m.faz.net/media1/ppmedia/aktuell/2115416871/1.6804059/mmobject-still_full/tausende-protestieren-abermals.jpg",
    "https://d279m997dpfwgl.cloudfront.net/wp/2020/06/GettyImages-1218051968-1000x667.jpg",
  ];
  // mock data for posts, replace this when having upload and fetch mechanism
  List<Tag> _tags = [
    Tag(id: 0, tag: hashtagList[0], thumbnailUrl: urlList[0]),
    Tag(id: 1, tag: hashtagList[1], thumbnailUrl: urlList[1]),
    Tag(id: 2, tag: hashtagList[2], thumbnailUrl: urlList[2]),
    Tag(id: 3, tag: hashtagList[3], thumbnailUrl: urlList[3]),
    Tag(id: 4, tag: hashtagList[4], thumbnailUrl: urlList[4]),
    Tag(id: 5, tag: hashtagList[5], thumbnailUrl: urlList[5]),
    Tag(id: 6, tag: hashtagList[6], thumbnailUrl: urlList[6]),
    Tag(id: 7, tag: hashtagList[7], thumbnailUrl: urlList[7]),
  ];

  List<Tag> get posts {
    return _tags;
  }
}
