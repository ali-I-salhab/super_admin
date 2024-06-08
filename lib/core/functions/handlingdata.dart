import 'package:super_admin/core/class/statusrequest.dart';

handlingdata(response) {
  // here response either statusrequest or map
  if (response is Statusrequest) {
    // here response comeing from crud
    // either
    // server failure
    // server exception
    // server offlinefailure

    return response;
//failurre
  } else {
    return Statusrequest.success;
  }
}
