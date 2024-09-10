import 'package:weatherapi/model/weatherResponse.dart';
import 'package:weatherapi/network/api_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  //

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.location_city),
        title: Text('Weather In Dubai'),
      ),
      body: FutureBuilder<WeatherResponse>(
        future: ApiService.api.fetchWeather(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://openweathermap.org/img/wn/${snapshot.data!.results[0].icon}@2x.png',
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    snapshot.data!.results[0].description,
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
// import 'package:weatherapi/model/quotes_response.dart';
// import 'package:weatherapi/network/api_service.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: FutureBuilder<QuotesResponse>(
//         future: ApiService.api.fetchQuotes(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List<Result> results = snapshot.data!.results;
//             return ListView.builder(
//               itemCount: results.length,
//               itemBuilder: (context, index) => ListTile(
//                 leading: Icon(Icons.quora),
//                 title: Text(results[index].content),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       results[index].author,
//                       textAlign: TextAlign.end,
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Wrap(
//                       children: results[index]
//                           .tags
//                           .map((e) => Text(
//                                 '# $e ',
//                                 style: const TextStyle(color: Colors.indigo),
//                               ))
//                           .toList(),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text(
//                 snapshot.error.toString(),
//                 style: const TextStyle(color: Colors.red),
//               ),
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       )),
//     );
//   }
// }
