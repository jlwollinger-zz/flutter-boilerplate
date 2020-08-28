import 'package:flutter/material.dart';

class AlertYesNo {
  String title;
  String text;
  Function onYes;
  Function onNo;

  AlertYesNo(this.title, this.text, this.onYes, {this.onNo});

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(this.title),
          content: Text(this.text),
          actions: <Widget>[
            FlatButton(
                child: Text("Yes"),
                onPressed: () => {Navigator.of(context).pop(), onYes()}),
            FlatButton(
                child: Text("No"),
                onPressed: () => {
                      Navigator.of(context).pop(),
                      if (onNo != null) this.onNo()
                    }),
          ],
        );
      },
    );
  }
}
