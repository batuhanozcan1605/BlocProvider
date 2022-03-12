import 'package:bloc_lecture/BlocListing/KisilerDurum.dart';
import 'package:bloc_lecture/KisilerCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListing extends StatefulWidget {
  const BlocListing({Key? key}) : super(key: key);

  @override
  State<BlocListing> createState() => _BlocListingState();
}

class _BlocListingState extends State<BlocListing> {

  @override
  void initState() {
    super.initState();
    context.read<KisilerCubit>().kisileriAlveTetikle();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc List"),
      ),
      body: BlocBuilder<KisilerCubit,KisilerDurum>(
        builder: (context, kisilerDurum){

          if(kisilerDurum is KisilerYuklendi) {
            var kisiListesi = kisilerDurum.kisiListesi;

            return ListView.builder(
                itemCount: kisiListesi.length,
                itemBuilder: (context,index){
                  var kisi = kisiListesi[index];

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                );

          }else{
           return Center();
          }
        },
      ),
    );
  }
}

