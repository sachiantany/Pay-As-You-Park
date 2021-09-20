import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_as_you_park/store/driver/diver_store.dart';
import 'package:pay_as_you_park/utils/device/device_util.dart';
import 'package:pay_as_you_park/utils/routes/routes.dart';
import 'package:pay_as_you_park/widgets/app_icon_widget.dart';
import 'package:pay_as_you_park/widgets/empty_app_bar_widget.dart';
import 'package:pay_as_you_park/widgets/progress_indicator_widget.dart';
import 'package:pay_as_you_park/widgets/rounded_button_widget.dart';
import 'package:pay_as_you_park/widgets/textfield_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_as_you_park/constants/assets.dart';
import 'package:another_flushbar/flushbar_helper.dart';




class DriverRegisterScreen extends StatefulWidget {
  const DriverRegisterScreen({Key? key}) : super(key: key);

  @override
  _DriverRegisterScreen createState() => _DriverRegisterScreen();
}

class _DriverRegisterScreen extends State<DriverRegisterScreen> {

  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _vehicleRegNoController = TextEditingController();
  TextEditingController _widthController = TextEditingController();
  TextEditingController _lengthController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  final _store = DriverStore();


  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: _buildLeftSide(),
              ),
              Expanded(
                flex: 1,
                child: _buildRightSide(),
              ),
            ],
          )
              : Center(child: _buildRightSide()),
          Observer(
            builder: (context) {
              return _store.success
                  ? navigate(context)
                  : _showErrorMessage(_store.errorStore.errorMessage);
            },
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _store.loading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(
        Assets.carBackground,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildFirstNameField(),
            _buildLastNameField(),
            _buildUserIdField(),
            _buildRegistrationNumberField(),
            _buildWidthField(),
            _buildLengthField(),
            _buildHeightField(),
            _buildPasswordField(),
            _buildSignUpButton()
          ],
        ),
      ),
    );
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'User Email',
          inputType: TextInputType.emailAddress,
          icon: Icons.person,
          iconColor: Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setUserId(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.userEmail,
        );
      },
    );
  }

  Widget _buildFirstNameField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'First Name',
          inputType: TextInputType.text,
          icon: Icons.event_note_sharp,
          iconColor: Colors.black54,
          textController: _firstNameController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setFisrtName(_firstNameController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.fisrtName,
        );
      },
    );
  }

  Widget _buildLastNameField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'Last Name',
          inputType: TextInputType.text,
          icon: Icons.event_note_sharp,
          iconColor: Colors.black54,
          textController: _lastNameController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setLastName(_lastNameController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.lastName,
        );
      },
    );
  }

  Widget _buildRegistrationNumberField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'Vehicle Reg No',
          inputType: TextInputType.text,
          icon: Icons.event_note_sharp,
          iconColor: Colors.black54,
          textController: _vehicleRegNoController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setvehicleRegNo(_vehicleRegNoController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.vehicleRegistrationNumber,
        );
      },
    );
  }

  Widget _buildWidthField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'Vehicle Width',
          inputType: TextInputType.text,
          icon: Icons.event_note_sharp,
          iconColor: Colors.black54,
          textController: _widthController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setWidth(_widthController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.vehicleWidth,
        );
      },
    );
  }

  Widget _buildLengthField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'Vehicle Length',
          inputType: TextInputType.text,
          icon: Icons.event_note_sharp,
          iconColor: Colors.black54,
          textController: _lengthController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setLength(_lengthController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.vehicleLength,
        );
      },
    );
  }

  Widget _buildHeightField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'Vehicle Height',
          inputType: TextInputType.text,
          icon: Icons.event_note_sharp,
          iconColor: Colors.black54,
          textController: _heightController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setHeight(_heightController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.vehicleHeight,
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'Password',
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          iconColor: Colors.black54,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: _store.formErrorStore.password,
          onChanged: (value) {
            _store.setPassword(_passwordController.text);
          },
        );
      },
    );
  }

  Widget _buildSignUpButton() {
    return RoundedButtonWidget(
      buttonText: 'Sign In',
      buttonColor: Colors.orangeAccent,
      textColor: Colors.white,
      onPressed: () async {
        if (_store.canLogin) {
          DeviceUtils.hideKeyboard(context);
          _store.registerDriver();
        } else {
          _showErrorMessage('Please fill in all fields');
        }
      },
    );
  }

  Widget navigate(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.homepage, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: 'Something went wrong',
            duration: Duration(seconds: 3),
          )
            ..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

}
