import 'package:flutter/material.dart';
import 'package:task/viewmodel/dog_view_model.dart';
import 'package:provider/provider.dart';

class RandonDogImage extends StatefulWidget {
  const RandonDogImage({Key? key}) : super(key: key);

  @override
  State<RandonDogImage> createState() => _RandonDogImageState();
}

class _RandonDogImageState extends State<RandonDogImage> {
  @override
  Widget build(BuildContext context) {
    DogViewModel usersViewModel = context.watch<DogViewModel>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                usersViewModel.getDogImage();
              },
              child: Text('Refresh Image'),
            ),
            SizedBox(height: 20),
           usersViewModel.loading==false
                ? Image.network(
              usersViewModel.mainDog.message ?? '',
              height: 300,
              width: 300,
              fit: BoxFit.cover,
             errorBuilder: (a,b,c) {
               return Text('404 not Found');
             },
             loadingBuilder: (BuildContext context, Widget child,
                 ImageChunkEvent? loadingProgress) {
               if (loadingProgress == null) return child;
               return Center(
                 child: CircularProgressIndicator(
                   value: loadingProgress.expectedTotalBytes != null
                       ? loadingProgress.cumulativeBytesLoaded /
                       loadingProgress.expectedTotalBytes!
                       : null,
                 ),
               );
             },
            )
                : CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
