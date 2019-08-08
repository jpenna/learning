#include "WeatherPrediction.h"

class My : public WeatherPrediction
{
  public:
    // Own
    void setCurrentTempCelsius(int inTemp);
    int getTomorrowTempCelsius() const;

    // Override
    void showResult() const override;
    std::string getTemperature() const override;

  private:
    int convertTemperature(int inTemp, char inputType) const;

    // void WeatherPrediction::setPositionOfJupiter(int inDistanceFromMars);
    // double WeatherPrediction::getChanceOfRain() const
    // int WeatherPrediction::getTomorrowTempFahrenheit() const
};
