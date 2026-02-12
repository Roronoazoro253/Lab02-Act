import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const SimplePortfolioApp());
}

class SimplePortfolioApp extends StatelessWidget {
  const SimplePortfolioApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  String selectedPage = 'Home';
  late ScrollController _scrollController;
  
  @override
void initState() {
  super.initState();
  _scrollController = ScrollController();
}

Widget _buildContent() {
  if (selectedPage == 'Home') {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Image.asset(
            'lib2/assets/images/profile.jpg',
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Abidaan Chohan',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Computer Science Student',
          style: GoogleFonts.roboto(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
  return Text('Coming soon: $selectedPage');
}

@override
void dispose() {
  _scrollController.dispose();
  super.dispose();
}


@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xFFF5F5F5),
    appBar: AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      title: Text(
        'Portfolio',
         style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
        drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Abidaan Chohan',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Computer Science Student',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
  leading: Icon(Icons.home, color: Colors.teal),
  title: Text('Home'),
  onTap: () {
    Navigator.pop(context);
    setState(() {
      selectedPage = 'Home';
    });
  },
),
ListTile(
  leading: Icon(Icons.person, color: Colors.teal),
  title: Text('About'),
  onTap: () {
    Navigator.pop(context);
    setState(() {
      selectedPage = 'About';
    });
  },
),
ListTile(
  leading: Icon(Icons.lightbulb, color: Colors.teal),
  title: Text('Skills'),
  onTap: () {
    Navigator.pop(context);
    setState(() {
      selectedPage = 'Skills';
    });
  },
),
ListTile(
  leading: Icon(Icons.email, color: Colors.teal),
  title: Text('Contact'),
  onTap: () {
    Navigator.pop(context);
    setState(() {
      selectedPage = 'Contact';
    });
  },
),
Divider(),
ListTile(
  leading: Icon(Icons.download, color: Colors.teal),
  title: Text('Download Resume'),
  onTap: () {
    Navigator.pop(context);
    print('Download Resume tapped');
  },
),
        ],
      ),
    ),
    body: SingleChildScrollView(
  controller: _scrollController,
  child: Padding(
    padding: EdgeInsets.all(20),
    child: Center(
      child: _buildContent(),
    ),
  ),
),
  );
}
}