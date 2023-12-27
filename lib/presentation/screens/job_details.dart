import 'package:flutter/material.dart';

import '../../data/models/character_model.dart';

class JobDetails extends StatefulWidget {
  final Results results;

  const JobDetails({super.key, required this.results}); 

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.results.name.toString())),
    );
  }
}
