import 'package:abc/constants.dart';
import 'package:abc/entrypoint/menu_button.dart';
import 'package:abc/home/home_screen.dart';
import 'package:abc/menu/side_menu.dart';
import 'package:abc/utils/ReviAsset.dart';
import 'package:abc/utils/animated_bar.dart';
import 'package:abc/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  RiveAsset selectedBottomNav = bottomNavs.first;
  late SMIBool isSidebarClosed;
  bool isSideMenuClose = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          Positioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            child: SideMenu(),
          ),
          Transform.translate(
              offset: Offset(isSideMenuClose?0:288, 0),
              child: Transform.scale(
                  scale: isSideMenuClose?1:0.8,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      child: HomePage()))),
          MenuButton(
            riveOnInit: (Artboard artboard) {
              StateMachineController _controller = RiveUtils2.getRiveController(
                  artboard,
                  stateMachineName: "State Machine");
              isSidebarClosed = _controller.findSMI("isOpen") as SMIBool;
              isSidebarClosed.value = true;
            },
            press: () {
              isSidebarClosed.value = !isSidebarClosed.value;
              setState(() {
                isSideMenuClose=isSidebarClosed.value;
              });
            },
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: backgroundColor2.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // TODO: Set mainAxisAlignment
            children: [
              ...List.generate(
                bottomNavs.length,
                (index) => GestureDetector(
                  onTap: () {
                    // TODO: Play animation on tap

                    bottomNavs[index].input!.change(true);
                    if (bottomNavs[index] != selectedBottomNav) {
                      setState(() {
                        selectedBottomNav = bottomNavs[index];
                      });
                    }
                    Future.delayed(const Duration(seconds: 1), () {
                      bottomNavs[index].input!.change(false);
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // TODO: Animated Bar
                      AnimatedBar(
                          isActive: bottomNavs[index] == selectedBottomNav),
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: Opacity(
                          opacity:
                              bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                          child: RiveAnimation.asset(
                            bottomNavs[index].src,
                            artboard: bottomNavs[index].artboard,
                            onInit: (artboard) {
                              // TODO: Set the input value

                              StateMachineController controller =
                                  RiveUtils2.getRiveController(artboard,
                                      stateMachineName:
                                          bottomNavs[index].stateMachineName);

                              bottomNavs[index].input =
                                  controller.findSMI("active") as SMIBool;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
