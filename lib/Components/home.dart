import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
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
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
        
              children: [
                Expanded(
                  child: Column(
                
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Find Your Favourite Food!',

                          style: TextStyle(
                            fontSize: 24,
                            color: Color(int.parse('FF6440', radix: 16))
                                        .withOpacity(1.0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Password Reset Successful',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/successnotif');// Tambahkan logika untuk tombol login di sini
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(int.parse('FF6440', radix: 16)).withOpacity(1.0),
                        minimumSize: Size(double.infinity, 48.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
