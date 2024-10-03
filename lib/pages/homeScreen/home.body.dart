import 'package:flutter/material.dart';
import 'package:global_med/pages/homeScreen/publications/publications.widget.dart';
import 'package:global_med/state/provider/globalmed.user.provider.dart';
import 'package:global_med/themes/themes.dart';
import 'package:global_med/utils/Size/sizer.dart';
import 'package:provider/provider.dart';

import '../../widgets/search.wid.get.dart';

class HomePart extends StatelessWidget {
  const HomePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final globalMedProvider = Provider.of<GlobalMedProviderUser>(context);

    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // CustomAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: SearchWidget(
                  label: 'Busca Doctores',
                  icon: Icon(
                    Icons.search,
                    size: 40.h,
                    color: primary,
                  ),
                  borderColor: Colors.black.withOpacity(0.1),
                  borderFocusedColor: Color(0xff0E0E0E)),
            ),
            SizedBox(
              height: 10.h,
            ),
            // Container(
            //   height: 50.h,
            //   padding: EdgeInsets.symmetric(vertical: 8.h),
            //   child: ReusableChipsRow(
            //     chipLabels: [
            //       'Marketing',
            //       'Finanzas',
            //       'Ventas',
            //       'Publicidad',
            //       'Liderazgo',
            //       'Bienestar'
            //     ],
            //     onSelectionChanged: (index, isSelected) {
            //       print(
            //           'Chip $index is now ${isSelected ? 'selected' : 'deselected'}');
            //     },
            //   ),
            // ),
            SizedBox(
              height: 20.h,
            ),
            // ClipRRect(
            //   borderRadius: BorderRadiusDirectional.all(Radius.circular(30.h)),
            //   child: FadeInImage.assetNetwork(
            //     placeholder: 'public/assets/loadings/lo3.gif',
            //     image: banner,
            //     imageErrorBuilder: (context, error, stackTrace) {
            //       return Image.asset(
            //           'public/assets/images/background_1.png'); // Ruta de la imagen por defecto
            //     },
            //   ),
            // ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Row(
                children: [
                  Text(
                    'Conexiones para ti',
                    style:
                        TextStyle(fontSize: 23.h, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'Filtrar',
                    style:
                        TextStyle(fontSize: 18.h, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       CardConexion(
            //         title: 'SCristhian',
            //         about: 'hola mundo',
            //         nroFollowers: '0',
            //       ),
            //     ],
            //   ),
            // ),

            // debemos volver a usar este carrusel
            // CarruselSocial(),
            SizedBox(
              height: 20.h,
            ),
            Divider(
              color: Colors.black.withOpacity(0.5),
            ),

            Publications(),

            // SocialCard(
            //   name: 'Crisis',
            //   ocupation: 'Crisis',
            //   content: "xaxa",
            //   imageProfile:
            //       "https://firebasestorage.googleapis.com/v0/b/trive-ntp.appspot.com/o/pictures%2Fp3.jpg?alt=media&token=27a456e6-c1ab-4e8a-bf2a-e05d70bcdbe6",
            //   imagesUrl: [
            //     "https://firebasestorage.googleapis.com/v0/b/trive-ntp.appspot.com/o/pictures%2Fp3.jpg?alt=media&token=27a456e6-c1ab-4e8a-bf2a-e05d70bcdbe6"
            //   ],
            //   topics: ["Finanzas"],
            // ),
            // SocialCard(),
          ],
        ),
      ),
    );
  }
}
