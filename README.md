# Lunar Weather Expedition CLI

## Project Overview

A modern Haskell-powered weather information retrieval CLI that provides detailed meteorological data for lunar mission planning and terrestrial weather analysis.

## Features 👾

- 🌍 Real-time weather data retrieval
- 🌡️ Temperature reporting in metric units
- 💧 Humidity tracking
- 🌐 Global city support
- 🚀 Designed with lunar expedition requirements in mind

## Prerequisites

- Haskell Stack (v2.13.1 or higher)
- OpenWeatherMap API Key

## Installation

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/lunar-weather-expedition.git
cd lunar-weather-expedition
```
2. Install Dependencies
```bash
stack setup
stack build
```
Configuration

1. Obtain an OpenWeatherMap API Key:

Visit OpenWeatherMap
Create a free account
Generate an API key

Replace API Key in Source Code:
Edit src/WeatherApp.hs and replace your_openweathermap_api_key
Usage

```bash
# Basic usage
stack run weather-app <city_name>

# Examples
stack run weather-app London
stack run weather-app "New York"
stack run weather-app Tokyo
```
Development
Running Tests
```bash
stack test
```
Build Variants
```bash
# Development build
stack build

# Production build
stack build --optimize
```
