import 'package:atsign_atmosphere_pro/services/backend_service.dart';
import 'package:atsign_atmosphere_pro/services/common_functions.dart';
import 'package:atsign_atmosphere_pro/utils/colors.dart';
import 'package:atsign_atmosphere_pro/utils/constants.dart';
import 'package:atsign_atmosphere_pro/utils/images.dart';
import 'package:flutter/material.dart';

class DesktopFileCard extends StatelessWidget {
  final String title;
  final String filePath;
  DesktopFileCard({this.title, this.filePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            filePath != null
                ? Container(
                    width: 180,
                    height: 120,
                    child: FutureBuilder(
                      future: CommonFunctions().isFilePresent(filePath),
                      builder: (BuildContext cotext, snapshot) {
                        return snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.data != null
                            ? CommonFunctions().thumbnail(
                                filePath.split('/').last.split('.').last,
                                MixedConstants.RECEIVED_FILE_DIRECTORY +
                                    '/${filePath.split('/').last}',
                                isFilePresent: snapshot.data)
                            : SizedBox();
                      },
                    ),
                  )
                : Container(
                    width: 180,
                    height: 120,
                    child: ClipRect(
                      child: Image.asset(ImageConstants.emptyTrustedSenders,
                          fit: BoxFit.fill),
                    ),
                  ),
            title != null
                ? Container(
                    width: 180,
                    height: 30,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: ColorConstants.light_border_color),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        title,
                        style: TextStyle(color: Color(0xFF8A8E95)),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}