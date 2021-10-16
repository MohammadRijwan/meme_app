import 'package:flutter/cupertino.dart';
import 'package:person_info/core/domain/api/meme_repo.dart';
import 'package:person_info/core/domain/model/meme_model.dart';

class HomeScreenVm extends ChangeNotifier {
  bool isLoading = true;
  late MemeRepo memeRepo;
  late List<Meme> memeList = [];

  HomeScreenVm() {
    memeRepo = MemeRepo();
    loadList();
  }

  loadList() async {
    isLoading = true;
    await memeRepo.getMemeList();
    notifyListeners();
    memeList = memeRepo.memeList;
    isLoading = false;
    notifyListeners();
  }
}
