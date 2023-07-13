import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:testambient/class/weather.dart';
import 'package:wear/wear.dart';
import 'package:weather_icons/weather_icons.dart';

import '../class/http.dart';

class CurrentWeatherPage extends StatefulWidget {
  final WearMode mode;

  const CurrentWeatherPage(this.mode, {Key? key}) : super(key: key);

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  Weather client = Weather();
  WeatherModel? data;

  Future<WeatherModel> getData() async {
    WeatherModel result = await client.getWeather('San Juan del Río');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Column(
              children: [
                 BoxedIcon(WeatherIcons.moon_alt_waning_crescent_4, color: widget.mode == WearMode.active
                        ? Colors.black
                        : Colors.white),
               
                Text(
                  'San Juan del Río',
                  style: TextStyle(
                    color: widget.mode == WearMode.active ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Text(
                  '21°',
                  style: TextStyle(
                    color: widget.mode == WearMode.active ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Text(
                  'Despejado',
                  style: TextStyle(
                    color: widget.mode == WearMode.active ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                

              ],
            );
  }
}

/*

return FutureBuilder<WeatherModel>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<WeatherModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data != null) {
            WeatherModel weatherData = snapshot.data!;
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '22°',
                  style: TextStyle(
                    color: widget.mode == WearMode.active ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const LinearProgressIndicator();
        }
        return Container();
      },
    );

 */
