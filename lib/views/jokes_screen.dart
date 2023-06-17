import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/services/get_jokes_services.dart';

import '../controllers/jokes_controller.dart';

class JokesScreen extends StatefulWidget {
  JokesScreen({super.key});

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  @override
  void initState() {
    callServices();
    super.initState();
  }

  void callServices() async {
    await GetAllJokesServices.getAllJokesServices(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://nypost.com/wp-content/uploads/sites/2/2023/03/emoji-comp.jpg?quality=75&strip=all&w=744'),
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 250,
                  color: Colors.black.withOpacity(0.55),
                  child: Center(
                    child: Text(
                      'Make your day fun! Laugh at will ',
                      style: TextStyle(
                          // backgroundColor: Colors.green,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  // flex: 1,

                  child: ListView.builder(
                    // physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: getJoke.getAllJokes.length,
                    itemBuilder: (context, index) {
                      var jokes = getJoke.getAllJokes[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 5),
                        child: Card(
                          child: ExpansionTile(
                            title: Row(
                              children: [
                                Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Joke no: ${(1 + index)}',
                                )
                              ],
                            ),
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  jokes.joke,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
