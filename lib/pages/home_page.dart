import 'package:flutter/material.dart';
import'package:flutter_swiper/flutter_swiper.dart';
const APPBAR_SCROLL_OFFSET=100;
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
  double appBarAlpha=0;
  _onScroll(offset){
    double alpha=offset/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha=0;
    }else if(alpha>1){
      alpha=1;
    }
    setState(() {
      appBarAlpha=alpha;
    });
    print(appBarAlpha);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context:context,
              child:NotificationListener(
                onNotification: (scrollNotification){
                  if(scrollNotification is ScrollUpdateNotification&&scrollNotification.depth==0){
                    //列表滚动
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child:  ListView(
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
                    ),
                    Container(
                      height: 800,
                      child: ListTile(
                          title:Text('哈哈')
                      ),
                    )
                  ],
                ),)

          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(padding: EdgeInsets.only(top: 20),
                child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}