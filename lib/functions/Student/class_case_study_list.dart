import 'package:flutter/material.dart';

import '../database.dart';

class CaseStudyList {
  final String caseStudyTitle;
  final IconData icon;

  const CaseStudyList({this.caseStudyTitle, this.icon});
}

const List<CaseStudyList> caseList = const <CaseStudyList>[
  const CaseStudyList(
      caseStudyTitle: 'Case Study 1', icon: Icons.description_sharp)
];
