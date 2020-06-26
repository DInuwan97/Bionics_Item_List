import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:device_preview/device_preview.dart';

import './Models/Item.dart';
import './SideNavigationDrawer.dart';
import './Pages/ItemDetail.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.of(context).locale, // <--- Add the locale
      builder: DevicePreview.appBuilder, // <--- Add the builder
      home: MyHomePage(title: 'Items'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Item>> _getItems() async{

    var data = await http.get("https://bionicsfashions.azurewebsites.net/api/items");
    var jsonData = jsonDecode(data.body);

    List<Item> items = [];
 
    for(var i in jsonData){

      Item item = Item(i["itemName"],i["itemImage"],i["description"],i["company"],i["price"],i["category"]);
      items.add(item);
    }

    print(items.length);
    return items;
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
                  IconButton(
                   icon:Icon(Icons.search),
                  ),

                  IconButton(
                   icon:Icon(Icons.more_vert),
                   onPressed: (){ },
                  ),
                  
             ],
      ),
      drawer: SideNavigationDrawer(),

      body: Container(
        child:FutureBuilder(
          future:_getItems(),
          builder:(BuildContext context,AsyncSnapshot snapshot){


            if(snapshot.data == null){
              return Container(
                child:Center(
                  child:Text('Loading...')
                )
              );
            }

            else{

              return ListView.builder(
                itemCount:snapshot.data.length,
                itemBuilder:(BuildContext context,int index){


                  return ListTile(
                    leading:CircleAvatar(
                      backgroundImage: NetworkImage(
                        snapshot.data[index].itemImage
                      ),
                    ),
                    title: Text(
                      snapshot.data[index].itemName,
                      style:TextStyle(fontSize:21.0)),

                    subtitle: Text(
                       'LKR ' +(snapshot.data[index].price).toString(),
                        style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:17.0
                        ),
                       ),
                    onTap: (){
                      Navigator.push(context,
                        new MaterialPageRoute(
                          builder: (context) => ItemDetail(snapshot.data[index])
                        )
                      );
                    },
                    trailing: Icon(
                      Icons.favorite,
                      color: Colors.redAccent[400],
                      ),
                  );
                }

            )   ;
            }


     
          }
        )
      )
    );
  }
}


