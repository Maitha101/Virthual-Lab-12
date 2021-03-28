import 'package:flutter/material.dart';

import '../database.dart';

class ExperimentList {
  final String expTitle;
  final String attemptsNo;
  final IconData icon;
  const ExperimentList({this.expTitle, this.attemptsNo, this.icon});
}

const List<ExperimentList> expList = const <ExperimentList>[
  const ExperimentList(
      expTitle: 'Experiment 1',
      attemptsNo: 'Attempts: 1',
      icon: Icons.device_thermostat),
];
