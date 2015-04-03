#!/usr/bin/env python3.4
'''add_geoip_data.py
'''


__author__ = 'fantasy <pkuqiuning@gmail.com>'
__created__ = '2015-04-03 11:36:14 -0400'


import pandas as pd
import geoip2.database as geodatabase
from geoip2.errors import AddressNotFoundError


# database is downloaded from http://dev.maxmind.com/geoip/geoip2/geolite2/
geolookup = geodatabase.Reader('/home/fantasy/.local/share/GeoIP2/GeoLite2-City.mmdb')


def get_geoinfo(maskedip):
    try:
        georesult = geolookup.city(maskedip.replace('*', '1'))
    except AddressNotFoundError:
        return None, None, None, None, None
    country = georesult.country.name
    province = georesult.subdivisions.most_specific.name
    city = georesult.city.name
    lat = georesult.location.latitude
    lon = georesult.location.longitude
    return country, province, city, lat, lon


def main():
    data = pd.read_csv('2014data_clean.csv', parse_dates=['time'])
    data['country'], data['province'], data['city'], data['latitude'], data['longitude'] = zip(*(get_geoinfo(ip) for ip in data.ip))
    data.to_csv('2014data_clean_geoip.csv', index=False)


if __name__ == "__main__":
    main()


