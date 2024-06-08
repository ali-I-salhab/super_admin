import 'package:super_admin/Apiapplink.dart';

import '../../../../core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getrooms() async {
    var response = await crud.postdata(ApiApplinks.getrooms, {});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
