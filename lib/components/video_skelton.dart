import 'package:code_labs/components/skelton.dart';
import 'package:flutter/material.dart';

class VideoSkelton extends StatelessWidget {
  const VideoSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Skelton(height: 180, width: double.infinity,),
            const SizedBox(height: 10,),
            const Row(
              children: [
                Expanded(child: Skelton(height: 50)),
                SizedBox(width: 10,),
                Expanded(child: Skelton(height: 50)),
              ],
            ),
            const SizedBox(height: 20,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skelton(height: 20, width: 150,),
                Skelton(height: 20, width: 100,)
              ],
            ),
            const SizedBox(height: 16,),
            GridView.builder(
              primary: false,
              shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1 / 0.55,
                          ),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index){
                return Skelton(height: 100,);
              },
            )
          ],
        ),
      ),
    );
  }
}
