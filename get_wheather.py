#!/usr/bin/env python3

# importing all is less advised
#import configparser
#import sys

import requests
from sys import argv
from configparser import ConfigParser

def get_api_key():
    config = ConfigParser()
    config.read('config.ini')
    return config['openweathermap']['api_key']

def get_base_url():
    config = ConfigParser()
    config.read('config.ini')
    return config['openweathermap']['base_url']
 
def get_weather(base_url, api_key, city):
    url = "{base_url}/weather?q={location}&units=metric&appid={key}".format(base_url=base_url, location=city, key=api_key)
    r = requests.get(url)
    return r.json()
 
def main():
    if len(argv) != 2:
        exit("Usage: {} CITY".format(argv[0]))
    city = argv[1]
 
    api_key = get_api_key()
    
    base_url = get_base_url()
    weather = get_weather(base_url, api_key, city)
 
    #print(weather['main']['temp'])
    print(weather)
 
if __name__ == '__main__':
    main()
