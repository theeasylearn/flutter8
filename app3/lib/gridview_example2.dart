import 'package:flutter/material.dart';

void main() {
  runApp(GridViewExample2());
}
class GridViewExample2 extends StatelessWidget
{
  List<Map<String, String>> countries = [
    { "name": "Germany", "flag": "https://flagpedia.net/data/flags/w580/de.png", "capital": "Berlin" },
    { "name": "United Kingdom", "flag": "https://flagpedia.net/data/flags/w580/gb.png", "capital": "London" },
    { "name": "France", "flag": "https://flagpedia.net/data/flags/w580/fr.png", "capital": "Paris" },
    { "name": "Italy", "flag": "https://flagpedia.net/data/flags/w580/it.png", "capital": "Rome" },
    { "name": "Spain", "flag": "https://flagpedia.net/data/flags/w580/es.png", "capital": "Madrid" },
    { "name": "Netherlands", "flag": "https://flagpedia.net/data/flags/w580/nl.png", "capital": "Amsterdam" },
    { "name": "Belgium", "flag": "https://flagpedia.net/data/flags/w580/be.png", "capital": "Brussels" },
    { "name": "Switzerland", "flag": "https://flagpedia.net/data/flags/w580/ch.png", "capital": "Bern" },
    { "name": "Austria", "flag": "https://flagpedia.net/data/flags/w580/at.png", "capital": "Vienna" },
    { "name": "Portugal", "flag": "https://flagpedia.net/data/flags/w580/pt.png", "capital": "Lisbon" },
    { "name": "Sweden", "flag": "https://flagpedia.net/data/flags/w580/se.png", "capital": "Stockholm" },
    { "name": "Norway", "flag": "https://flagpedia.net/data/flags/w580/no.png", "capital": "Oslo" },
    { "name": "Denmark", "flag": "https://flagpedia.net/data/flags/w580/dk.png", "capital": "Copenhagen" },
    { "name": "Finland", "flag": "https://flagpedia.net/data/flags/w580/fi.png", "capital": "Helsinki" },
    { "name": "Greece", "flag": "https://flagpedia.net/data/flags/w580/gr.png", "capital": "Athens" },
    { "name": "Poland", "flag": "https://flagpedia.net/data/flags/w580/pl.png", "capital": "Warsaw" },
    { "name": "Czech Republic", "flag": "https://flagpedia.net/data/flags/w580/cz.png", "capital": "Prague" },
    { "name": "Hungary", "flag": "https://flagpedia.net/data/flags/w580/hu.png", "capital": "Budapest" },
    { "name": "Ireland", "flag": "https://flagpedia.net/data/flags/w580/ie.png", "capital": "Dublin" },
    { "name": "Slovakia", "flag": "https://flagpedia.net/data/flags/w580/sk.png", "capital": "Bratislava" },
    { "name": "China", "flag": "https://flagpedia.net/data/flags/w580/cn.png", "capital": "Beijing" },
    { "name": "India", "flag": "https://flagpedia.net/data/flags/w580/in.png", "capital": "New Delhi" },
    { "name": "Japan", "flag": "https://flagpedia.net/data/flags/w580/jp.png", "capital": "Tokyo" },
    { "name": "South Korea", "flag": "https://flagpedia.net/data/flags/w580/kr.png", "capital": "Seoul" },
    { "name": "Indonesia", "flag": "https://flagpedia.net/data/flags/w580/id.png", "capital": "Jakarta" },
    { "name": "Pakistan", "flag": "https://flagpedia.net/data/flags/w580/pk.png", "capital": "Islamabad" },
    { "name": "Bangladesh", "flag": "https://flagpedia.net/data/flags/w580/bd.png", "capital": "Dhaka" },
    { "name": "Vietnam", "flag": "https://flagpedia.net/data/flags/w580/vn.png", "capital": "Hanoi" },
    { "name": "Thailand", "flag": "https://flagpedia.net/data/flags/w580/th.png", "capital": "Bangkok" },
    { "name": "Philippines", "flag": "https://flagpedia.net/data/flags/w580/ph.png", "capital": "Manila" },
    { "name": "Malaysia", "flag": "https://flagpedia.net/data/flags/w580/my.png", "capital": "Kuala Lumpur" },
    { "name": "Singapore", "flag": "https://flagpedia.net/data/flags/w580/sg.png", "capital": "Singapore" },
    { "name": "Afghanistan", "flag": "https://flagpedia.net/data/flags/w580/af.png", "capital": "Kabul" },
    { "name": "Saudi Arabia", "flag": "https://flagpedia.net/data/flags/w580/sa.png", "capital": "Riyadh" },
    { "name": "Iran", "flag": "https://flagpedia.net/data/flags/w580/ir.png", "capital": "Tehran" },
    { "name": "Turkey", "flag": "https://flagpedia.net/data/flags/w580/tr.png", "capital": "Ankara" },
    { "name": "Iraq", "flag": "https://flagpedia.net/data/flags/w580/iq.png", "capital": "Baghdad" },
    { "name": "United Arab Emirates", "flag": "https://flagpedia.net/data/flags/w580/ae.png", "capital": "Abu Dhabi" },
    { "name": "Israel", "flag": "https://flagpedia.net/data/flags/w580/il.png", "capital": "Jerusalem" },
    { "name": "Qatar", "flag": "https://flagpedia.net/data/flags/w580/qa.png", "capital": "Doha" },
    { "name": "Kuwait", "flag": "https://flagpedia.net/data/flags/w580/kw.png", "capital": "Kuwait City" },
    { "name": "Jordan", "flag": "https://flagpedia.net/data/flags/w580/jo.png", "capital": "Amman" },
    { "name": "Sri Lanka", "flag": "https://flagpedia.net/data/flags/w580/lk.png", "capital": "Colombo" },
    { "name": "Nepal", "flag": "https://flagpedia.net/data/flags/w580/np.png", "capital": "Kathmandu" },
    { "name": "Myanmar", "flag": "https://flagpedia.net/data/flags/w580/mm.png", "capital": "Naypyidaw" },
    { "name": "North Korea", "flag": "https://flagpedia.net/data/flags/w580/kp.png", "capital": "Pyongyang" },
    { "name": "Kazakhstan", "flag": "https://flagpedia.net/data/flags/w580/kz.png", "capital": "Nur-Sultan" },
    { "name": "Uzbekistan", "flag": "https://flagpedia.net/data/flags/w580/uz.png", "capital": "Tashkent" },
    { "name": "Turkmenistan", "flag": "https://flagpedia.net/data/flags/w580/tm.png", "capital": "Ashgabat" },
    { "name": "Tajikistan", "flag": "https://flagpedia.net/data/flags/w580/tj.png", "capital": "Dushanbe" },
    { "name": "Kyrgyzstan", "flag": "https://flagpedia.net/data/flags/w580/kg.png", "capital": "Bishkek" },
    { "name": "Mongolia", "flag": "https://flagpedia.net/data/flags/w580/mn.png", "capital": "Ulaanbaatar" },
    { "name": "Brunei", "flag": "https://flagpedia.net/data/flags/w580/bn.png", "capital": "Bandar Seri Begawan" },
    { "name": "Laos", "flag": "https://flagpedia.net/data/flags/w580/la.png", "capital": "Vientiane" },
    { "name": "Bhutan", "flag": "https://flagpedia.net/data/flags/w580/bt.png", "capital": "Thimphu" },
    { "name": "Maldives", "flag": "https://flagpedia.net/data/flags/w580/mv.png", "capital": "Malé" },
    { "name": "Oman", "flag": "https://flagpedia.net/data/flags/w580/om.png", "capital": "Muscat" },
    { "name": "Yemen", "flag": "https://flagpedia.net/data/flags/w580/ye.png", "capital": "Sana'a" },
    { "name": "Lebanon", "flag": "https://flagpedia.net/data/flags/w580/lb.png", "capital": "Beirut" },
    { "name": "Syria", "flag": "https://flagpedia.net/data/flags/w580/sy.png", "capital": "Damascus" },
    { "name": "Armenia", "flag": "https://flagpedia.net/data/flags/w580/am.png", "capital": "Yerevan" },
    { "name": "Azerbaijan", "flag": "https://flagpedia.net/data/flags/w580/az.png", "capital": "Baku" },
    { "name": "Georgia", "flag": "https://flagpedia.net/data/flags/w580/ge.png", "capital": "Tbilisi" },
    { "name": "Cyprus", "flag": "https://flagpedia.net/data/flags/w580/cy.png", "capital": "Nicosia" }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Example of ListView"),
        ),
        body: GridView.builder(
            itemCount: countries.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 4,

            ),
            itemBuilder: (context,index){
              return SizedBox(
                width: (MediaQuery.of(context).size.width/2) - 2,
                height: (MediaQuery.of(context).size.height/3) - 6,
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        FittedBox (
                            fit: BoxFit.fitWidth,
                            child: Text(countries[index]['name'].toString(),
                              style: TextStyle(fontSize: 24,),
                            )),
                        SizedBox(height: 10),
                        Expanded(
                          child: Image.network(
                            countries[index]['flag'].toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          countries[index]['capital'].toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class AutoSizeText {
}
