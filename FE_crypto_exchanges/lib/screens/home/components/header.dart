import 'package:crypto_exchanges/theme/color_palette.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 25,
                width: 25,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  "assets/images/profile.png",
                  fit: BoxFit.fill,
                )),
          ),
          Expanded(
            child: Container(
              height: 30,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                onTap: () {},
                decoration: InputDecoration(
                    hintText: "Search",
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.withOpacity(0.8),
                    )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 25,
                width: 25,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  "assets/images/support.png",
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 25,
                width: 25,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  "assets/images/bell.png",
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(width: 10,),
        ],
      ),
    );
  }
}
