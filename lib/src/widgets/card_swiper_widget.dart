import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class Cardswiper extends StatelessWidget {

  final List<Pelicula> pelicuals;

  Cardswiper({ @required this.pelicuals });




  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;


    return Container(
      padding: EdgeInsets.only(top: 5.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context,int index){

          pelicuals[index].uniqueId = '${pelicuals[index].id}-tarjeta';

          return Hero(
            tag: pelicuals[index].uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'detalle', arguments: pelicuals[index]),
                child: FadeInImage(
                  image: NetworkImage( pelicuals[index].getPosterImg() ),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
              )
            ),
          ); 
          
        },
        itemCount: pelicuals.length,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
  );
  }
}