import 'package:flutter/material.dart';
import '../constants.dart';

class DecoratedTextField extends StatelessWidget {
  final String hint;
  final Widget icon;
  final bool secure;
  final TextInputType Ktype;
  DecoratedTextField(
      {required this.hint,
      this.icon = icons,
      this.secure = true,
      this.Ktype = TextInputType.visiblePassword});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: secure,
      keyboardType: Ktype,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kEnabledBorderColor,
          ),
          borderRadius: BorderRadius.circular(30), //<-- SEE HERE
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kFocusedBorderSideColor,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: hint,
        suffixIcon: icon,
      ),
    );
  }
}

class EditedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double TitlePadding;
  final IconData BarIcon;
  final String Title;
  final double AppbarHeight;
  final bool menu;

  EditedAppBar(
      {required this.TitlePadding,
      required this.BarIcon,
      required this.Title,
      required this.AppbarHeight,
      this.menu = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          Image(
            alignment: Alignment.topRight,
            width: 70.0,
            height: 70.0,
            image: AssetImage('images/edited-logo.png'),
          ),
          SizedBox(width: 20.0),
        ],
        leading: menu
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: kToolbarHeight * 1.3),
                child: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  },
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: kToolbarHeight * 1.3),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
        backgroundColor: Color(0xFF349873),
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        flexibleSpace: Column(
          children: [
            Expanded(child: Container()),
            Container(
              color: Color(0xFF349873),
              width: double.infinity,
              child: Column(children: [
                //Expanded(child: Container()),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: TitlePadding),
                  child: Text('Dan Energy Ethiopia', style: topTitle),
                ),
                Container(
                  padding: EdgeInsets.only(left: TitlePadding),
                  margin: EdgeInsets.symmetric(vertical: 0.0),
                  child: Row(
                    children: [
                      Icon(
                        BarIcon,
                        size: 40.0,
                        color: Colors.black,
                      ),
                      Text(' $Title', style: topTitle)
                    ],
                  ),
                )
              ]),
            ),
          ],
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(AppbarHeight);
}

class DashboardContainer extends StatelessWidget {
  final String Title;
  final Widget child;
  final double left;
  final double right;
  final Color color;
  DashboardContainer(
      {required this.Title,
      required this.child,
      this.left = 50.0,
      this.right = 5.0,
      this.color = Colors.transparent});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.only(
          left: left,
          right: right,
          top: 10.0,
          bottom: 7.0,
        ),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Text(Title, style: cardTitle),
            child,
          ],
        ),
      ),
    );
  }
}
