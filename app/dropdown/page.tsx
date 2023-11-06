'use client'
import React, { useState, useEffect ,ChangeEvent  } from 'react'
import { Select } from '@radix-ui/react-select'

export default function Page() {
  const countrylist = [
    {
      "name": "India",
      "country_code": "in",
    },
    {
      "name": "USA",
      "country_code": "us",
    },
    {
      "name": "France",
      "country_code": "fr",
    }
  ];

  const citylist = [
    {
      "name": "Bangalore",
      "country_code": "in",
    },
    {
      "name": "Mumbi",
      "country_code": "in",
    },
    {
      "name": "Delhi",
      "country_code": "in",
    },
    {
      "name": "Massachusett",
      "country_code": "us",
    },
    {
      "name": "Chicago",
      "country_code": "us",
    },
    {
      "name": "Los Angeles",
      "country_code": "us",
    },
    {
      "name": "Houston",
      "country_code": "us",
    },
    {
      "name": "Paris",
      "country_code": "fr",
    },
    {
      "name": "Bordeaux",
      "country_code": "fr",
    },
    {
      "name": "Marseille",
      "country_code": "fr",
    }
  ];


  const [selectedCountry, setSelectedCountry] = useState('');
  const [selectedCity, setSelectedCity] = useState('');

  // handle change event of the country dropdown
  const handleCountryChange = (e: any) => {
    setSelectedCountry(e.target.value);
    setSelectedCity('null');
  };

  // handle change event of the language dropdown
  const handleCityChange = (e: any) => {
    setSelectedCity(e.target.value);
  };

  // generate the link when both dropdowns are selected
  // useEffect(() => {
  //   if (country && city) {
  //     setLink(`https://www.${country.url}/search?q=Clue+Mediator&gl=${country.country_code}&hl=${lang.code}`);
  //   }
  // }, [country, city]);

  return (
    <div className="App">
      <h3>Cascading dropdown in React - <a href="https://www.cluemediator.com" target="_blank">Clue Mediator</a></h3>
      <div style={{ width: 400, marginBottom: 20 }}>
        <b>Country</b>


        <select value={selectedCountry} onChange={handleCountryChange}>
          {countrylist.map((country, index) => (
            <option value={country.country_code} key={index}>{country.name}</option>
          ))}
        </select>
        <br />
        <b>City</b>

        <select value={selectedCity} onChange={handleCityChange}>
          {citylist.filter((city) => city.country_code === selectedCountry)
            .map((city, index) => (
              <option value={city.name} key={index}>{city.name}</option>
            ))}
        </select>
      </div>
      {/* <span><b>Link:</b> {country && lang ? link : '-'}</span> */}

    </div>
  );
}