import 'images_model.dart';

class Detail_page_model {
  // ignore: slash_for_doc_comments
  /**
   * username : "root2"
   * last_login : "2018-07-02T20:55:34.126515+08:00"
   * date_joined : "2018-07-02T20:48:19.603424+08:00"
   * nickname : "Dodd's"
   * birthday : "1973-04-04"
   * gender : "female"
   * nationality : ""
   * work_area_name : "通州区"
   * born_area_name : "正蓝旗"
   * relationship_desc : "有过一段失败的感情，所以希望找一个可以托付终身的人1"
   * mate_preference : "身高170以上 不抽烟不喝酒的男生"
   * person_intro : "大家好我是新同学 大家多多关照"
   * pic1 : "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554775498845&di=febc70635cf4ff321fae4b27d4c33d91&imgtype=0&src=http%3A%2F%2Fimg.taian.com%2Fforum%2F201405%2F24%2F094327h2tl3zkyz2imo2z2.jpg"
   * mobile : "15313433279"
   * is_staff : true
   * is_active : true
   * height : 173.0
   * weight : 39.0
   * income : 5.0
   * marriage_status : 3
   * career : 11
   * brother_state : 2
   * has_children : 1
   * has_car : 1
   * has_house : 1
   * id : 2
   * education : 4
   * black_user : 0
   * member_level : 0
   * constellation : 3
   * parent_work : 4
   * expect_marry_time : 2
   * images : [{"image_url":"http://ptw.youyuan.com/resize/photo/n/n/n/y/600/600/201807/21/19/00/1532170840448A422FD1.jpg"},{"image_url":"http://ptw.youyuan.com/resize/photo/n/n/n/y/600/600/201807/23/23/23/1532359424664AB73473_c.jpg"},{"image_url":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532607630269&di=1cdf6fef4764b13169e37a6cc223f547&imgtype=0&src=http%3A%2F%2Fs7.sinaimg.cn%2Fmw690%2F006LDoUHzy7auXtxWOG16%26690"}]
   */

  String key;
  String value;
  int type;
  String username;
  // ignore: non_constant_identifier_names
  String last_login;
  // ignore: non_constant_identifier_names
  String date_joined;
  String nickname;
  String birthday;
  String gender;
  dynamic nationality;
  // ignore: non_constant_identifier_names
  String work_area_name;
  // ignore: non_constant_identifier_names
  String born_area_name;
  // ignore: non_constant_identifier_names
  String relationship_desc;
  String mate_preference;
  // ignore: non_constant_identifier_names
  String person_intro;
  String pic1;
  String mobile;
  bool is_staff;
  bool is_active;
  double height;
  double weight;
  double income;
  int marriage_status;
  dynamic career;
  int brother_state;
  int has_children;
  int has_car;
  int has_house;
  int id;
  int education;
  int black_user;
  int member_level;
  dynamic constellation;
  int parent_work;
  int expect_marry_time;
  List<ImagesListBean> images;
  bool hasDivider;

  static Detail_page_model fromMap(Map<String, dynamic> map) {
    Detail_page_model detailPageModel = new Detail_page_model();
    detailPageModel.username = map['username'];
    detailPageModel.last_login = map['last_login'];
    detailPageModel.date_joined = map['date_joined'];
    detailPageModel.nickname = map['nickname'];
    detailPageModel.birthday = map['birthday'];
    detailPageModel.gender = map['gender'];
    detailPageModel.nationality = map['nationality'];
    detailPageModel.work_area_name = map['work_area_name'];
    detailPageModel.born_area_name = map['born_area_name'];
    detailPageModel.relationship_desc = map['relationship_desc'];
    detailPageModel.mate_preference = map['mate_preference'];
    detailPageModel.person_intro = map['person_intro'];
    detailPageModel.pic1 = map['pic1'];
    detailPageModel.mobile = map['mobile'];
    detailPageModel.is_staff = map['is_staff'];
    detailPageModel.is_active = map['is_active'];
    detailPageModel.height = map['height'];
    detailPageModel.weight = map['weight'];
    detailPageModel.income = map['income'];
    detailPageModel.marriage_status = map['marriage_status'];
    detailPageModel.career = map['career'];
    detailPageModel.brother_state = map['brother_state'];
    detailPageModel.has_children = map['has_children'];
    detailPageModel.has_car = map['has_car'];
    detailPageModel.has_house = map['has_house'];
    detailPageModel.id = map['id'];
    detailPageModel.education = map['education'];
    detailPageModel.black_user = map['black_user'];
    detailPageModel.member_level = map['member_level'];
    detailPageModel.constellation = map['constellation'];
    detailPageModel.parent_work = map['parent_work'];
    detailPageModel.expect_marry_time = map['expect_marry_time'];
    detailPageModel.images = ImagesListBean.fromMapList(map['images']);
    return detailPageModel;
  }

  static List<Detail_page_model> fromMapList(dynamic mapList) {
    // ignore: deprecated_member_use
    List<Detail_page_model> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
