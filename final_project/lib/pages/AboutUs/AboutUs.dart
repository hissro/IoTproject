import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class AboutUs extends StatefulWidget
{
  const AboutUs({super.key});
  @override
  State<AboutUs> createState() => _AboutUsState();
}


class _AboutUsState extends State<AboutUs>
{
   Widget build(BuildContext context)
    {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: <Widget>
              [

                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: 
                    [
                      AppBarButton(
                        icon: Icons.arrow_back,
                        
                      ),
                      // SvgPicture.asset("assets/icons/menu.svg"),
                      
                    ],
                  ),
                ),
                AvatarImage(),


                const  SizedBox(   height: 30,   ),
                const  SizedBox(height: 30),

                const Text(
                  'Smart Agriculture',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color( 0xFF16a085),
                      fontWeight: FontWeight.w700,
                       ),
                ),

                
                const SizedBox(height: 15),

                const Text(
                  'Ahfad University for Women',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontFamily: "noura"),
                ),

                  const SizedBox(height: 15),
                
                ProfileListItems(),
              ],
            ),
          )
        ],
      ),
    );
  }
}



class AppBarButton extends StatelessWidget
 {
  final IconData icon;

  const AppBarButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade200,
          boxShadow: [
            BoxShadow(
              color: kLightBlack,
              offset: Offset(1, 1),
              blurRadius: 10,
            ),
            BoxShadow(
              color: kWhite,
              offset: Offset(-1, -1),
              blurRadius: 10,
            ),
          ]),
      child: 
        IconButton(
            icon: Icon( icon , color:  Color( 0xFF16a085 ) ),
            onPressed: () => Navigator.of(context).pop(),
          ), 
    
    );
  }
}

class AvatarImage extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding:const EdgeInsets.all(8),
      decoration: avatarDecoration,
      child: Container(
        decoration: avatarDecoration,
        padding:const EdgeInsets.all(3),
        child:  Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),    //  
            ),
          ),
        ),
      ),
    );
  }
}
 
 
class ProfileListItems extends StatelessWidget
 {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const <Widget>
        [
          ProfileListItem(
            icon: LineAwesomeIcons.info_circle_solid,
            text: 'Manahil Mahmoud Garii Bargo',
            id: '201700271',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.info_circle_solid,
            text: 'Tebian Alargm Mohamed Ahmed Mohamed Omer',
            id: '201700406',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.info_circle_solid,
            text: 'Tasabeeh Abd Alhai Mohammed sabr',
            id: '201700404',
          ),
          
        ],
      ),
    );
  }
}



class ProfileListItem extends StatelessWidget 
{
  final IconData icon;
  final String text ,  id;
  final bool hasNavigation;

  const ProfileListItem(
    {
     required this.icon,
     required  this. id,
     required this.text,
     this.hasNavigation = true,   
    })  ;

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(
        horizontal: 1,
      ).copyWith(
        bottom: 20,
      ),
      
      padding:const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 2
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade300,
      ),
      child: Row(
        children: <Widget>
        [

          Icon(
            icon,
            size: 35,
            color: const Color.fromARGB(255, 55, 97, 67)  ,
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(
            "$text\n$id",
            style: kTitleTextStyle.copyWith(  fontWeight: FontWeight.w200, color: Color.fromARGB(255, 55, 97, 67) ,  fontFamily: "noura" ),
            ),
          ),
          
        ],
      ),
    );
  }
}


const kTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

BoxDecoration avatarDecoration = BoxDecoration(

    shape: BoxShape.circle,
    color: Colors.grey.shade200,
    boxShadow: const [
      BoxShadow(
        color: Colors.white,
        offset: Offset(10, 10),
        blurRadius: 10,
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(-10, -10),
        blurRadius: 10,
      ),
    ]
);


Color kAppPrimaryColor = Color( 0xFF16a085 );
Color kWhite = Colors.white;
Color kLightBlack = Colors.black.withOpacity(0.075);
Color mCC = Colors.green.withOpacity(0.65);
Color fCL = Colors.grey.shade600;