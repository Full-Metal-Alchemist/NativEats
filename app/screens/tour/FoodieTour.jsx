import React from 'react';

import {
  Text, StyleSheet, View, Dimensions, Image, ScrollView,
} from 'react-native';

import { COLORS } from '../../constants/colors';


const styles = StyleSheet.create({
  title: {
    fontSize: 30,
    fontWeight: 'bold',
    fontFamily: 'Arial',
    textAlign: 'center',
  },
  text: {
    fontSize: 20,
    textAlign: 'center',
  },
  imagecontainer: {
    height: 300,
    marginBottom: 50,

  },
  image: {
    width: 300,
    height: 300,
    alignSelf: 'center',
  },
  tourcontainer: {
    paddingBottom: 50,
  },
});

function FoodieTour({ navigation }) {
// TODO: need to grab one restaurant for each time of day
// TODO: add padding to bottom of scroll view
// TODO: need a back button to go back to homepage
// Highest # of reviews, minimum 4+ star ratings
// const { data } = route.params;
  const testImage = 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80';

  return (
    <ScrollView style={styles.tourcontainer}>
      <Text style={styles.title}>Self-Guided Foodie Tour</Text>
      <Text style={styles.text}>Can't decide on what to eat today? We'll choose for you!</Text>

      <Text style={styles.title}>Breakfast</Text>
      <View styles={styles.imagecontainer}>
        <Text style={styles.text}>Restaurant Name</Text>
        <Image style={styles.image} source={{ uri: testImage }} />
      </View>

      <Text style={styles.title}>Lunch</Text>
      <View styles={styles.imagecontainer}>
        <Text style={styles.text}>Restaurant Name</Text>
        <Image style={styles.image} source={{ uri: testImage }} />
      </View>

      <Text style={styles.title}>Dinner</Text>
      <View styles={styles.imagecontainer}>
        <Text style={styles.text}>Restaurant Name</Text>
        <Image style={styles.image} source={{ uri: testImage }} />
        <Text style={styles.text}>Restaurant Details</Text>
      </View>
    </ScrollView>
  );
}

export default FoodieTour;
