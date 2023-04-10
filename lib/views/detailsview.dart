import 'package:flutter/material.dart';
import 'package:solar_system/model/datas.dart';
import 'package:solar_system/views/constants.dart';

class DetailsView extends StatefulWidget {
  final PlanetInfo? planetInfo;

  const DetailsView({Key? key, this.planetInfo}) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 32.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 300,
                    ),
                    Text(
                      widget.planetInfo!.name.toString(),
                      style: TextStyle(
                        fontSize: 55,
                        fontFamily: 'Roboto-Regular',
                        color: primaryTextColor,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
