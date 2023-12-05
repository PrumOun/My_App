import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

    Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    //data = ModalRoute.of(context)?.settings.arguments as Map? ?? {};

    // set background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    print(data);

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,

            )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    icon: Icon(Icons.edit_location_alt_rounded),
                    label: Text("Edit location",),
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDayTime': result['isDayTime']
                        };
                      });
                    }
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'], style: TextStyle(fontSize: 28, letterSpacing: 2, ),),
                  ],
                ),
                SizedBox(height: 20,),
                Text(data['time'] ?? " ", style: TextStyle(fontSize: 66, letterSpacing: 2, ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
