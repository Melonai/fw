import 'package:flutter/material.dart';

import '../../constants.dart';

class FWPage extends StatelessWidget {
  final Widget child;
  final Widget title;
  final Widget? leading;
  final List<Widget>? actions;

  const FWPage({
    Key? key,
    required this.child,
    required this.title,
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: FWColors.FW_BACKGROUND,
      appBar: _createAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100.0),
            child,
          ],
        ),
      ),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                FWColors.FW_BACKGROUND,
                FWColors.FW_BACKGROUND.withOpacity(0)
              ],
              stops: [
                0.25,
                1
              ]),
        ),
      ),
      title: this.title,
      actions: this.actions,
      leading: this.leading,
    );
  }
}
