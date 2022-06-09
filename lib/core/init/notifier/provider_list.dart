import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:random_question/core/init/navigation/navigation_service.dart';
import 'package:random_question/views/favorite_list/view-model/favorite_list_view_model.dart';
import 'package:random_question/views/main_page/view-model/main_page_view_model.dart';
import 'package:random_question/views/random_question/view-model/random_question_view_model.dart';

import '../../../views/random_question/service/random_question_service.dart';
import '../network/network_manager.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
        create: (context) => RandomQuestionViewModel(
              service:
                  RandomQuestionService(NetworkManager.instance.networkManager),
            )),
    ChangeNotifierProvider(create: (context) => MainPageViewModel()),
    ChangeNotifierProvider(create: (context) => FavoriteListViewModel()),
    Provider.value(value: NavigationService.instance)
  ];
}
