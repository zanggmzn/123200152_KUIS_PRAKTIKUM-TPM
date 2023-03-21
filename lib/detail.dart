import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kuis152_prakttpm/data_buku.dart';

class HalamanDetailBuku extends StatefulWidget {
  final DataBuku book;
  const HalamanDetailBuku({Key? key, required this.book}) : super(key: key);

  @override
  State<HalamanDetailBuku> createState() => _HalamanDetailBukuState();
}

class _HalamanDetailBukuState extends State<HalamanDetailBuku> {
  final Uri _url = Uri.parse('https://flutter.dev');
  bool isAvailable = true;
  //
  String ketersediaan = "Tersedia";
  var warna = Colors.green;
  statusbutton() {
    if (isAvailable == false) {
      return null;
    } else {
      return () {
        String text = " ";
        if (isAvailable == true) {
          setState(() {
            text = "Berhasil Meminjam Buku!";
            ketersediaan = "Tidak Tersedia";
            warna = Colors.red;
            isAvailable= !isAvailable;
          });
        }
        SnackBar snackBar = SnackBar(content: Text(text), backgroundColor: Colors.green,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      };
    }
  }

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.book.title}"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  await goToWebPage(widget.book.link);
                },
                icon: Icon(Icons.search, color: Colors.white)),
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 220,
                width: 270,
                padding: const EdgeInsets.all(20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.network(widget.book.imageLink),
                  ],
                ),
              ),
              Card(
                child: Container(
                  height: 200,
                  width: 700,
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      //biar bertingkat diberi column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Judul                      : " + widget.book.title,
                            style: TextStyle(fontSize: 16),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Penulis                   : " + widget.book.author,
                            style: TextStyle(fontSize: 16),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Bahasa                   : " +
                                widget.book.language,
                            style: TextStyle(fontSize: 16),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Negara                   : " + widget.book.country,
                            style: TextStyle(fontSize: 16),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Jumlah Halaman : " + widget.book.pages.toString(),
                            style: TextStyle(fontSize: 16),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Tahun Terbit         : " +
                                widget.book.year.toString(),
                            style: TextStyle(fontSize: 16),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Status                   : ' + ketersediaan,
                            style: TextStyle(fontSize: 16, color: warna),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: 35,
                  width: 700,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(20),
                    ),
                    onPressed: statusbutton(),
                    child: const Text('Pinjam Buku'),
                  ),
                ),
            ],
          ),
        ));
  }
}
