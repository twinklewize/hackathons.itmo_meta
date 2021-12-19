import 'package:flutter/material.dart';

class UniversaModalBottomSheet extends StatelessWidget {
  UniversaModalBottomSheet({
    Key? key,
    required this.content,
    this.title,
    this.description,
    this.color = Colors.white,
  }) : super(key: key);

  String? title;
  Widget? description;
  Widget content;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 49),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              title != null
                  ? Column(
                      children: [
                        const SizedBox(height: 15),

                        // Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Container()),
                            Text(
                              '$title',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      ],
                    )
                  : Container(),

              // description (необязательный блок)
              description == null
                  ? Container()
                  : Column(
                      children: [
                        const SizedBox(height: 15),
                        description!,
                        //SizedBox(height: 15),
                      ],
                    ),

              // Главное содержание bottom sheet (обязательный блок)
              Column(
                children: [
                  //SizedBox(height: 15),
                  content,
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
