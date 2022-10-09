import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tarea3/bloc/book_bloc.dart';
import 'package:tarea3/bookItem.dart';
import 'package:tarea3/book_page.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libreria Free to Play'),
        backgroundColor: ThemeData.dark().primaryColor,
      ),
      body: Column(
        children: [
          inialMenuWidget(context),
          BlocConsumer<BookBloc, BookState>(
            listener: (context, state) {
              if (state is GetBookErrorState) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      content: Text('No se encontraron coincidencias')));
              }
            },
            builder: (context, state) {
              if (state is GetBookLoadingState) {
                return loadingMenuWidget();
              } else if (state is GetBookSuccessState) {
                var listBooks = context.watch<BookBloc>().bookList;
                return bookItem(listBooks);
              } else {
                return Column(
                  children: [
                    SizedBox(height:150,),
                    Text('Ingrese la palabra para buscar el libro'),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget bookItem(List<BookItem> listBooks) {
    return Expanded(
      child: Container(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: listBooks.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Image.network('${listBooks[index].urlImage}'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  BookPage(bookItem: listBooks[index])));
                        },
                      ),
                    ),
                    Text(
                      '${listBooks[index].titulo}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class loadingMenuWidget extends StatelessWidget {
  const loadingMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 380,
        child: Shimmer.fromColors(
          baseColor: Color.fromARGB(255, 207, 201, 201),
          highlightColor: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  loadingBook(),
                  loadingBook(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  loadingBook(),
                  loadingBook(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  loadingBook(),
                  loadingBook(),
                ],
              ),
            ],
          ),
        ));
  }
}

class loadingBook extends StatelessWidget {
  const loadingBook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              color: Colors.grey,
              height: 150,
              width: 130,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: Colors.grey,
                height: 20,
                width: 130,
              )),
        ),
      ],
    );
  }
}

Column inialMenuWidget(BuildContext context) {
  var searchText = TextEditingController();

  return Column(
    children: [
      TextField(
        controller: searchText,
        decoration: InputDecoration(
            hintText: 'Ingresa el titulo',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('hola');
                try {
                  BlocProvider.of<BookBloc>(context)
                      .add(GetBookEvent(bookName: searchText.text));
                } catch (e) {
                  print(e);
                }
                print('adios');
              },
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: Colors.grey))),
      ),
    ],
  );
}
