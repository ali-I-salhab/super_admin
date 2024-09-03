import 'package:super_admin/Apiapplink.dart';

import '../../../../core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getme() async {
    var response = await crud.Sendrequest('GET', ApiApplinks.me);

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
