import 'package:dio/dio.dart';
import 'package:person_info/core/domain/model/meme_model.dart';

class MemeRepo {
  var dio = Dio();
  late List<Meme> memeList = [];

  getMemeList() async {
    final response = await dio.get('https://api.imgflip.com/get_memes');
    MemeModel memeModel = MemeModel.fromJson(response.data);
    memeList = memeModel.data.memes;
    print(response.data);
    print(memeModel.data.memes.length);
  }
}
