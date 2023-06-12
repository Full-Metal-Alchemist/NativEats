import React from 'react';

import {
  Text, StyleSheet, View, Dimensions, Image,
} from 'react-native';

const styles = StyleSheet.create({
  title: {
    fontSize: 30,
    fontWeight: 'bold',
    fontFamily: 'Arial',
  },
  text: {
    fontSize: 20,
  },
  imagecontainer: {
    height: 300,
  },
  image: {
    width: 300,
    height: 300,
    alignSelf: 'center',
  },
});

function FoodieTour() {
// TODO: need to grab one restaurant for each time of day
// Highest # of reviews, minimum 4+ star ratings

  return (
    <View>
      <Text style={styles.title}>Self-Guided Foodie Tour</Text>
      <Text style={styles.text}>Can't decide on what to eat today? We'll choose for you!</Text>
      <Text style={styles.text}>Breakfast</Text>
      <Text style={styles.text}>Lunch</Text>
      <Text style={styles.text}>Dinner</Text>
    </View>
  );
}

export default FoodieTour;
