import 'package:flutter/material.dart';
import 'package:kasama_towers_lodge/utils/colors.dart';
import 'package:search_choices/search_choices.dart';


class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _searchedValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Karas.primary,
        title: Text('Search'),
      ),

      body: Container(
        child: Column(
          children: [
            Container(
              child: SearchChoices.multiple(
                items: List.generate(20, (index)=>DropdownMenuItem(child: Text('Kaluba $index'))),
                //value: _searchedValue,
                hint: "Select one",
                searchHint: "Select one",
                onChanged: (value) {
                  setState(() {
                    _searchedValue = value;
                  });
                },
                doneButton: "Done",
                displayItem: (item, selected) {
                  return (Row(children: [
                    selected
                        ? Icon(
                      Icons.radio_button_checked,
                      color: Colors.grey,
                    )
                        : Icon(
                      Icons.radio_button_unchecked,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 7),
                    Expanded(
                      child: item,
                    ),
                  ]));
                },
                isExpanded: true,
              ),
            ),

          ],
        ),
      ),

    );
  }
}
