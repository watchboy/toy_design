import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:untitled/rounded_avatar.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/gifback2.gif'), fit: BoxFit.fill)),
      child: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              firstGlassContainer(context),
              secondGlassContainer(context),
              thirdGlassContainer(context),
              SizedBox(
                height: 8,
              ),
              Center(
                child: GlassmorphicContainer(
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.3),
                        Color(0xFFFFFFFF).withOpacity(0.2),
                      ],
                      stops: [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.3),
                      Color((0xFFFFFFFF)).withOpacity(0.2),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height / 5,
                  border: 2,
                  borderRadius: 20,
                  blur: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Center(child: Text('다가오는 일정')),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Center thirdGlassContainer(BuildContext context) {
    return Center(
      child: GlassmorphicContainer(
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFffffff).withOpacity(0.1),
              Color(0xFFFFFFFF).withOpacity(0.1),
            ],
            stops: [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFffffff).withOpacity(0.3),
            Color((0xFFFFFFFF)).withOpacity(0.2),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.22,
        border: 2,
        borderRadius: 20,
        blur: 10,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                '우리의 흔적',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 20,
              ),
              HorizontalCardPager(
                items: cardItems(),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<CardItem> cardItems() {
    List<ImageCarditem> items = [
      ImageCarditem(
        image: Image.asset('assets/back1.jpg'),
      ),
      ImageCarditem(
        image: Image.asset('assets/back2.jpg'),
      ),
      ImageCarditem(
        image: Image.asset('assets/my2.jpg'),
      ),
      ImageCarditem(
        image: Image.asset('assets/our1.jpg'),
      ),
      ImageCarditem(
        image: Image.asset('assets/my2.jpg'),
      ),
      ImageCarditem(
        image: Image.asset('assets/our1.jpg'),
      ),
      ImageCarditem(
        image: Image.asset('assets/my2.jpg'),
      ),
    ];
    return items;
  }
  Center secondGlassContainer(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 10),
        child: GlassmorphicContainer(
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFffffff).withOpacity(0.1),
                Color(0xFFFFFFFF).withOpacity(0.1),
              ],
              stops: [
                0.1,
                1,
              ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFffffff).withOpacity(0.1),
              Color((0xFFFFFFFF)).withOpacity(0.1),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.35,
          border: 2,
          borderRadius: 20,
          blur: 10,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  '미소 ♥ 준겸 커플의 한달 통계',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Table(
                      children: [
                        TableRow(children: [
                          TableCell(
                            child: Container(
                              height: 30,
                              child: textTable('누적 데이트 횟수'),
                            ),
                          ),
                          textTable('1일 평균 메세지 수'),
                        ]),
                        TableRow(children: [
                          textTable('16'),
                          textTable('72.6'),
                        ])
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Table(
                      children: [
                        TableRow(children: [
                          TableCell(
                            child: Container(
                              height: 30,
                              child: textTable('보유한 커플 포인트'),
                            ),
                          ),
                          textTable('한달 평균 데이트 횟수'),
                        ]),
                        TableRow(children: [
                          textTable('1265'),
                          textTable('7.6'),
                        ])
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Text textTable(String contents) {
    return Text(
      contents,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black87, fontSize: 14),
    );
  }
  Center firstGlassContainer(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onLongPress: () {
            print('hello');
          },
          child: GlassmorphicContainer(
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFffffff).withOpacity(0.1),
                  Color(0xFFFFFFFF).withOpacity(0.1),
                ],
                stops: [
                  0.1,
                  1,
                ]),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFffffff).withOpacity(0.3),
                Color((0xFFFFFFFF)).withOpacity(0.2),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.width / 4,
            border: 2,
            borderRadius: 20,
            blur: 10,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundedAvatar(
                    asset: 'assets/our1.jpg',
                    size: MediaQuery.of(context).size.width / 7,
                  ),
                  Container(
                    child: Ink.image(
                      image: AssetImage('assets/dday.png'),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: null,
                        child: Text(
                          '242일',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.pink,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  RoundedAvatar(
                    asset: 'assets/couple1.jpg',
                    size: MediaQuery.of(context).size.width / 7,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
