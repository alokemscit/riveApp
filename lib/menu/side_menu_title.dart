import 'package:abc/menu/info_card.dart';
import 'package:abc/menu/side_menu.dart';
 
import 'package:abc/utils/ReviAsset.dart';
import 'package:abc/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenuTitle extends StatelessWidget {
  const SideMenuTitle({
    super.key, required this.menu, required this.press, required this.riveoInit, required this.isActive,
  });

  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveoInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Divider(color: Colors.white24,height: 1,),
        ),

        Stack(
          children: [
  AnimatedPositioned(
    duration: Duration(milliseconds: 300),
  height: 56,
  width: isActive? 288:0,
  left: 0,
  curve: Curves.fastOutSlowIn,
  child:   Container(
  
    decoration: BoxDecoration(
  
      color: Color(0xFF6792FF),
  
      borderRadius: BorderRadius.all(Radius.circular(10)),
  
    ),
  
  ),
),
         
           ListTile(
            onTap: press,
            leading: SizedBox(
              height: 34,
              width: 34,
              child: RiveAnimation.asset(
                menu.src,
                artboard: menu.artboard,
                onInit: riveoInit,
              ),
            ),
            title: Text(
              menu.title,
              style: TextStyle(color: Colors.white),
            ),
          ),
      ],),
      ],
    );
  }
}
