import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constant.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({@required this.image, @required this.heading, @required this.contents}) ;

final String image;
final String heading;
final String contents;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            minRadius: 40,
            backgroundImage: AssetImage(image),
          ),
            SizedBox(
              width: 50,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(heading,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800)
                  ),
                Text(
                  contents,
                  style: KtextStyle,),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 22,
                    
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Color.fromRGBO(237, 92, 21, 1),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                )
              ],
              ),
          )
        ],
      ),
    );
  }
}

