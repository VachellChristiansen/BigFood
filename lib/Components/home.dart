import 'package:duds/UserData/userdata.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../UserData/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      
      child: MaterialApp(
        title: 'Homepage',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User _user;

  int zingerBurgerQuantity = 0;
  int rollParathaQuantity = 0;
  int burgerQuantity = 0;
  int sandwichQuantity = 0;
  int pizzaRollQuantity = 0;
  int mushroomSoupQuantity = 0;

  int _zingerBurgerQuantity = 0;
  int _rollParathaQuantity = 0;
  int _burgerQuantity = 0;
  int _sandwichQuantity = 0;
  int _pizzaRollQuantity = 0;
  int _mushroomSoupQuantity = 0;
  
  List<String> FakeName = [
    "Jane Lit",
    "Red Dave",
    "Patrick",
    "Ashley",
    "Mina",
  ];
  List<String> review = [
  "The pizza was great!",
  "I like the burgers!",
  "A tasty treat!",
  "Thanks BigFood!",
  "Love it!",
];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      addToCart();
      fetchData(context);
    });
  }

  void incrementBurger() {
    setState(() {
      burgerQuantity++;
      _burgerQuantity = burgerQuantity;
      updateCart();
    });
  }

  void decrementBurger() {
    setState(() {
      if (burgerQuantity > 0) {
        burgerQuantity--;
        _burgerQuantity = burgerQuantity;
        updateCart();
      }
    });
  }

  void incrementSandwich() {
    setState(() {
      sandwichQuantity++;
      _sandwichQuantity = sandwichQuantity;
      updateCart();
    });
  }

  void decrementSandwich() {
    setState(() {
      if (sandwichQuantity > 0) {
        sandwichQuantity--;
        _sandwichQuantity = sandwichQuantity;
        updateCart();
      }
    });
  }

  void incrementPizzaRoll() {
    setState(() {
      pizzaRollQuantity++;
      _pizzaRollQuantity = pizzaRollQuantity;
      updateCart();
    });
  }

  void decrementPizzaRoll() {
    setState(() {
      if (pizzaRollQuantity > 0) {
        pizzaRollQuantity--;
        _pizzaRollQuantity = pizzaRollQuantity;
        updateCart();
      }
    });
  }

  void incrementmushroomSoup() {
    setState(() {
      mushroomSoupQuantity++;
      _mushroomSoupQuantity = mushroomSoupQuantity;
      updateCart();
    });
  }

  void decrementmushroomSoup() {
    setState(() {
      if (mushroomSoupQuantity > 0) {
        mushroomSoupQuantity--;
        _mushroomSoupQuantity = mushroomSoupQuantity;
        updateCart();
      }
    });
  }

  void incrementZingerBurgerQuantity() {
    setState(() {
      zingerBurgerQuantity++;
      _zingerBurgerQuantity =zingerBurgerQuantity;
      updateCart();
    });
  }

  void decrementZingerBurgerQuantity() {
    setState(() {
      if (zingerBurgerQuantity > 0) {
        zingerBurgerQuantity--;
        _zingerBurgerQuantity =zingerBurgerQuantity;
        updateCart();
      }
    });
  }

  void incrementRollParathaQuantity() {
    setState(() {
      rollParathaQuantity++;
      _rollParathaQuantity = rollParathaQuantity;
      updateCart();
    });
  }

  void decrementRollParathaQuantity() {
    setState(() {
      if (rollParathaQuantity > 0) {
        rollParathaQuantity--;
        _rollParathaQuantity = rollParathaQuantity;
        updateCart();
      }
    });
  }

void updateCart() async {
  _user = _auth.currentUser!;
  final String userUID = _user.uid;
  final String userEmail = _user.email!; // Ambil email pengguna

  try {
    CollectionReference cartRef = _firestore.collection('carts');
    DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(userUID).get();

    if (userSnapshot.exists) {
      await cartRef.doc(userUID).update({
        'email': userEmail, // Simpan email pengguna di dokumen keranjang
        'burgerQuantity': burgerQuantity,
        'sandwichQuantity': sandwichQuantity,
        'pizzaRollQuantity': pizzaRollQuantity,
        'mushroomSoupQuantity': mushroomSoupQuantity,
        'zingerBurgerQuantity': zingerBurgerQuantity,
        'rollParathaQuantity': rollParathaQuantity,
      });
    } else {
      await cartRef.doc(userUID).set({
        'email': userEmail, // Simpan email pengguna di dokumen keranjang
        'burgerQuantity': burgerQuantity,
        'sandwichQuantity': sandwichQuantity,
        'pizzaRollQuantity': pizzaRollQuantity,
        'mushroomSoupQuantity': mushroomSoupQuantity,
        'zingerBurgerQuantity': zingerBurgerQuantity,
        'rollParathaQuantity': rollParathaQuantity,
      });
    }
  } catch (e) {
    print(e.toString());
  }
}

