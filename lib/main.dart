import 'package:flutter/material.dart';
import 'anime.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'dart:ui' as ui;

void main() => runApp( MaterialApp (
  home: animelist(),
));

class animelist extends StatefulWidget {
  const animelist({Key? key}) : super(key: key);

  @override
  _animelistState createState() => _animelistState();
}

class _animelistState extends State<animelist> {

 var anime = [

  ];


  Widget animeTemplate(Anime) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0,16.0,16.0,0),
      child: Column(
        children: <Widget> [
          Text(
            Anime.anime,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.deepOrange,
            )
          ),
          SizedBox(height: 4.0,),
          Text(
            Anime.character,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.deepOrange,
            ),
          ),
          Text(
            Anime.quote,
            style: const TextStyle(
                fontSize: 14,
              color: Colors.deepOrange,
            ),
          ),
        ],
      )
    );
    }


  String URL = 'https://animechan.vercel.app/api/quotes';

  void fetchdata () async {
    var url = Uri.parse(URL);
    var response = await http.get(url);
    final List<dynamic> json = jsonDecode(response.body) as List;
    anime = json;
  }

  @override
d
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }



  @override
  Widget build(BuildContext context) {
    if(anime.isNotEmpty){
      return Scaffold(
        body: ListView.builder(
            itemCount: anime.length,
            itemBuilder: (context, i){
              final animes = anime[i];
              // return Text("Anime: ${animes["anime"]}\n Character: ${animes["character"]}\n Quote: ${animes["quote"]}\n\n\n");
              return Column(
                  children: anime.map((Anime) => animeTemplate(Anime)).toList(),
            }
        ),
      );
    }
    else{
      return const Scaffold(
          body: Center(
          child: Text('D A T A   L O A D I N G...'),
    ),
      );
  }
  }
}
