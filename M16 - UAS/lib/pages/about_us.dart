import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('About Us - CiViC'),
    //   ),
    //   body: Container(
    //     decoration: const BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage('assets/AboutUs.png'),
    //         fit: BoxFit.cover
    //       )
    //     ),
    //     child: ListView(
    //       children: const [
    //         TextField(),
    //         SizedBox(height: 10,),
    //         TextField(),
    //         SizedBox(height: 10,),
    //         TextField(),
    //         SizedBox(height: 10,),
    //         TextField(),
    //         SizedBox(height: 10,),
    //         TextField(),
    //         SizedBox(height: 10,),
    //         TextField(),
    //         SizedBox(height: 10,),
    //         TextField(),
    //         SizedBox(height: 10,),
    //         TextField(),
    //         SizedBox(height: 10,),
    //         TextField(),
    //         SizedBox(height: 10,),
    //         TextField(),
    //         SizedBox(height: 10,),
    //         TextField(),
    //       ],
    //     ),
    //   ),
    // );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/AboutUs.png'),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('About Us'),
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: const [
            TextField(),
            SizedBox(height: 10,),
            TextField(),
            SizedBox(height: 10,),
            TextField(),
            SizedBox(height: 10,),
            TextField(),
            SizedBox(height: 10,),
            TextField(),
            SizedBox(height: 10,),
            TextField(),
            SizedBox(height: 10,),
            TextField(),
            SizedBox(height: 10,),
            TextField(),
            SizedBox(height: 10,),
            TextField(),
            SizedBox(height: 10,),
            TextField(),
            SizedBox(height: 10,),
            TextField(),
          ],
        ),
      ),
    );
  }
}