void addToCart() async {
  _user = _auth.currentUser!;
  final String userUID = _user.uid;
  final String userEmail = _user.email!; // Ambil email pengguna

  try {
    CollectionReference cartRef = _firestore.collection('carts');
    DocumentSnapshot cartSnapshot = await cartRef.doc(userUID).get();

    if (cartSnapshot.exists) {
      Map<String, dynamic> cartData = cartSnapshot.data() as Map<String, dynamic>;
      burgerQuantity = cartData['burgerQuantity'] ?? 0;
      sandwichQuantity = cartData['sandwichQuantity'] ?? 0;
      pizzaRollQuantity = cartData['pizzaRollQuantity'] ?? 0;
      mushroomSoupQuantity = cartData['mushroomSoupQuantity'] ?? 0;
      zingerBurgerQuantity = cartData['zingerBurgerQuantity'] ?? 0;
      rollParathaQuantity = cartData['rollParathaQuantity'] ?? 0;
    } else {
      await cartRef.doc(userUID).set({
        'email': userEmail, // Simpan email pengguna di dokumen keranjang
        'burgerQuantity': burgerQuantity,
        'burgerPrice': 20000,
        'sandwichQuantity': sandwichQuantity,
        'sandwichPrice' : 20000,
        'pizzaRollQuantity': pizzaRollQuantity,
        'pizzaRollPrice' : 20000,
        'mushroomSoupQuantity': mushroomSoupQuantity,
        'mushroomSoupPrice' : 17000,
        'zingerBurgerQuantity': zingerBurgerQuantity,
        'zingerBurgerPrice': 20000,
        'rollParathaQuantity': rollParathaQuantity,
        'rollParathaPrice': 25000,
      });
    }
  } catch (e) {
    print(e.toString());
  }
}


  void fetchData(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final Map<String, int> cartData = userProvider.cartData;

    try {
      // Ambil instance FirebaseAuth
      final FirebaseAuth auth = FirebaseAuth.instance;
      // Ambil user saat ini
      final User? user = auth.currentUser;
      
      if (user != null) {
        final String userUID = user.uid;
        final String userEmail = user.email!; // Ambil email pengguna

        // Melakukan query ke database untuk mengambil data cart
        final DocumentSnapshot cartSnapshot = await FirebaseFirestore.instance
            .collection('carts')
            .doc(userUID)
            .get()
            ;

        if (cartSnapshot.exists) {
          final Map<String, dynamic> cartData = cartSnapshot.data() as Map<String, dynamic>;
          // Ambil data cart yang diinginkan
          final int burgerQuantity = cartData['burgerQuantity'] ?? 0;
          final int sandwichQuantity = cartData['sandwichQuantity'] ?? 0;
          final int pizzaRollQuantity = cartData['pizzaRollQuantity'] ?? 0;
          final int mushroomSoupQuantity = cartData['mushroomSoupQuantity'] ?? 0;
          final int zingerBurgerQuantity = cartData['zingerBurgerQuantity'] ?? 0;
          final int rollParathaQuantity = cartData['rollParathaQuantity'] ?? 0;

          // Lakukan sesuatu dengan data yang telah diambil
          print('Burger Quantity: $burgerQuantity');
          print('Sandwich Quantity: $sandwichQuantity');
          print('Pizza Roll Quantity: $pizzaRollQuantity');
          print('Mushroom Soup Quantity: $mushroomSoupQuantity');
          print('Zinger Burger Quantity: $zingerBurgerQuantity');
          print('Roll Paratha Quantity: $rollParathaQuantity');

           userProvider.updateCartData({
            'burgerQuantity': burgerQuantity,
            'sandwichQuantity': sandwichQuantity,
            'pizzaRollQuantity': pizzaRollQuantity,
            'mushroomSoupQuantity': mushroomSoupQuantity,
            'zingerBurgerQuantity': zingerBurgerQuantity,
            'rollParathaQuantity': rollParathaQuantity,
          });

          setState(() {
      _burgerQuantity = burgerQuantity;
      _sandwichQuantity = sandwichQuantity;
      _pizzaRollQuantity = pizzaRollQuantity;
      _mushroomSoupQuantity = mushroomSoupQuantity;
      _zingerBurgerQuantity = zingerBurgerQuantity;
      _rollParathaQuantity = rollParathaQuantity;
    });
        
        } else {
          print('Cart does not exist');
        }
      }
    } catch (e) {
      print('Error fetching cart data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      title: 'Homepage',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 150.0,
              bottom: PreferredSize(                       // Add this code
                preferredSize: Size.fromHeight(30.0),      // Add this code
                child: Text(''),                           // Add this code
            ),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Find Your\nFavorite Food',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        'Popular menu',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    Expanded(
                      child: Text(
                        '',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Special Deal for December',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                        SizedBox(width: 10), // Adding spacing between image and text
                        Image.asset(
                          'assets/specialdeal1.png', // Replace with your image path
                          width: 100,
                          height: 100,
                        ),
                ],
              ),
            ),*/
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                childAspectRatio: (1 / 1.4),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  // Zinger Burger
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: const Color.fromARGB(255, 255, 238, 218),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/zingerBurger.png',
                          fit: BoxFit.contain,
                        ),
                        Text(
                          "Zinger Burger",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          "Rp 20.000",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 100, 64),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: decrementZingerBurgerQuantity,
                            ),
                            Text(
                              _zingerBurgerQuantity.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: incrementZingerBurgerQuantity,
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  // Roll Paratha
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: const Color.fromARGB(255, 255, 238, 218),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/rollParatha.png',
                          fit: BoxFit.contain,
                        ),
                        Text(
                          "Roll Paratha",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          "Rp 25.000",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 100, 64),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: decrementRollParathaQuantity,
                            ),
                            Text(
                              _rollParathaQuantity.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: incrementRollParathaQuantity,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
        Container(
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 255, 238, 218),
            child: Column(children: [
                  Image.asset(
                    'assets/burger.png',
                    fit: BoxFit.contain,
                  ),
              Text("Burger",
              style:TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
              ),
                            Text("Rp 15.000",
              style:TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 100, 64),
                    ),
              ),
Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: decrementBurger,
                            ),
                            Text(
                              _burgerQuantity.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: incrementBurger,
                            ),
                          ],
                        ),
            ],),
          ),
        // Sandwich
        Container(
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 255, 238, 218),
            child: Column(children: [
                  Image.asset(
                    'assets/sandwich.png',
                    fit: BoxFit.contain,
                  ),
              Text("Sandwich",
              style:TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
              ),
                            Text("Rp 20.000",
              style:TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 100, 64),
                    ),
              ),
Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: decrementSandwich,
                            ),
                            Text(
                              _sandwichQuantity.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: incrementSandwich,
                            ),
                          ],
                        ),
            ],),
          ),

        Container(
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 255, 238, 218),
            child: Column(children: [
                  Image.asset(
                    'assets/pizzaRoll.png',
                    fit: BoxFit.contain,
                  ),
              Text("Pizza Roll",
              style:TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
              ),
                            Text("Rp 22.000",
              style:TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 100, 64),
                    ),
              ),
              Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: decrementPizzaRoll,
                            ),
                            Text(
                              _pizzaRollQuantity.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: incrementPizzaRoll,
                            ),
                          ],
                        ),
            ],),
          ),

        Container(
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 255, 238, 218),
            child: Column(children: [
                  Image.asset(
                    'assets/mushroomSoup.png',
                    fit: BoxFit.contain,
                  ),
              Text("Mushroom Soup",
              style:TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
              ),
                            Text("Rp 17.000",
              style:TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 100, 64),
                    ),
              ),
              Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: decrementmushroomSoup,
                            ),
                            Text(
                              _mushroomSoupQuantity.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: incrementmushroomSoup,
                            ),
                          ],
                        ),
            ],),
          ),
        ],
      ),
    ),

SliverPadding(
      padding: const EdgeInsets.all(20),
      
      sliver: SliverList(
                  delegate: SliverChildListDelegate([
                  
                    Text(
                      'Review',
                      style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
              ),
                    ),
                  ]),
                ),
    ),
        
          SliverToBoxAdapter(
            child: Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return 
                  Container(
                    width: 100.0,
                    child: Card(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(FakeName[index],
                              style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),),
                                SizedBox(height: 10.0,),    
                              Text(review[index]
                              ,style: TextStyle(
                                  
                                      fontSize: 15.0,
                                    )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

  ],
),
    ),
    
    );
  }
}
