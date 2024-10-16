import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaball_app/modules/shared/models/event_model.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    super.key,
    this.model,
  });

  final EventModel? model;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  Future<void> onPressed() async {
    debugPrint("event card is pressed");
  }

  @override
  Widget build(BuildContext context) {
    final eventData = widget.model!;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image(
        height: 180.0,
        fit: BoxFit.fitHeight,
        image: AssetImage(eventData.image),
      ),
    );
  }
}
