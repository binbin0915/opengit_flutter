import 'package:flutter/widgets.dart';
import 'package:flutter_base_ui/flutter_base_ui.dart';
import 'package:open_git/bean/repos_detail_bean.dart';
import 'package:open_git/manager/repos_manager.dart';
import 'package:open_git/status/status.dart';

class RepoDetailBloc extends BaseBloc<LoadingBean<ReposDetailBean>> {
  static final String TAG = 'ReposDetailBloc';

  final String reposOwner;
  final String reposName;

  bool _isInit = false;

  RepoDetailBloc(this.reposOwner, this.reposName) {
    bean = LoadingBean(
        isLoading: false,
        data: ReposDetailBean(
          starStatus: ReposStatus.loading,
          watchStatus: ReposStatus.loading,
          readme: '',
        ));
  }

  void initData(BuildContext context) async {
    if (_isInit) {
      return;
    }
    _isInit = true;

    onReload();
  }

  @override
  void onReload() async {
    showLoading();
    await _fetchReposDetail();
    hideLoading();
  }

  @override
  Future getData() async {
    await _fetchReposDetail();
  }

  Future _fetchReposDetail() async {
    final repos =
        await ReposManager.instance.getReposDetail(reposOwner, reposName);
    bean.data.repos = repos;

    if (repos == null) {
      bean.isError = true;
    } else {
      bean.isError = false;
    }

    sink.add(bean);

    _fetchStarStatus();
    _fetchWatchStatus();
  }

  Future _fetchStarStatus() async {
    final response =
        await ReposManager.instance.getReposStar(reposOwner, reposName);
    bean.data.starStatus =
        response.result ? ReposStatus.active : ReposStatus.inactive;

    sink.add(bean);
  }

  Future _fetchWatchStatus() async {
    final response =
        await ReposManager.instance.getReposWatcher(reposOwner, reposName);
    bean.data.watchStatus =
        response.result ? ReposStatus.active : ReposStatus.inactive;

    sink.add(bean);
  }

  void changeStarStatus() async {
    bool isEnable = bean.data.starStatus == ReposStatus.active;

    bean.data.starStatus = ReposStatus.loading;
    sink.add(bean);

    final response = await ReposManager.instance
        .doReposStarAction(reposOwner, reposName, isEnable);
    if (response.result) {
      if (isEnable) {
        bean.data.starStatus = ReposStatus.inactive;
      } else {
        bean.data.starStatus = ReposStatus.active;
      }
    }
    sink.add(bean);
  }

  void changeWatchStatus() async {
    bool isEnable = bean.data.watchStatus == ReposStatus.active;

    bean.data.watchStatus = ReposStatus.loading;
    sink.add(bean);

    final response = await ReposManager.instance
        .doReposWatcherAction(reposOwner, reposName, isEnable);
    if (response.result) {
      if (isEnable) {
        bean.data.watchStatus = ReposStatus.inactive;
      } else {
        bean.data.watchStatus = ReposStatus.active;
      }
    }
    sink.add(bean);
  }

  void fetchReadme() async {
    final response =
        await ReposManager.instance.getReadme("$reposOwner/$reposName", null);
    bean.data.readme = response.data;
    sink.add(bean);
  }

  void fetchBranches() async {
    final response =
        await ReposManager.instance.getBranches(reposOwner, reposName);
    bean.data.branchs = response;
    sink.add(bean);
  }
}