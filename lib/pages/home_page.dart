import 'package:flutter/material.dart';
import'package:flutter_swiper/flutter_swiper.dart';
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() =>_HomePageState();
}
class _HomePageState extends State<HomePage>{
  List _imageUrls=[
    'https://img.zcool.cn/community/0161e25b8f3b6fa8012017ee8d9a7d.jpg@1280w_1l_2o_100sh.jpg',
    'https://img.zcool.cn/community/01dbe55b8f3b6aa8012017ee7cf4cd.jpg@1280w_1l_2o_100sh.jpg',
    'https://img.zcool.cn/community/013a585b8f3b86a8012017eec80afd.jpg@1280w_1l_2o_100sh.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 160,
              child: Swiper(
                itemCount: _imageUrls.length,
                autoplay: true,
                itemBuilder: (BuildContext context,int index){
                  return Image.network(
                      _imageUrls[index],
                    fit: BoxFit.fill,
                  );
                },
                pagination: SwiperPagination(),
              ),
            )
          ],
        ),
      ),
    );
  }
}