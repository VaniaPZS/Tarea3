import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea3/bloc/book_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tarea3/bookItem.dart';
import 'package:tarea3/share_button.dart';

class BookPage extends StatelessWidget {
  final BookItem bookItem;

  BookPage({super.key, required this.bookItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData.dark().primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Detalles del libro'),
            SizedBox(
              width: 50,
            ),
            ShareButton(
              url: bookItem.urlPreview,
              buttonIcon: Icon(Icons.public_rounded),
              destiny_name: 'Web',
            ),
            IconButton(
              onPressed: () {
                _shareUrl(context);
              },
              icon: Icon(Icons.share),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(24),
                  height: 350,
                  child: Image.network(
                    '${bookItem.urlImage}',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Text(
              '${bookItem.titulo}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${bookItem.fechaPublicacion}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Páginas: ${bookItem.longitud}',
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: Text('${bookItem.descripcion}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 80),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _shareUrl(BuildContext context) async {
    await Share.share(
        'No puedo dejar de leer ${bookItem.titulo}, chécalo, tiene sólo ${bookItem.longitud} páginas! ');
  }
}
