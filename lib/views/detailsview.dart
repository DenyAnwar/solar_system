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
  bool _isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 32.0),
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
                    Text(
                      'Solar System',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Roboto-Regular',
                        color: primaryTextColor,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const Divider(
                      color: Colors.black38,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 140,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Text(
                          widget.planetInfo!.description.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Roboto-Regular',
                            color: contentTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 100,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(
                      color: Colors.black38,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 24,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'Roboto-Regular',
                        color: contentTextColor,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 40,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 230,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.planetInfo!.images!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isZoomed = !_isZoomed;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: _isZoomed ? 400 : 230,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    widget.planetInfo!.images![index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: -70,
              child: Hero(
                tag: widget.planetInfo!.position,
                child: Image.asset(
                  widget.planetInfo!.iconImage.toString(),
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: Text(
                widget.planetInfo!.position.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 247,
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ],
        ),
      ),
    );
  }
}
