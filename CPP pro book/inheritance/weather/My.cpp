#include <iostream>
#include <sstream>
#include "My.h"

using namespace std;

// Override
void My::showResult() const
{
  	cout << "Result: " << (getChanceOfRain() * 100) << " chance."
		<< " Temp. " << getTomorrowTempFahrenheit() << "ºF" << endl
		<< " Temp. " << getTomorrowTempCelsius() << "ºC" << endl;
};

std::string My::getTemperature() const
{
  stringstream ss;
  ss << WeatherPrediction::getTemperature() << "ºF" << endl
    << " Temp. " << getTomorrowTempCelsius() << "ºC" << endl;
  return ss.str();
};

// Own
void My::setCurrentTempCelsius(int inTemp)
{
  int fahrenheit = convertTemperature(inTemp, 'c');
  setCurrentTempFahrenheit(fahrenheit);
};

int My::getTomorrowTempCelsius() const
{
  return convertTemperature(getTomorrowTempFahrenheit(), 'f');
};

// Private
int My::convertTemperature(int inTemp, char inputType) const
{
  return inputType == 'c' ? (inTemp * 10) : (inTemp / 10);
};
