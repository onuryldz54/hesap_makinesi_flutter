import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HesapMakinesi(),
    );
  }
}
class HesapMakinesi extends StatefulWidget {
  @override
  _HesapMakinesi createState() => _HesapMakinesi();
}

class _HesapMakinesi extends State<HesapMakinesi> {
  dynamic displaytxt = 20;
  //Widget Buton Tanımlama
  Widget hesapbuton(String btntxt,Color btncolor,Color txtcolor){
    return  Container(
      child: RaisedButton(
        onPressed: (){
          hesaplama(btntxt);
        },
        child: Text('$btntxt',
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(12),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    //Hesap Makinesi Yapımı
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Hesap Makinesi'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Hesap Makinesi Görünümü
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('$text',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                hesapbuton('AC',Colors.grey,Colors.black),
                hesapbuton('+/-',Colors.grey,Colors.black),
                hesapbuton('+',Colors.amber,Colors.white),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                hesapbuton('7',Colors.grey,Colors.white),
                hesapbuton('8',Colors.grey,Colors.white),
                hesapbuton('9',Colors.grey,Colors.white),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                hesapbuton('4',Colors.grey,Colors.white),
                hesapbuton('5',Colors.grey,Colors.white),
                hesapbuton('6',Colors.grey,Colors.white),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                hesapbuton('1',Colors.grey,Colors.white),
                hesapbuton('2',Colors.grey,Colors.white),
                hesapbuton('3',Colors.grey,Colors.white),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                hesapbuton('0',Colors.grey,Colors.white),
                hesapbuton('.',Colors.grey,Colors.white),
                hesapbuton('=',Colors.amber,Colors.white),
              ],
            ),
            SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }

  //Hesap Makinesi Toplama ve AC Mantığı
  dynamic text ='0';
  double numaraBir = 0;
  double numIki = 0;

  dynamic sonuc = '';
  dynamic finalSonucu = '';
  dynamic islem = '';
  dynamic onislem = '';
  void hesaplama(btnText) {

    if(btnText  == 'AC') {
      text ='0';
      numaraBir = 0;
      numIki = 0;
      sonuc = '';
      finalSonucu = '0';
      islem = '';
      onislem = '';

    } else if( islem == '=' && btnText == '=') {

      if(onislem == '+') {
        finalSonucu = add();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numaraBir == 0) {
        numaraBir = double.parse(sonuc);
      } else {
        numIki = double.parse(sonuc);
      }

      if(islem == '+') {
        finalSonucu = add();
      }
      onislem = islem;
      islem = btnText;
      sonuc = '';
    }

    else if(btnText == '+/-') {
      sonuc.toString().startsWith('-') ? sonuc = sonuc.toString().substring(1): sonuc = '-'+sonuc.toString();
      finalSonucu = sonuc;
    }

    else {
      sonuc = sonuc + btnText;
      finalSonucu = sonuc;
    }

    setState(() {
      text = finalSonucu;
    });
  }

  String add() {
    sonuc = (numaraBir + numIki).toString();
    numaraBir = double.parse(sonuc);
    return doesContainDecimal(sonuc);
  }

  String doesContainDecimal(dynamic sonuc) {

    if(sonuc.toString().contains('.')) {
      List<String> splitDecimal = sonuc.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return sonuc = splitDecimal[0].toString();
    }
    return sonuc;
  }


}