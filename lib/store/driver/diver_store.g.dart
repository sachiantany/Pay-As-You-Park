// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diver_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DriverStore on _DriverStore, Store {
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin => (_$canLoginComputed ??=
          Computed<bool>(() => super.canLogin, name: '_DriverStore.canLogin'))
      .value;
  Computed<bool>? _$canRegisterComputed;

  @override
  bool get canRegister =>
      (_$canRegisterComputed ??= Computed<bool>(() => super.canRegister,
              name: '_DriverStore.canRegister'))
          .value;
  Computed<bool>? _$canForgetPasswordComputed;

  @override
  bool get canForgetPassword => (_$canForgetPasswordComputed ??= Computed<bool>(
          () => super.canForgetPassword,
          name: '_DriverStore.canForgetPassword'))
      .value;

  final _$userEmailAtom = Atom(name: '_DriverStore.userEmail');

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  final _$passwordAtom = Atom(name: '_DriverStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom = Atom(name: '_DriverStore.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$firstNameAtom = Atom(name: '_DriverStore.firstName');

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  final _$lastNameAtom = Atom(name: '_DriverStore.lastName');

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  final _$vehicleRegistrationNumberAtom =
      Atom(name: '_DriverStore.vehicleRegistrationNumber');

  @override
  String get vehicleRegistrationNumber {
    _$vehicleRegistrationNumberAtom.reportRead();
    return super.vehicleRegistrationNumber;
  }

  @override
  set vehicleRegistrationNumber(String value) {
    _$vehicleRegistrationNumberAtom
        .reportWrite(value, super.vehicleRegistrationNumber, () {
      super.vehicleRegistrationNumber = value;
    });
  }

  final _$vehicleWidthAtom = Atom(name: '_DriverStore.vehicleWidth');

  @override
  String get vehicleWidth {
    _$vehicleWidthAtom.reportRead();
    return super.vehicleWidth;
  }

  @override
  set vehicleWidth(String value) {
    _$vehicleWidthAtom.reportWrite(value, super.vehicleWidth, () {
      super.vehicleWidth = value;
    });
  }

  final _$vehicleLengthAtom = Atom(name: '_DriverStore.vehicleLength');

  @override
  String get vehicleLength {
    _$vehicleLengthAtom.reportRead();
    return super.vehicleLength;
  }

  @override
  set vehicleLength(String value) {
    _$vehicleLengthAtom.reportWrite(value, super.vehicleLength, () {
      super.vehicleLength = value;
    });
  }

  final _$vehicleHeightAtom = Atom(name: '_DriverStore.vehicleHeight');

  @override
  String get vehicleHeight {
    _$vehicleHeightAtom.reportRead();
    return super.vehicleHeight;
  }

  @override
  set vehicleHeight(String value) {
    _$vehicleHeightAtom.reportWrite(value, super.vehicleHeight, () {
      super.vehicleHeight = value;
    });
  }

  final _$tokenAtom = Atom(name: '_DriverStore.token');

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$successAtom = Atom(name: '_DriverStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$loadingAtom = Atom(name: '_DriverStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$registerAsyncAction = AsyncAction('_DriverStore.register');

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$loginAsyncAction = AsyncAction('_DriverStore.login');

  @override
  Future<dynamic> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$registerDriverAsyncAction =
      AsyncAction('_DriverStore.registerDriver');

  @override
  Future<dynamic> registerDriver() {
    return _$registerDriverAsyncAction.run(() => super.registerDriver());
  }

  final _$forgotPasswordAsyncAction =
      AsyncAction('_DriverStore.forgotPassword');

  @override
  Future<dynamic> forgotPassword() {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword());
  }

  final _$logoutAsyncAction = AsyncAction('_DriverStore.logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_DriverStoreActionController = ActionController(name: '_DriverStore');

  @override
  void setUserId(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFisrtName(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.setFisrtName');
    try {
      return super.setFisrtName(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastName(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.setLastName');
    try {
      return super.setLastName(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setvehicleRegNo(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.setvehicleRegNo');
    try {
      return super.setvehicleRegNo(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWidth(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.setWidth');
    try {
      return super.setWidth(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLength(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.setLength');
    try {
      return super.setLength(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHeight(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.setHeight');
    try {
      return super.setHeight(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmPassword(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
password: ${password},
confirmPassword: ${confirmPassword},
firstName: ${firstName},
lastName: ${lastName},
vehicleRegistrationNumber: ${vehicleRegistrationNumber},
vehicleWidth: ${vehicleWidth},
vehicleLength: ${vehicleLength},
vehicleHeight: ${vehicleHeight},
token: ${token},
success: ${success},
loading: ${loading},
canLogin: ${canLogin},
canRegister: ${canRegister},
canForgetPassword: ${canForgetPassword}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorsInLoginComputed;

  @override
  bool get hasErrorsInLogin => (_$hasErrorsInLoginComputed ??= Computed<bool>(
          () => super.hasErrorsInLogin,
          name: '_FormErrorStore.hasErrorsInLogin'))
      .value;
  Computed<bool>? _$hasErrorsInRegisterComputed;

  @override
  bool get hasErrorsInRegister => (_$hasErrorsInRegisterComputed ??=
          Computed<bool>(() => super.hasErrorsInRegister,
              name: '_FormErrorStore.hasErrorsInRegister'))
      .value;
  Computed<bool>? _$hasErrorInForgotPasswordComputed;

  @override
  bool get hasErrorInForgotPassword => (_$hasErrorInForgotPasswordComputed ??=
          Computed<bool>(() => super.hasErrorInForgotPassword,
              name: '_FormErrorStore.hasErrorInForgotPassword'))
      .value;

  final _$userEmailAtom = Atom(name: '_FormErrorStore.userEmail');

  @override
  String? get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String? value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  final _$passwordAtom = Atom(name: '_FormErrorStore.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom = Atom(name: '_FormErrorStore.confirmPassword');

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$fisrtNameAtom = Atom(name: '_FormErrorStore.fisrtName');

  @override
  String? get fisrtName {
    _$fisrtNameAtom.reportRead();
    return super.fisrtName;
  }

  @override
  set fisrtName(String? value) {
    _$fisrtNameAtom.reportWrite(value, super.fisrtName, () {
      super.fisrtName = value;
    });
  }

  final _$lastNameAtom = Atom(name: '_FormErrorStore.lastName');

  @override
  String? get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String? value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  final _$vehicleRegistrationNumberAtom =
      Atom(name: '_FormErrorStore.vehicleRegistrationNumber');

  @override
  String get vehicleRegistrationNumber {
    _$vehicleRegistrationNumberAtom.reportRead();
    return super.vehicleRegistrationNumber;
  }

  @override
  set vehicleRegistrationNumber(String value) {
    _$vehicleRegistrationNumberAtom
        .reportWrite(value, super.vehicleRegistrationNumber, () {
      super.vehicleRegistrationNumber = value;
    });
  }

  final _$vehicleWidthAtom = Atom(name: '_FormErrorStore.vehicleWidth');

  @override
  String get vehicleWidth {
    _$vehicleWidthAtom.reportRead();
    return super.vehicleWidth;
  }

  @override
  set vehicleWidth(String value) {
    _$vehicleWidthAtom.reportWrite(value, super.vehicleWidth, () {
      super.vehicleWidth = value;
    });
  }

  final _$vehicleLengthAtom = Atom(name: '_FormErrorStore.vehicleLength');

  @override
  String get vehicleLength {
    _$vehicleLengthAtom.reportRead();
    return super.vehicleLength;
  }

  @override
  set vehicleLength(String value) {
    _$vehicleLengthAtom.reportWrite(value, super.vehicleLength, () {
      super.vehicleLength = value;
    });
  }

  final _$vehicleHeightAtom = Atom(name: '_FormErrorStore.vehicleHeight');

  @override
  String get vehicleHeight {
    _$vehicleHeightAtom.reportRead();
    return super.vehicleHeight;
  }

  @override
  set vehicleHeight(String value) {
    _$vehicleHeightAtom.reportWrite(value, super.vehicleHeight, () {
      super.vehicleHeight = value;
    });
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
password: ${password},
confirmPassword: ${confirmPassword},
fisrtName: ${fisrtName},
lastName: ${lastName},
vehicleRegistrationNumber: ${vehicleRegistrationNumber},
vehicleWidth: ${vehicleWidth},
vehicleLength: ${vehicleLength},
vehicleHeight: ${vehicleHeight},
hasErrorsInLogin: ${hasErrorsInLogin},
hasErrorsInRegister: ${hasErrorsInRegister},
hasErrorInForgotPassword: ${hasErrorInForgotPassword}
    ''';
  }
}
