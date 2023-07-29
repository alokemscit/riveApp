import 'package:abc/menu/side_menu_title.dart';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../constants.dart';
import '../utils/ReviAsset.dart';
import '../utils/rive_utils.dart';
import 'info_card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _side_menuState();
}

class _side_menuState extends State<SideMenu> {
  RiveAsset selectedmenu = sideMenus.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:backgroundColor2,
      body: SafeArea(
          child: Container(
        width: 288,
        height: double.infinity,
        color: Color(0xFF17203A),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Divider(
                color: Colors.white24,
                height: 1,
              ),
            ),
            InfoCard(
              name: "Aloke Sikder",
              profession: "Software Developer",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                "Browse".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white70),
              ),
            ),
            // Here the icon of rive
            // side_menus()
            ...sideMenus.map((menu) => SideMenuTitle(
                  menu: menu,
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedmenu = menu;
                    });
                  },
                  riveoInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils2.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  isActive: selectedmenu==menu,
                )),

                Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                "History".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white70),
              ),
            ),

...sideMenus2.map((menu) => SideMenuTitle(
                  menu: menu,
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedmenu = menu;
                    });
                  },
                  riveoInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils2.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  isActive: selectedmenu==menu,
                )),


          ],
        ),
      )),
    );
  }
}
