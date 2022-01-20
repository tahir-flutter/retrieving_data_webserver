import 'package:flutter/material.dart';
import'package:http/http.dart' as http;
import'dart:convert';
class Httpusage extends StatefulWidget {
  const Httpusage({Key? key}) : super(key: key);

  @override
  _HttpusageState createState() => _HttpusageState();
}

class _HttpusageState extends State<Httpusage> {
  var url=Uri.parse("https://jsonplaceholder.typicode.com/photos");
  var data;
  @override
  void initState(){
    super.initState();
    fetchData();
  }
  fetchData()async{
    var res=await http.get(url);
    data=jsonDecode(res.body);
    setState((){});
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.blue,
          title:Text(
            'Data From Web Server',
            style:TextStyle(
              fontSize:20,
              fontWeight:FontWeight.bold,
              color:Colors.white,
            ),
          ),
        ),
        body:data !=null
            ? ListView.builder(
          itemBuilder: (context,index){
            return ListTile(
              title:Text(data[index]["title"]),
              subtitle: Text('ID: ${data[index]["id"]}'),
              leading:Image.network(data[index]["url"]),
            );
          },
          itemCount: data.length,
        )
            : Center(child:CircularProgressIndicator()),
      ),
    );
  }
}
