import 'package:flutter/material.dart';
import 'package:flutter_friends_love_demo1/pages/cell/main_cell.dart';
import 'package:flutter_friends_love_demo1/model/main_page_model.dart';
import 'package:flutter_friends_love_demo1/common/xl_ui_kit.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_friends_love_demo1/ui/DQRefreshFooter.dart';
import 'package:flutter_friends_love_demo1/ui/DQRefreshHeader.dart';
import 'package:flutter_friends_love_demo1/common/data_callback.dart';
import 'package:flutter_friends_love_demo1/viewmodel/main_page_view_model.dart';

class MainRoute extends StatefulWidget {
  final DataCallback onCallBack;

  const MainRoute({Key key, this.onCallBack}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainRoute> with AutomaticKeepAliveClientMixin {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<DQRefreshHeaderState> _headerKey =
      new GlobalKey<DQRefreshHeaderState>();
  GlobalKey<DQRefreshFooterState> _footerKey =
      new GlobalKey<DQRefreshFooterState>();

  List<ResultsListBean> _data = [];
  List<ResultsListBean> _results;

  MainPageViewModel _mainPageViewModel;

  ConnectionState _connectionState = ConnectionState.waiting;

  @override
  void initState() {
    super.initState();
    print("MainRoute initState");
    _mainPageViewModel = MainPageViewModel((connectionState, data) {
      setState(() {
        _connectionState = connectionState;
        _results = data;
      });
    });
    _mainPageViewModel.getData(false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_connectionState == ConnectionState.waiting) {
      return LoadingKit();
    }
    if (_connectionState == ConnectionState.done) {
      return _buildListView(context);
    }
    return null;
  }

  Widget _buildListView(BuildContext context) {
    if (_data != null) {
      if (!_mainPageViewModel.loadMore) {
        _data.clear();
        _data.addAll(_results);
        if (_easyRefreshKey.currentState != null)
          _easyRefreshKey.currentState.callRefreshFinish();
      } else {
        _data.addAll(_results);
        _easyRefreshKey.currentState.callLoadMoreFinish();
      }

      return EasyRefresh(
        key: _easyRefreshKey,
        behavior: ScrollOverBehavior(),
        autoControl: false,
        refreshHeader: DQRefreshHeader(
          key: _headerKey,
          bgColor: Color(0xfffafafa),
          showMore: true,
        ),
        refreshFooter: DQRefreshFooter(
          key: _footerKey,
          bgColor: Color(0xfffafafa),
          showMore: false,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MainCell(
              mainPageModel: _data[index],
            );
          },
          itemCount: _data.length,
          scrollDirection: Axis.vertical,
          semanticChildCount: _data.length + 1,
        ),
        onRefresh: () async {
          _mainPageViewModel.getData(false);
        },
        loadMore: () async {
          if (_mainPageViewModel.nextUrl == null) {
            _easyRefreshKey.currentState.callLoadMoreFinish();
            return;
          }
          _mainPageViewModel.getData(true);
        },
      );
    } else {
      return Center(
        child: Text("暂无数据"),
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
