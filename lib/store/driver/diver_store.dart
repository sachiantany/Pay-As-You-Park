import 'package:mobx/mobx.dart';
import 'package:pay_as_you_park/services/driver_service.dart';
import 'package:pay_as_you_park/store/error/error_store.dart';
import 'package:validators/validators.dart';

part 'diver_store.g.dart';

class DriverStore = _DriverStore with _$DriverStore;

abstract class _DriverStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _DriverStore() {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userEmail, validateUserEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String userEmail = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  String firstName = '';

  @observable
  String lastName = '';

  @observable
  String vehicleRegistrationNumber = '';

  @observable
  String vehicleWidth = '';

  @observable
  String vehicleLength = '';

  @observable
  String vehicleHeight = '';

  @observable
  String token = '';

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @computed
  bool get canLogin =>
      !formErrorStore.hasErrorsInLogin && userEmail.isNotEmpty && password.isNotEmpty;

  @computed
  bool get canRegister =>
      !formErrorStore.hasErrorsInRegister &&
          userEmail.isNotEmpty &&
          password.isNotEmpty &&
          confirmPassword.isNotEmpty;

  @computed
  bool get canForgetPassword =>
      !formErrorStore.hasErrorInForgotPassword && userEmail.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUserId(String value) {
    userEmail = value;
  }
  @action
  void setFisrtName(String value) {
    firstName = value;
  }
  @action
  void setLastName(String value) {
    lastName = value;
  }

  @action
  void setvehicleRegNo(String value) {
    vehicleRegistrationNumber = value;
  }

  @action
  void setWidth(String value) {
    vehicleWidth = value;
  }

  @action
  void setLength(String value) {
    vehicleLength = value;
  }

  @action
  void setHeight(String value) {
    vehicleHeight = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.userEmail = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.userEmail = 'Please enter a valid email address';
    } else {
      formErrorStore.userEmail = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      formErrorStore.password = "Password can't be empty";
    } else if (value.length < 6) {
      formErrorStore.password = "Password must be at-least 6 characters long";
    } else {
      formErrorStore.password = null;
    }
  }

  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      formErrorStore.confirmPassword = "Confirm password can't be empty";
    } else if (value != password) {
      formErrorStore.confirmPassword = "Password doen't match";
    } else {
      formErrorStore.confirmPassword = null;
    }
  }

  @action
  Future register() async {
    loading = true;
  }

  @action
  Future login() async {
    loading = true;
    DriverService().login(userEmail, password).then((val){
      if(val.data['result'] != null){
        loading = false;
        success = true;
      }else{
        loading = false;
        success = false;
        errorStore.errorMessage = val.data['message'];
      }
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.errorMessage = e.toString().contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
      print(e);
    });
  }

  @action
  Future registerDriver() async {
    loading = true;
    DriverService().registerDriver(firstName,lastName,userEmail, password,vehicleRegistrationNumber,vehicleWidth,vehicleLength,vehicleHeight).then((val){
      if(val.data['result'] != null){
        loading = false;
        success = true;
      }else{
        loading = false;
        success = false;
        errorStore.errorMessage = val.data['message'];
      }
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.errorMessage = e.toString().contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
      print(e);
    });
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }

  @action
  Future logout() async {
    loading = true;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUserEmail(userEmail);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? userEmail;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @observable
  String? fisrtName;

  @observable
  String? lastName;

  @observable
  String vehicleRegistrationNumber = '';

  @observable
  String vehicleWidth = '';

  @observable
  String vehicleLength = '';

  @observable
  String vehicleHeight = '';

  @computed
  bool get hasErrorsInLogin => userEmail != null || password != null;

  @computed
  bool get hasErrorsInRegister =>
      userEmail != null || password != null || confirmPassword != null;

  @computed
  bool get hasErrorInForgotPassword => userEmail != null;
}