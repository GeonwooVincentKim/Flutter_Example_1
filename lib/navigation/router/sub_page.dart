import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/navigation/design/card/card.dart';
import 'package:flutter_application_1_1/navigation/design/divider/divider.dart';

class SubPage extends StatefulWidget {
  const SubPage({super.key});

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  Widget _buildSubPageBody() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => TransparentDivider(),
        itemCount: 12,
        itemBuilder: (context, index) {
          return SubPageCard();
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSubPageBody()
    );
  }
}