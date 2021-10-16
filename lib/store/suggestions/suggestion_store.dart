import 'package:mobx/mobx.dart';
import 'package:pay_as_you_park/services/suggestion_yard_service.dart';
import 'package:pay_as_you_park/store/error/error_store.dart';
import 'package:validators/validators.dart';

/*part 'suggestion_store.g.dart';

class SuggestionStore = _SuggestionStore with _$SuggestionStore;*/

class SuggestionStore with Store {
  // store for handling form errors

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  SuggestionStore();

  // disposers:-----------------------------------------------------------------


  // store variables:-----------------------------------------------------------
  @observable
  String latitude = '';

  @observable
  String longitude = '';

  @observable
  String yard_id = '';

  @observable
  bool success = false;

  @action
  Future GetYardSuggestion(lat, lon, length, width, height) async {
    print('...........................inside......................................');
    await SuggestionYardService().getParkingYardSuggestion(lat, lon, length, width, height).then((val){
      print('---------------------------------------------------------------------------------------------');
      print(val);
      print(val.data['status_code']);
      if(val.data['status_code'] == 200){
        var data2 = val.data['data'];
        var predictData = data2['prediction'];
        setLatitude(predictData['latitude'].toString());
        setLongitude(predictData['longitude'].toString());
        setYardId(predictData['yard_id'].toString());
        success = true;
      }else{
        success = false;
        print('..................false...........');
        errorStore.errorMessage = val.data['message'];
      }
    }).catchError((e) {
      success = false;
      print(e.toString());
      print('..................catch............');
      errorStore.errorMessage = e.toString().contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
      print(e);
    });

  }


  // actions:-------------------------------------------------------------------
  @action
  void setLatitude(String value) {
    latitude = value;
  }
  @action
  void setLongitude(String value) {
    longitude = value;
  }

  @action
  void setYardId(String value) {
    yard_id = value;
  }

}