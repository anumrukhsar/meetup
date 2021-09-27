import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetup/controllers/eventlist_controller.dart';
import 'package:meetup/screens/event_detail.dart';

class EventItem extends StatelessWidget{
  var item;
  EventListController ec= Get.find();

  EventItem({this.item});
  @override
  Widget build(BuildContext context) {
   return Card(
     child:
     Column(
       mainAxisSize: MainAxisSize.min,
       children: [
         GestureDetector(
           onTap: ()=>openDetail(),
           child: ClipRRect(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
             child: Hero(
               tag: item.name,
               child: Image.network(item.img,fit:BoxFit.cover,height: 200,width: MediaQuery.of(context).size.width, loadingBuilder: (context,child,loadingProgress){
                 if(loadingProgress==null) return child;
                 return Container(
                   height: 200,
                 child: Center(child: SizedBox(height:30,width: 30,child: CircularProgressIndicator())));
               },),
             ),
           ),
         ),
         Container(
           padding: EdgeInsets.all(10.0),
           width: MediaQuery.of(context).size.width,
           child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(item.time,style: GoogleFonts.mukta(textStyle: TextStyle(color: Colors.orange,fontSize: 14,fontWeight: FontWeight.w200)),),
                 Text(item.name,style: GoogleFonts.mukta(textStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600)),),
                 Text(item.location,style: GoogleFonts.mukta(textStyle: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w200)),),
                 Text('1.5K Interested - 525 Going',style: GoogleFonts.mukta(textStyle: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w200)),),
                 GestureDetector(
                   onTap: ()=>{
                      ec.onInterested(item)
                   },

                   child: Obx(()=>Container(
                     padding: EdgeInsets.symmetric(vertical: 6.0),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(8.0),
                         color: item.isGoing.value?Colors.orange:Colors.grey
                     ),
                     width: MediaQuery.of(context).size.width,
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(item.isGoing.value?Icons.star:Icons.star_border,color: Colors.white,),
                         SizedBox(width: 10,),
                         Text('Interested',style: GoogleFonts.mukta(textStyle: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w200)))
                       ],
                     ),
                   )),
                 ),


               ]
           ),),

       ],
     ),
   );
  }

  void openDetail(){
    Get.to(EventDetail(index: ec.eventList.indexOf(item),));
  }
}