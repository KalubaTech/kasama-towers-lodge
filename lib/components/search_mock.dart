import 'package:flutter/material.dart';
import 'package:kasama_towers_lodge/utils/colors.dart';

class SearchMock extends StatelessWidget {
  const SearchMock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('   Search'),
          Icon(Icons.search)
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Karas.background,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0, 1)
          )
        ],
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}
