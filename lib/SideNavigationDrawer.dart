import 'package:flutter/material.dart';

class SideNavigationDrawer extends StatelessWidget{

  Widget showDrawer(){
    return Drawer(
    child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
       _createHeader(),
       _createDrawerItem(
          icon: Icons.contacts,
          text: 'Contacts',
          //onTap: () => Navigator.pushReplacementNamed(context, DrawerRoutes.contacts),
        ),

       _createDrawerItem(
          icon: Icons.event, 
          text: 'Events',
         // onTap: () => Navigator.pushReplacementNamed(context, DrawerRoutes.events),
        ),


       _createDrawerItem(
          icon: Icons.note, 
          text: 'Notes',
         // onTap: () => Navigator.pushReplacementNamed(context, DrawerRoutes.notes),
        ),

        Divider(),
       _createDrawerItem(icon: Icons.collections_bookmark, text:'Steps'),
       _createDrawerItem(icon: Icons.face, text: 'Authors'),
       _createDrawerItem(icon: Icons.account_box, text: 'Flutter Documentation'),
       _createDrawerItem(icon: Icons.stars, text: 'Useful Links'),
       Divider(),
       _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
        ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
    ],
  ),
            );
  }


  Widget _createHeader() {
  return DrawerHeader(

      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
    
          image: DecorationImage(
              fit: BoxFit.fill,
              image:  AssetImage('assets/back.jpg'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 20.0,
            left: 16.0,
            child: Text("Fashion Club",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}




Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}

  @override
  Widget build(BuildContext context) {
    return showDrawer();
  }
}