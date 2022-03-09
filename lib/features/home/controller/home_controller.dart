import 'package:baseproject/core/api_handler/api-extention.dart';
import 'package:baseproject/core/api_handler/api-repo.dart';
import 'package:baseproject/core/constant/api_constants.dart';
import 'package:baseproject/models/category.dart';
import 'package:baseproject/models/top_head_lines_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // initialization api repo for accessing http function
  ApiRepository apiRepository;
  HomeController(this.apiRepository);

  var isLoading = true.obs;
  RxString categoryName="".obs;

  var topHeadLinesNewsList = List<TopHeadLinesNewsModel>.empty(growable: true).obs;
  var categoryList = List<CategoryModel>.empty(growable: true).obs;


  @override
  void onReady() {
    super.onReady();
    getSourceList();
  }

  //get all News list
  void getNewsList(categoryName) {
    isLoading.value=true;
    topHeadLinesNewsList.clear();
    Map<String,dynamic> newsParam={
      "country":ApiConstant.COUNTRY_CODE,
      "category":categoryName,
      "apiKey":ApiConstant.API_KEY
    };
    apiRepository.getTopHeadLineNews(newsParam).getResponse<Response<String>>((response) {
      if(response.data['status']=="ok"){
        isLoading.value=false;
        List newsListData=response.data['articles'];
        var parsingList=newsListData.map((m) => new TopHeadLinesNewsModel.fromJson(m)).toList();
        topHeadLinesNewsList.addAll(parsingList);
      }
    });

  }

  //get all Category by source news api
  void getSourceList() {
    categoryList.add(CategoryModel(category: "business",url:  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEYB-hL3Z9ucn3hw5gZJUt__UV5gQm9kASwV6TeFZNnclRxp4dDbOCwutTGAWw7J1BZTU&usqp=CAU" ,));
    categoryList.add(CategoryModel(category: "technology",url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF1E01q7VUqcaQkq5EU3jn1-bGbk44NTQdDK6sqR19CXfziemeUvtvxARuYgx_ZvVqjd0&usqp=CAU",));
    categoryList.add(CategoryModel(category: "general",url: "https://cdn.mos.cms.futurecdn.net/XfREyDUvNNapfMnMPV4QMk.jpg",));

    changeCategoryNews(categoryList[0].category);
  }

  void changeCategoryNews(categoryName){
    getNewsList(categoryName);
  }
}
