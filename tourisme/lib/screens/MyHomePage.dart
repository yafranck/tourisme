import 'package:tourisme/screens/PostScreen.dart';

import 'package:tourisme/screens/UserInfoPage.dart';


import 'package:tourisme/widgets/HomeBottomBar.dart';


import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final category = [
    'Tours jumelles',
    'Saintes annes',
    'La corniche',
    'Loufoulakari',
    'Bobo',
    'Youlounkoyi',
  ];


  //final WhatsAppProfile _profile = WhatsAppProfile();
  List<bool> isBookmarkedList = List.generate(5, (index) => false);
  int currentIndex = 0; // Initialisez l'index sélectionné à 0

  void updateIndex(int index) {
    setState(() {
      currentIndex = index; // Mettre à jour l'index sélectionné
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //preferredSize: Size.fromHeight(90.0),
        //child: HomeAppBar(),
        title: Text("data"),
      ),
      extendBody: true,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Mettez ici le code pour gérer le clic sur l'élément Home
                Navigator.pop(context); // Ferme le drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Mettez ici le code pour gérer le clic sur l'élément Settings
                Navigator.pop(context); // Ferme le drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                // Mettez ici le code pour gérer le clic sur l'élément Settings
                //Navigator.pop(context); // Ferme le drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WhatsAppProfile(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Partager'),
              onTap: () {
                // Mettez ici le code pour gérer le clic sur l'élément Settings
                Navigator.pop(context); // Ferme le drawer
              },
            ),
            // Ajoutez d'autres éléments de navigation au besoin
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 160,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/img${index + 1}.jpg"),
                                    fit: BoxFit.cover,
                                    opacity: 0.7)),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Inverse l'état du marquage
                                      isBookmarkedList[index] =
                                          !isBookmarkedList[index];
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      isBookmarkedList[index]
                                          ? Icons.bookmark
                                          : Icons.bookmark_border_outlined,
                                      color: isBookmarkedList[index]
                                          ? Colors.blue
                                          : Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    category[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )),
              ],
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    for (int i = 0; i < 6; i++)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              )
                            ]),
                        child: Text(
                          category[i],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/img${index + 1}.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nom cité",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.more_vert,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text(
                              "2.3",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                })
          ],
        )),
      )),
      bottomNavigationBar: HomeBottomBar(
        currentIndex: currentIndex,
        onTap: updateIndex,
      ), // Utilisation du widget de la barre de navigation incurvée
    );
  }
}
