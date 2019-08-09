/*
 * @Author: MartinAk 
 * @Date: 2019-08-06 08:37:00 
 * @Last Modified by: MartinAk
 * @Last Modified time: 2019-08-06 08:53:35
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HyperlinkButton extends StatelessWidget {
  final String _url;
  final String _text;

  HyperlinkButton(this._url, this._text);

  _launchURL() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        _text,
        style: TextStyle(decoration: TextDecoration.underline),
      ),
      onTap: _launchURL,
    );
  }
}