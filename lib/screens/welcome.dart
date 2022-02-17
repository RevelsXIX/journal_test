import 'package:flutter/material.dart';
import 'package:journal_test/widgets/custom_appbar.dart';


class WelcomeScreen extends StatefulWidget {

  const WelcomeScreen({Key? key}) : super(key: key);


  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}


class _WelcomeScreenState extends State<WelcomeScreen>{


  static const String title = "Josh's Journal";
  //
  // CustomAppBar.setPageTitle(title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: title,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(
                Icons.book,
                color: Colors.black,
                size: 80.0
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Journal')
              ],
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add)
      ),
    );
  }




}