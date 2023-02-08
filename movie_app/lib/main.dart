import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScaffold(),
    );
  }
}

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int currentIndex = 0;
  List<Widget> screens = [
    const Home(),
    const Search(),
    const WatchList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: const Color.fromRGBO(103, 104, 109, 1),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главное',
            backgroundColor: Color.fromRGBO(36, 42, 50, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Поиск',
            backgroundColor: Color.fromRGBO(36, 42, 50, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_outline,
            ),
            label: 'Просмотренные ',
            backgroundColor: Color.fromRGBO(36, 42, 50, 1),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: SafeArea(child: screens[currentIndex]),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

 



  @override
  State<Home> createState() => _HomeState();
}


 
class _HomeState extends State<Home> {
  @override
 
  
 
  Widget build(BuildContext context) {
  
   List <String> images1 = [
     'images/1.png',
     'images/2.png',
     'images/3.png',  

   ];
   List <String> images2 = [
     'images/4.png',
     'images/5.png',
     'images/6.png',  
    
   ];  
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StatusBar(),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 42, left: 24),
            child: Text(
              "Что вы хотите посмотреть?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 93, left: 24, right: 24),
            child: TextFormField(
              enableInteractiveSelection: true,
              toolbarOptions: const ToolbarOptions(
                paste: true,
                selectAll: true,
                copy: true,
                cut: true,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                suffixIcon: const SizedBox(
                  width: 15.30,
                  height: 16.00,
                  child: Padding(
                    padding: EdgeInsets.only(right: 336.18),
                    child: Icon(
                      Icons.search,
                      color: Color.fromRGBO(103, 104, 109, 1),
                    ),
                  ),
                ),
                hintText: 'Фильмы и сериалы',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 143, 143, 154),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(103, 104, 109, 1),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(103, 104, 109, 1),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(103, 104, 109, 1),
                  ),
                ),
                
              ),
            ),
          ),
        
         Padding(
           padding: const EdgeInsets.only(left: 20, bottom: 12),
           child: SizedBox(
            height: 200 , 
             child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: images1.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120, 
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(images1[index])
                    )
                  ),
                );
              } ,
             ),
           ),
         ),
        
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 12),
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: images2.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(images2[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        ],
      ),
    );
  }
}



class IconWidget extends StatelessWidget {
  const IconWidget({
  super.key, 
  required this.icon});
 
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){}, icon: Icon(icon),
    );
  }
}




class StatusBar extends StatelessWidget {
  const StatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
    );
  }
}

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
   backgroundColor: Color.fromARGB(255, 0, 0, 0),
        
      body: SearchPage(),
    );
  }
}





class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
    const SizedBox(height: 18,),
    const  SizedBox(
        
        height: 20,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text('Поиск', style: TextStyle(color: Colors.white, fontSize: 16,
                 fontFamily: 'Montserrat4',
                fontWeight: FontWeight.w600,
                ),
                ),
        ),
      ),
            
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
          child: TextFormField(
            enableInteractiveSelection: true,
            toolbarOptions: const ToolbarOptions(
              paste: true,
              selectAll: true,
              copy: true,
              cut: true,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 255, 255, 255),
              suffixIcon: const SizedBox(
                width: 15.30,
                height: 16.00,
                child: Padding(
                  padding: EdgeInsets.only(right: 336.18),
                  child: Icon(
                    Icons.search,
                    color: Color.fromRGBO(103, 104, 109, 1),
                  ),
                ),
              ),
              hintText: 'Бойцовский клуб',
              hintStyle: const TextStyle(
                color: Color.fromARGB(103, 104, 109, 1),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(103, 104, 109, 1),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(103, 104, 109, 1),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(103, 104, 109, 1),
                ),
              ),
              
            ),
          ),
        ),
       const SizedBox(
          height: 144,
        ),
        SizedBox(
          width: 252,
          height: 190,
          child: ClipRRect(
            child: Image.asset(
              "images/can't be found.png",
            ),
          ),
        ),
       const SizedBox(height: 16),
       
      ],
    );
  }
}
