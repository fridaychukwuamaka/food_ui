import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_ui/pages/search.dart';

import '../constant.dart';

class Food extends StatefulWidget {
  static String id = '/food';
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('images/baby.jpg')
                      )
                    ),
                  ),
                  Icon(
                    Icons.notifications,
                    size: 16
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Category',
                style: kPageHeading,
                ),
                SizedBox(
                height: 10,
              ),
                Text('Popular',
                style: KtextStyle,
                )
              ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Category(
                      name: 'Snacks',
                      url: 'images/roberto-carlos-roman-AC6IAIhP4Yk-unsplash.jpg',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Category(
                      name: 'Pizza',
                      url: 'images/thomas-tucker-MNtag_eXMKw-unsplash.jpg',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Category(
                      name: 'Desert',
                      url: 'images/joseph-gonzalez-fdlZBWIP0aM-unsplash.jpg',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Category(
                      name: 'Main course',
                      url: 'images/joseph-gonzalez-zcUgjyqEwe8-unsplash.jpg',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(30),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17)
                ),
                child: Container(
                  height: 90,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          image: DecorationImage(
                            image: AssetImage('images/julien-pianetti-qIPRTMulc-g-unsplash.jpg'),
                            fit: BoxFit.cover
                        )
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  Text('De pescado',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800)
                    ),
                  Text(
                    'Three soft corn tacos of achiote rubbed mahi',
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
                      ),
         
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 5, offset: Offset(0, 3))
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: Color.fromRGBO(237, 92, 21, 1),
          unselectedItemColor: Colors.black,
          elevation: 0,
          selectedIconTheme: IconThemeData(size: 30),
          onTap: (val) {
            setState(() {
              currentIndex = val;
            });
            if (val == 2) {
              Navigator.pushNamed(context, Search.id);
            }
          },
          currentIndex: currentIndex,
          showSelectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.fastfood,
                ),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.location_on,
                ),
                title: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    this.url, this.name
  });

  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(16)
      ),
      width: MediaQuery.of(context).size.width/2,
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 5,
            child: Star()
            ),
          Positioned(
            bottom: 5,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Star extends StatelessWidget {
  const Star({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
    color: Color.fromRGBO(237, 92, 21, 1),
    borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 17,
                      ),
                    );
  }
}
