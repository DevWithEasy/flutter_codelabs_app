import 'package:code_labs/components/skelton.dart';
import 'package:flutter/material.dart';

class CourseSkelton extends StatelessWidget {
  const CourseSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index){
        return Container(
          padding: const EdgeInsets.all(12),
          height: 100,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Skelton(height: 60,width: 60),
                  SizedBox(height: 5,),
                  Skelton(height: 10,width: 60)
                ],
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Skelton(height: 16,width: double.infinity),
                    SizedBox(height: 5,),
                    Skelton(height: 12,width: 200),
                    SizedBox(height: 5,),
                    Skelton(height: 12,width: 150),
                  ],
                ),
              )
            ],
          ),
        );
      }

    );
  }
}
