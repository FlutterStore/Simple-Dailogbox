import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExampleAppPage(),
    );
  }
}

class ExampleAppPage extends StatefulWidget {
  const ExampleAppPage({Key? key}) : super(key: key);

  @override
  State<ExampleAppPage> createState() => _ExampleAppPageState();
}

class _ExampleAppPageState extends State<ExampleAppPage> {

  var _selected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleDialog',style: TextStyle(color: Colors.white,fontSize: 15)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: ()async {
                _selected = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      alignment: Alignment.center,
                      backgroundColor: Colors.white,
                      // clipBehavior: Clip.antiAlias,
                      // contentPadding: const EdgeInsets.all(5),
                      // insetPadding: const EdgeInsets.all(5),
                      semanticLabel: "",
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      // titlePadding: const EdgeInsets.all(5),
                      // titleTextStyle: ,
                      title: const Text('Choose food'),
                      elevation: 10,
                      children:[
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, "Pizza"); },
                          child: const Text('Pizza',style: TextStyle(fontSize: 16,),),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, "Burger");
                          },
                          child: const Text('Burger',style: TextStyle(fontSize: 16,),),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, "Sandwitch");
                          },
                          child: const Text('Sandwitch',style: TextStyle(fontSize: 16,),),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, "PaniPuri");
                          },
                          child: const Text('PaniPuri',style: TextStyle(fontSize: 16,),),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, "Alupuri");
                          },
                          child: const Text('Alupuri',style: TextStyle(fontSize: 16,),),
                        ),
                      ],
                    );
                  },
                );
                setState(() {
                  _selected = _selected;
                });
              },
              child: const Text('Show Dialog'),
            ),
            const SizedBox(height: 15,),
            Text(_selected,style: const TextStyle(fontSize: 25,),)
          ],
        ),
      )
    );
  }
}