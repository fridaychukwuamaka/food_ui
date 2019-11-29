import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_ui/pages/food.dart';
import 'package:food_ui/widgets/rating_card.dart';

import '../constant.dart';

class Search extends StatefulWidget {
  static String id = '/';
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconBar(),
              SizedBox(
                height: 30,
              ),
              SearchText(),
              SizedBox(
                height: 30,
              ),
              InputSection(),
              SizedBox(
                height: 30,
              ),
              FirstColumn(),
              SizedBox(
                height: 13,
              ),
              Divider(
                indent: 15,
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'images/roberto-carlos-roman-AC6IAIhP4Yk-unsplash.jpg'))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(237, 92, 21, 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 17,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 10,
                        child: Text(
                          'Tacos Hous',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      )
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
            if (val == 1) {
              Navigator.pushNamed(context, Food.id);
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

class FirstColumn extends StatelessWidget {
  const FirstColumn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PhysicalModel(
        color: Colors.white,
        elevation: 8,
        shadowColor: Color.fromRGBO(0, 0, 0, 0.4),
        borderRadius: BorderRadius.circular(9),
        child: RatingCard(
          image: 'images/martin-widenka-tkfRSPt-jdk-unsplash.jpg',
          heading: 'Tacos de con',
          contents: 'Soft corn tacos of achiote rubbed mahi',
        ),
      ),
    );
  }
}

class InputSection extends StatelessWidget {
  const InputSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 8,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(17),
      child: TextField(
        cursorColor: Color.fromRGBO(237, 92, 21, 1),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: 'Tacos',
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.cancel,
              color: Color.fromRGBO(237, 92, 21, 1),
              size: 16,
            )),
      ),
    );
  }
}

class SearchText extends StatelessWidget {
  const SearchText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Search', style: kPageHeading),
        SizedBox(
          height: 10.0,
        ),
        Text('by dishes and place', style: KtextStyle)
      ],
    );
  }
}

class IconBar extends StatelessWidget {
  const IconBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.arrow_back_ios,
          size: 17,
        ),
        Icon(
          Icons.notifications,
          size: 17,
        )
      ],
    );
  }
}
