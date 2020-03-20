import 'package:flutter/material.dart';
import 'package:hello_sql/screens/note_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:math' as math;

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList>
    with TickerProviderStateMixin {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  
  Animation<double> animation;
  Animation<Color> colorAnimation;
  Animation<Color> colorAnimation2;
  AnimationController animcont;
  AnimationController coloranimcont;
  AnimationController coloranimcont2;
  

  @override
  void initState() {
    super.initState();
    animcont = AnimationController(vsync: this, duration: Duration(seconds: 4));
    
    animation = Tween<double>(begin: 20.0, end: 100.0).animate(animcont);
      animation.addListener(() {
        setState(() {print(animation.value);});
      });
      animation.addStatusListener((status){
        if(status==AnimationStatus.completed){
          // /  animcont.forward();
        }
      });

      coloranimcont = AnimationController(vsync: this, duration: Duration(seconds: 4));
      colorAnimation = ColorTween(begin: Colors.pink, end: Colors.white).animate(coloranimcont);
      colorAnimation.addListener(() {
        setState(() {print(colorAnimation.value);});
      });
      colorAnimation.addStatusListener((status){
        if(status==AnimationStatus.completed){
            coloranimcont.reverse();
        }
      });

    coloranimcont2 = AnimationController(vsync: this, duration: Duration(seconds: 4));
      colorAnimation2 = ColorTween(begin: Colors.black, end: Colors.white).animate(coloranimcont2);
      colorAnimation2.addListener(() {
        setState(() {print(colorAnimation2.value);});
      });
      colorAnimation2.addStatusListener((status){
        if(status==AnimationStatus.completed){
            coloranimcont2.reverse();
        }
      });
    
    animcont.forward();
      
      coloranimcont.forward();
      coloranimcont2.forward();
    
    
  }
  //

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "News Feed",
            style: TextStyle(
              fontFamily: 'Bree',
              color: colorAnimation2.value,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {animcont.reverse();},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(children: [
                    Icon(Icons.menu, color: Colors.pinkAccent, size: 30.0)
                  ]),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, bottom: 10.0, left: 36),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Hello',
                                style: TextStyle(
                                    fontFamily: 'Prata',
                                    color: colorAnimation2.value,
                                    fontSize: 40),
                                children: [
                              TextSpan(
                                text: ' Lutta',
                                style: TextStyle(
                                    fontFamily: 'Prata',
                                    color: colorAnimation.value,
                                    fontSize: 40),
                              )
                            ]))
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 20,
                  ),
                  child: Container(
                    alignment: Alignment(0.0, 0.0),
                    child: Card(
                      elevation: 7,
                      child: Container(
                          // height: 300,
                          // width: 280,
                           height: animation.value+190,
                          width: animation.value+170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            image: DecorationImage(
                              image: AssetImage("images/jare.png"),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          child: Stack(children: [
                            Positioned(
                              right: 16,
                              top: 6,
                              child: Icon(
                                Icons.star,
                                color: Colors.pink,
                                size: 33,
                              ),
                            ),
                            Positioned(
                              top: 180,
                              left: 50,
                              child: Text('Africa\'s Flower ',
                                  style: TextStyle(
                                      fontFamily: 'Muli',
                                      fontSize: 22,
                                      color: Colors.pink[200],
                                      fontWeight: FontWeight.bold)),
                            ),
                            Positioned(
                              left: 16,
                              bottom: 47,
                              child: Text('Meet Jare,the world\'s most beautiful...',
                                  style: TextStyle(
                                    fontFamily: 'Libre',
                                    fontSize: 13,
                                    color: Colors.blueGrey,
                                  )),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 0,
                              child: FlatButton(
                                onPressed: () {},
                                color: Colors.white,
                                child: Text('Read more',
                                    style: TextStyle(
                                        fontFamily: 'Ptsans',
                                        fontSize: 15,
                                        color: Colors.pinkAccent)),
                              ),
                            ),
                          ])),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 20,
                  ),
                  child: Container(
                    alignment: Alignment(0.0, 0.0),
                    child: Card(
                      elevation: 7,
                      child: Container(
                          // height: 300,
                          // width: 280,
                          height: animation.value+190,
                          width: animation.value+170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            image: DecorationImage(
                              image: AssetImage("images/horizon.jpeg"),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          child: Stack(children: [
                            Positioned(
                              right: 16,
                              top: 6,
                              child: Icon(
                                Icons.star,
                                color: Colors.pink,
                                size: 33,
                              ),
                            ),
                            Positioned(
                              top: 180,
                              left: 50,
                              child: Text('Local man tired',
                                  style: TextStyle(
                                      fontFamily: 'Muli',
                                      fontSize: 22,
                                      color: Colors.pink[200],
                                      fontWeight: FontWeight.bold
                                      )),
                            ),
                            Positioned(
                              left: 16,
                              bottom: 45,
                              child: Text('Local man is tired of monday...',
                                  style: TextStyle(
                                    fontFamily: 'Libre',
                                    fontSize: 13,
                                    color: Colors.blueGrey,
                                  )),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 0,
                              child: FlatButton(
                                onPressed: () {},
                                color: Colors.white,
                                child: Text('Read more',
                                    style: TextStyle(
                                        fontFamily: 'Ptsans',
                                        fontSize: 15,
                                        color: Colors.pinkAccent)),
                              ),
                            ),
                          ])),
                    ),
                  ),
                ),
              ])),
        ));
  }

  @override
  void dispose() {
    animcont.dispose();
    super.dispose();
  }
}
