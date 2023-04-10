import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:solar_system/model/datas.dart';
import 'package:solar_system/views/constants.dart';
import 'package:solar_system/views/detailsview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: const [
                        Text(
                          'Explore',
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold',
                            fontSize: 40,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: const [
                          Text(
                            'Solar System',
                            style: TextStyle(
                              fontFamily: 'Sedgwick',
                              fontSize: 24,
                              color: Color(0x7cdbf1ff),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Swiper(
                    itemCount: planets.length,
                    fade: 0.3,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    layout: SwiperLayout.STACK,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeSize: 20,
                        activeColor: Colors.orange.shade300,
                        space: 5,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {

                        },

                      );
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
