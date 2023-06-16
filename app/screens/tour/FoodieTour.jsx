// login mirandofrank@gmail.com frankpw
import React, { useState, useEffect, useContext } from 'react';
import axios from 'axios';
import {
  Text, StyleSheet, View, Image, ScrollView, SafeAreaView, TouchableOpacity, Dimensions,
} from 'react-native';
import AuthUserContext from '../../contexts';
import BottomNav from '../recipes/BottomNav2';

// Temporary import of mock data
// import restaurants from './mockTourData';

import { COLORS } from '../../constants/colors';

const styles = StyleSheet.create({
  title: {
    fontSize: 30,
    fontWeight: 'bold',
    fontFamily: 'Arial',
    textAlign: 'center',
    borderRadius: 20,
  },
  text: {
    fontSize: 20,
    textAlign: 'center',
    color: COLORS.SCARLET,
  },
  imagecontainer: {
    marginTop: 20,
    marginBottom: 20,
    borderWidth: 1,
    borderColor: 'gray',
    borderRadius: 50,
    padding: 10,
    backgroundColor: COLORS.LEMON,
  },
  image: {
    width: 300,
    height: 300,
    alignSelf: 'center',
    borderRadius: 30,
  },
  tourcontainer: {
    flex: 1,
    padding: 8,
  },
  list: {
    height: Dimensions.get('window').height - 60,
    alignItems: 'center',
  },
});

function FoodieTour({ navigation }) {
  // name, address, ratings, phone#, maybe description?
  // const { data } = route.params;
  const { user } = useContext(AuthUserContext);
  const [restaurants, setRestaurants] = useState([]);
  const meals = ['Breakfast', 'Lunch', 'Dinner'];

  useEffect(() => {
    axios.get('http://localhost:8080/api/v1/restaurants?category=rating&limit=3&order=desc', { headers: { Authorization: `Bearer ${user.accessToken}` } })
      .then((results) => {
        console.log('Client: >>>', results.data);
        // Maybe need to do some filtering of data
        // Grab top 3
        setRestaurants(results.data);
      })
      .catch((err) => {
        console.error('Couln\'t retrieve restaurants...', err);
      });
  }, []);

  // Refactor later so data is dynamic coming from server
  return (
    <SafeAreaView style={styles.list}>
      <SafeAreaView style={styles.tourcontainer}>
        <ScrollView style={styles.tourcontainer}>
          <View style={styles.heading}>
            <Text style={styles.title}>Self-Guided Foodie Tour</Text>
            <Text style={styles.text}>Can't decide on what to eat today? We'll choose for you!</Text>
          </View>

          {restaurants.map((item, index) => (
            <TouchableOpacity
              key={index}
              style={styles.imagecontainer}
              onPress={() => navigation.navigate('NativEat', { item })}
            >
              <Text style={styles.title}>{meals[index]}</Text>
              <Text style={styles.text}>{item.name}</Text>
              <Image style={styles.image} source={{ uri: item.photo }} />
              <Text style={styles.text}>{item.address}</Text>
              <Text style={styles.text}>
                {item.rating}
                {' '}
                Rating
              </Text>
            </TouchableOpacity>
          ))}

        </ScrollView>
      </SafeAreaView>
      <BottomNav navigatopn={navigation} />
    </SafeAreaView>
  );
}

export default FoodieTour;
