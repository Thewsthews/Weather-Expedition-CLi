module WeatherApp where
    import qualified Data.Text as Text
    import qualified Network.HTTP.Simple as HTTP
    import Data.Aeson(FromJSON, ToJSON, decode)
    import GHC.Generics(Generic)
    import System.Environment(getArgs)

    --Data type to represent weather information
    data WeatherData = WeatherData
    {
        cityName :: T.Text
        , temperature :: Double
        , description :: T.Text
        , humidity :: Int
    } deriving (Generic, Show)

    instance FromJSON WeatherData
    instance ToJSON WeatherData


    --Function to fetch weather data
    fetchWeather :: String -> IO (Maybe WeatherData)
    fetchWeather city = do
        let apiKey = "0258dc857e173dd73f95e63984451f1f"
        let url = "http://api.openweatherapp.org/data/2.5/weather?q="
        ++ city
        ++ "&appid="
        ++ apiKey
        ++ "&units=metric"

        response <- HTTP.httpLBS (HTTP.parseRequest_ url)
        let body = HTTP.getResponseBody response
        return $ decode body

        --Application logic
        main :: IO ()
        main = do
            args <- getArgs
            case args of 
                [city] -> do
                    weatherResult <- fetchWeather city
                    case weatherResult of
                        Just weather -> do
                            putStrLn $ "City: " ++ T.unpack (cityName weather)
                            putStrLn $ "Temperature:" ++ T.unpack (Temperature weather) ++ "°C"
                            putStrLn $ "Description: " ++ T.unpack (description weather)
                    putStrLn $ "Humidity: " ++ show (humidity weather) ++ "%"
                Nothing -> putStrLn "Failed to fetch weather data"
        _ -> putStrLn "Please provide a city name"
