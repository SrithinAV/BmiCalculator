import 'package:flutter/material.dart';
import 'dart:math';

class CalculateBmi {

  CalculateBmi({required this.weight, required this.height});

   int  height;
   int weight;
   double? bmi;

   String calcuate_bmi()
   {
     bmi = (weight/pow(height/100, 2));
     return bmi!.toStringAsFixed(1);
   }

   String check_bmi()
   {
     if(bmi! > 24.9)
       {
         return 'Overweight';
       }
     else if(bmi! > 18.00)
       {
         return 'Normal';
       }
     else
       {
         return 'Underweight';
       }
   }

   String giveinstruct()
   {
     if(bmi! > 24.9)
       {
         return 'Eat some food! increase calorie intake';
       }
     else if(bmi! > 18.00)
     {
       return 'Your body is perfect';
     }
     else
     {
       return 'Eat less do a calorie downtake';
     }
   }




}