import 'package:flutter/material.dart';

const disclaimerText1 = '本APP属于个人的非赢利性开源项目，以供开源社区使用，凡本APP转载的所有的文章 、'
    '图片、音频、视频文件等资料的版权归版权所有人所有，本APP采用的非本站原创文章及'
    '图片等内容无法一一和版权者联系，如果本网所选内容的文章作者及编辑认为其作品不宜'
    '上网供大家浏览，或不应无偿使用请及时用电子邮件或电话通知我们，以迅速采取适当措施，'
    '避免给双方造成不必要的经济损失。';

const disclaimerText2 = '对于已经授权本APP独家使用并提供给本站资料的版权所有人的文章、'
    '图片等资料，如需转载使用，需取得本站和版权所有人的同意。本APP所刊发、转载的文章，其版权均归原'
    '作者所有，如其他媒体、网站或个人从本网下载使用，请在转载有关文章时务必尊重该文章的著作权，'
    '保留本网注明的“稿件来源”，并自负版权等法律责任。';

class BookMarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  }
}

//class HomePageState extends State<BookMarkPage> {
//  RefreshController controller;
//
//  @override
//  void initState() {
//    super.initState();
//    controller = new RefreshController();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return StoreConnector<AppState, HomePageViewModel>(
//      distinct: true,
//      onInit: (store) => store.dispatch(FetchAction(ListPageType.home)),
//      converter: (store) => HomePageViewModel.fromStore(store),
//      builder: (_, viewModel) => HomesPageContent(viewModel, controller),
//    );
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    if (controller != null) {
//      controller.dispose();
//      controller = null;
//    }
//  }
//}
