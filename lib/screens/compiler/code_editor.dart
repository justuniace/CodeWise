import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class CodeEditorPage extends StatelessWidget {
  final String code;

  const CodeEditorPage({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Code Editor"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LineNumberColumn(code: code), 
              const SizedBox(width: 8), 
              Expanded(
                child: HighlightView(
                  code,
                  language: 'html',
                   theme: githubTheme, // Choose a theme
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LineNumberColumn extends StatelessWidget {
  final String code;

  const LineNumberColumn({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the number of lines based on the provided code
    int lineCount = code.split('\n').length;

    // Build the column of line numbers
    return Container(
      padding:const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: const Border(right: BorderSide(color: Colors.grey)),
      ),
      child: Column(
        children: List.generate(lineCount, (index) => Text('${index + 1}')),
      ),
    );
  }
}


