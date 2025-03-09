import 'package:flutter/material.dart';

class SynopsisWidget extends StatefulWidget {
  final String synopsis;

  const SynopsisWidget({super.key, required this.synopsis});

  @override
  State<SynopsisWidget> createState() => _SynopsisWidgetState();
}

class _SynopsisWidgetState extends State<SynopsisWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final truncatedSynopsis = widget.synopsis.length > 100
        ? '${widget.synopsis.substring(0, 100)}...'
        : widget.synopsis;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isExpanded ? widget.synopsis : truncatedSynopsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          textAlign: TextAlign.justify,
        ),
        if (widget.synopsis.length > 100)
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? 'Show less' : 'Show more',
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
