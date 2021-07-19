import 'package:flutter/material.dart';
import 'package:fw/widgets/structural/fw_page.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FWPage(child: Text("Loading..."), title: Text("Loading"));
  }
}
