import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class CategoryCell extends StatelessWidget {
  final Map cObj;
  final VoidCallback onTop;
const CategoryCell({super.key, required this.cObj, required this.onTop});

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(  
                  onTap: onTop,             
                   child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
Image.asset(cObj["image"].toString(), width: 85, height: 85,fit:BoxFit.cover,),
                    ),
                     const SizedBox(height: 8,),
                     Text(
   cObj["name"], textAlign: TextAlign.center,

    style: TextStyle(color: TColor.primaryText, fontSize: 14, fontWeight: FontWeight.w700),),

                ],),)
              );
      
    
  }
}