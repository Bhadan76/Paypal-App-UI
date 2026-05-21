
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final String image;
  final String tittle;
  final String description;
  final Widget ? customContent;
  const OnboardingItem({super.key, required this.image, required this.tittle, required this.description, this.customContent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          if(customContent != null)
            customContent !
          else
            Image.asset(
              height: 220,
              fit: BoxFit.contain,
              image,
              errorBuilder: (context,error,stackTrace){
                return Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: const Icon(Icons.image,size: 60,color: Colors.grey,),
                );
              },

            ),
          SizedBox(height: 20,),
          if(tittle.isNotEmpty)
          //Tittle
            Text(tittle,
              textAlign: TextAlign.center,style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0.2,

              ),
            ),
          if (tittle.isNotEmpty) const SizedBox(height: 14),
          //Description
          Text(description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              height: 2,
              color: Colors.grey.shade600,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
