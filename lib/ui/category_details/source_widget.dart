import 'package:flutter/material.dart';

import '../../data_layer/model/SourcesResponse/Source.dart';

class SourceWidget extends StatelessWidget {
  Source source;
  bool isSelected;
  SourceWidget({Key? key,required this.source,this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,horizontal: 20
      ),
      decoration: BoxDecoration(
        color: isSelected?Theme.of(context).colorScheme.primary:Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary
        ),
      ),
      child: Text(
        source.name??"",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: isSelected?Colors.white:Theme.of(context).colorScheme.primary
        ),
      ),
    );
  }
}
