import 'package:flutter/material.dart';
import 'package:fw/constants.dart';
import 'package:fw/widgets/structural/fw_page.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FWPage(
      title: Text("Search for a city"),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: FWColors.FW_CONTAINER,
                ),
                child: TextField(
                  onSubmitted: (city) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      "/city",
                      (route) => false,
                      arguments: city,
                    );
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      prefixIcon: Icon(
                        Icons.search,
                        color: FWColors.FW_TEXT_DIMMED,
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth: 50.0)),
                ),
              ),
            ),
            SizedBox(width: 12),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: FWColors.FW_CONTAINER,
              ),
              child: IconButton(
                icon: Icon(Icons.near_me_outlined),
                color: FWColors.FW_TEXT_DIMMED,
                onPressed: () => Navigator.of(context)
                    .pushNamedAndRemoveUntil("/", (route) => false),
              ),
            )
          ],
        ),
      ),
    );
  }
}
