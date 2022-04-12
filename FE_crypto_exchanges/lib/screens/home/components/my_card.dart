import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String text;
  final String icon;
  final Function() onTap;

  MyCard({required this.title, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '$text',
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.7), fontSize: 14),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "$icon",
                    height: 50,
                    width: 50,
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Icon(Icons.arrow_forward),
                  Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
