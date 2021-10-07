import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/secondPage.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CouterProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class CouterProvider extends ChangeNotifier {
  int _couter = 0;
  int get couter => _couter;
  void add() {
    _couter++;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.watch<CouterProvider>().couter.toString(),
            style: TextStyle(fontSize: 50),),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondPage(),));
                },
                child: Text("Next Page")
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          context.read<CouterProvider>().add();
        },
      ),
    );
  }
}
