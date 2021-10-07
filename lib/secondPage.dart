import 'package:flutter/material.dart';
import 'package:testprovider/main.dart';
import 'package:provider/provider.dart';
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.watch<CouterProvider>().couter.toString(),
              style: TextStyle(fontSize: 50),),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Back")
            ),
            Container(
              color: Colors.brown,
              height: 130,
              width: 130,
              child: Column(
                children: [
                  Text(context.watch<CouterProvider>().couter.toString(),
                    style: TextStyle(fontSize: 50),),
                  ElevatedButton(
                      onPressed: (){
                        context.read<CouterProvider>().add();
                      },
                      child: Icon(Icons.add)
                  ),
                ],
              ),
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
