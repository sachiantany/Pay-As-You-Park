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




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
            AppIconWidget(image: 'assets/icons/ic_appicon.png'),
            SizedBox(height: 24.0),
            _buildUserIdField(),
            _buildPasswordField(),
            _buildForgotPasswordButton(),
            _buildSignInButton()
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

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: FractionalOffset.centerRight,
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        child: Text(
          'Forgot Password',
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: Colors.orangeAccent),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSignInButton() {
    return RoundedButtonWidget(
      buttonText: 'Sign In',
      buttonColor: Colors.orangeAccent,
      textColor: Colors.white,
      onPressed: () async {
        if (_store.canLogin) {
          DeviceUtils.hideKeyboard(context);
          _store.login();
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
