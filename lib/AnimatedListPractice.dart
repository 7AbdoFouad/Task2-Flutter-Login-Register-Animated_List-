import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List'),
        centerTitle: true,
        leading: Container(),  //to remove the back button
        backgroundColor: const Color.fromARGB(255, 11, 76, 216),
        elevation: 0.0,
      ),
      //2 ways to create a  animation =>1)flutter animation  2)prepared package
      //Ex for prepared package ==> Staggered Animations  => https://pub.dev/packages/flutter_staggered_animations
      //prepared package for staggered animations
      body: AnimationLimiter(
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: 20,  //list scrollable by default
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: const Duration(milliseconds: 375),
              child: SlideAnimation(
                //left,reight,up,down  sliding animation
                duration: const Duration(milliseconds: 2500),
                verticalOffset: -850.0,
                horizontalOffset: -300,
                curve: Curves.fastLinearToSlowEaseIn,
                child: Container(
                  height: height * 0.1,
                  width: width * 0.9,
                  margin: const EdgeInsets.symmetric(
                      /*vertical: 10,*/ horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
            );
            //  ListTile(
            //   title: Text('Item $index'),
            // );
          },
        ),
      ),
    );
  }
}
