import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'tools.dart';

///
/// Esta clase contiene todos los mensajes de dialogo que se mostrarán dentro de la aplicación
///

class CustomDialogs {
  showMessageDialog(message, context, hasloading) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(.8),
      builder: (BuildContext context) {
        return AlertDialog(
          shape: dimens.borderRadius(10.0),
          content: Text(message ?? ''),
          actions: <Widget>[
            TextButton(
              child: Text(
                'ACEPTAR',
                style: TextStyle(color: customColors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((_) {
      /// En caso de que tenga un loading lo cierro tambien.
      if (hasloading) {
        Navigator.pop(context);
      }
    });
  }

  showLoadingDialog(context) {
    try {
      showDialog(
          context: context,
          useSafeArea: false,
          barrierColor: Colors.black.withOpacity(.8),
          barrierDismissible: false,
          builder: (context) {
            return const Loader();
          });
    } catch (e) {
      log("Error on showLoadingDiaglog", error: e);
    }
  }

  hideLoadingDialog(context) {
    try {
      Navigator.pop(context);
    } catch (e) {
      log("Error on hideLoadingDiaglog", error: e);
    }
  }

  showDinamicDialog(
    BuildContext context, {
    required Widget child,
    Function? whenComplete,
    bool? dimisible,
  }) {
    return showDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(.8),
        barrierDismissible: dimisible ?? false,
        builder: (context) {
          return AlertDialog(
              titlePadding: const EdgeInsets.all(0),
              contentPadding: const EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: child);
        }).whenComplete(() {
      if (whenComplete != null) {
        whenComplete();
      }
    });
  }

  Future showBottomSheet(BuildContext context,
      {required Widget child,
      bool isScrollControlled = true,
      bool? isDidmissible}) {
    return showModalBottomSheet(
      context: context,
      isDismissible: isDidmissible ?? true,
      isScrollControlled: isScrollControlled,
      barrierColor: Colors.black.withOpacity(.8),
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => child,
    );
  }
}

final CustomDialogs dialogs = CustomDialogs();

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: const Color(0xFF180040),
          body: SafeArea(
            top: false,
            bottom: false,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              reverse: true,
              child: SizedBox(
                  width: dimens.fullWidth(context),
                  height: dimens.fullHeight(context),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 150,
                            width: 150,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/load.gif',
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                            width: dimens.fullWidth(context),
                            child: const CustomText(
                              "Validando...",
                              textColor: Colors.white,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            )),
                      ])),
            ),
          )),
    );
  }
}
