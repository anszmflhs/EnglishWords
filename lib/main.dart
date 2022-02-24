import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'English Words',
      home: RandomWords(
      //   appBar: AppBar(
      //     title: Text('List'),
      //   ),
      //   body: _buildSugesti(),
      // ),
    ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _listbahasa = <WordPair>[];
  final TextStyle _biggerfont = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text('English Words'),
      ),
      body: _buildSugesti(),
    );
  }
  Widget _buildSugesti(){
    return ListView.builder(padding: EdgeInsets.all(16.0),
    itemBuilder: (BuildContext contextbuild,int i){
      if (i.isOdd){
        return new Divider();
      }
      final int index = i ~/ 2;

      if (index >= _listbahasa.length){
        _listbahasa.addAll(generateWordPairs().take(10));
      }
      return buildRow (_listbahasa[index]);
    }
    );
  }
  Widget buildRow(WordPair pair){
    return new ListTile(
      title: Text(
        pair.asPascalCase,style: _biggerfont,
      )
    );
  }
}
