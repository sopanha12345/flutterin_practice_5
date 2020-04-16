import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class MyHomePage extends StatefulWidget {

  final String title;
  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var messages = const [
  //    {
//      'subject' : 'My first message',
//      'body' : 'Maketing Solution Asia'
//    },
//    {
//      'subject' : 'My second message',
//      'body' : 'Maketing Solution Asia'
//    },
//    {
//      'subject' : 'My third message',
//      'body' : 'Maketing Solution Asia'
//    },
//    {
//      'subject' : 'My forth message',
//      'body' : 'Maketing Solution Asia'
//    },
  ];

  Future LoadMessageList() async{
    var content = await rootBundle.loadString('data/message.json');
    var collection = json.decode(content);
    print(content);

    setState(() {
      messages = collection;
    });

  }




  @override
  void initState() {
    //TODO: Inistate It will happen when wiget created
    LoadMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title), // Using widget when we need to access constructor at parent context
      ),
      body: ListView.separated(

          separatorBuilder: (context, index) => Divider(),
          itemCount: messages.length,

          itemBuilder: (BuildContext context, int index){

            var title = messages[index];

            return ListTile(

              leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: new Icon(Icons.arrow_forward_ios)
              ),

              title: Text('${index + 1} - '+title['title']),

              isThreeLine: true,

              subtitle: new Text(
                  title['subject'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
              ),

              trailing: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: new Icon(Icons.restore_from_trash)
              ),

            );
          }),
    );
  }
}
/*TODO: Display Message With ListView
  ListView Builder priorities need:
    - ListView.builder()
    - itemCount
    - itemBuilder (BuildContext context, int index)

   ListView Seperate priorities need:
    - ListView.seperated() : for seperated between row in the list
    - seperatorBuilder: (context, index) => Divider()
*/