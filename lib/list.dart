import 'package:flutter/material.dart';
import 'package:kuis152_prakttpm/data_buku.dart';
import 'package:kuis152_prakttpm/detail.dart';
class HalamanListBuku extends StatelessWidget {
  const HalamanListBuku({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pinjam Buku"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: listBuku.length, 
        itemBuilder: (BuildContext context, int index) { 
          final DataBuku book = listBuku[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => HalamanDetailBuku(book:book),));
            },
             child: Card(
              elevation: 10, //shadow
              child: Container(
                //ukuran card
                height: MediaQuery.of(context).size.height/4,
                width: 300,
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        //ini ukuran foto
                        height: 400, width: 150,
                        child: Image.network(book.imageLink)
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //biar bertingkat diberi column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text(
                          book.title,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          book.author,
                          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
         },
      ),
    );
  }
}