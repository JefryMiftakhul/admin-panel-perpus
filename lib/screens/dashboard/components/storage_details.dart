import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          StorageInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Data Buku",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Data Member",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Data Pengarang",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Data Genre",
            numOfFiles: 1328,
          ),
        ],
      ),
    );
  }
}
