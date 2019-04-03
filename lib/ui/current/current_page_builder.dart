import 'package:flutter/material.dart';
import 'package:home_track/core/core_builder.dart';
import 'package:home_track/domain/weather.dart';
import 'package:intl/intl.dart';

class CurrentPageBuilder with CoreBuilder {

  Widget buildRootLayout(BuildContext context, Weather weather, Error error,
      Function refresh) {
    if (error != null)
      return buildRefreshableErrorLayout(context, error.toString(), refresh);
    else if (weather == null)
      return buildLoadingLayout(context);
    else
      return buildWeatherLayout(context, weather, refresh);
  }

  Widget buildWeatherLayout(BuildContext context, Weather weather,
      Function refresh) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildEntryTimeCard(weather.dateTime),
            _buildTemperatureCard(weather.temperature),
            _buildHumidityCard(weather.humidity),
            _buildPressureCard(weather.pressure)
          ],
        ),
      ),
    );
  }

  Widget _buildEntryTimeCard(DateTime date) {
    return Card(
        margin: EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildCardHeader(Icons.timer, "Update time", ""),
            _buildCardBody(DateFormat("hh:mm:ss").format(date)),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
            )
          ],
        ));
  }

  Widget _buildTemperatureCard(double temperature) {
    return Card(
        margin: EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildCardHeader(Icons.filter_drama, "Temperature", ""),
            _buildCardBody(temperature.toStringAsFixed(1) + "°C"),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
            )
          ],
        ));
  }

  Widget _buildHumidityCard(double humidity) {
    return Card(
        margin: EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildCardHeader(Icons.opacity, "Humidity", ""),
            _buildCardBody(humidity.round().toString() + "%"),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
            )
          ],
        ));
  }

  Widget _buildPressureCard(double pressure) {
    return Card(
        margin: EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildCardHeader(Icons.line_style, "Pressure", ""),
            _buildCardBody(pressure.round().toString() + "hPa"),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
            )
          ],
        ));
  }

  ListTile _buildCardHeader(IconData iconData, String title, String subtitle) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 48,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  Text _buildCardBody(String text) {
    return Text(text, textAlign: TextAlign.center, style: _cardBodyTextStyle());
  }

  TextStyle _cardBodyTextStyle() {
    return TextStyle(fontSize: 48, color: Colors.white);
  }
}
