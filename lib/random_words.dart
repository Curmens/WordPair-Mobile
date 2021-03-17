import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  RandomWords({Key key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  Widget _buildRow(WordPair pair, int index) {
    final itemCount = index + 1;
    return ListTile(title: Text('$itemCount ${pair.asPascalCase}'));
  }

  @override
  Widget build(BuildContext context) {
    final _randomWordPairs = <WordPair>[];
    Widget _buildLists() {
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext context, item) {
          if (item.isOdd) return Divider();
          final index = item ~/ 2;

          if (index >= _randomWordPairs.length) {
            _randomWordPairs.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_randomWordPairs[index], index);
        },
      );
    }

    return Scaffold(
      // Application Header
      appBar: AppBar(
        title: Text('WordPair Generator'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Profile Info',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Saved Words'),
            ),
            ListTile(
              leading: Icon(Icons.devices),
              title: Text('Data History'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      // Body Content
      body: _buildLists(),
    );
  }
}
