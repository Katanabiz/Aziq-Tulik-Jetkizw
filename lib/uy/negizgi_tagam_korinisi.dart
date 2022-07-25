import 'package:flutter/material.dart';

import '../vidjetter/ulken_matin_vidjet.dart';

class NeigizgiTagamKorinisi extends StatefulWidget {
  const NeigizgiTagamKorinisi({Key? key}) : super(key: key);

  @override
  State<NeigizgiTagamKorinisi> createState() => _NeigizgiTagamKorinisiState();
}

class _NeigizgiTagamKorinisiState extends State<NeigizgiTagamKorinisi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            child: Container(
                margin: const EdgeInsets.only(bottom: 15, top: 45),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          UlkenMatinVidjet(text: "Kazakhstan",color:AppColors.mainColor,),
                          Text("Qala")
                        ],
                      ),
                      Center(
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.mainColor),
                          child: const Icon(Icons.search, color: Colors.white),
                        ),
                      )
                    ])))
      ],
    ));
  }
}
