import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State {
    List _imglist = [
      'https://yy0.tv.cmvideo.cn:8443/migutv/res/2019/10/17/59L11DV8GKF0.jpg',
      'https://yy1.tv.cmvideo.cn:8443/migutv/res/2019/10/01/59KIFM69ID6D.jpg',
      'https://yy0.tv.cmvideo.cn:8443/migutv/res/2019/09/30/59IHTLCINHHH.jpg'
    ];
    double _appBarAlpha = 0;

    void _onScroll(offset){
//        print(offset);
      double alpha = offset / APPBAR_SCROLL_OFFSET;
      if (alpha<0) {
          alpha = 0;
      } else if (alpha > 1){
        alpha = 1;
      }
      setState(() {
        _appBarAlpha = alpha;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              context:context,
              removeTop:true,
              child: NotificationListener(
                  onNotification:(scrollNotification){
                    //监听第零的child
                    if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0){
                      //滚动的回调
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                  },
                  child: ListView(
                      children: <Widget>[
                        Container(
                          height: 200,
                          child: Swiper(
                              itemCount: _imglist.length,
                              autoplay: true,
                              itemBuilder:(BuildContext context, int index){
                                return Image.network(
                                    _imglist[index],
                                    fit:BoxFit.fill
                                );
                              },
                              pagination:SwiperPagination()
                          ),
                        ),
                        Container(
                          height: 800,
                          child: ListTile(
                              title: Text('哈哈列表')
                          ),
                        )
                      ]
                  )
              )
          ),
          Opacity(
            opacity: _appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("首页")
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
