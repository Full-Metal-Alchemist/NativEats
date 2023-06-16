import React, { useState, useEffect } from 'react';
import axios from 'axios';

import {
  Text, StyleSheet, View, SafeAreaView, ScrollView, Image,
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
    borderRadius: 30,
  },
});

function CulturalInsights() {
  // Temporary state to hold placeholder cuisine chosen
  const tempId = 1;
  // id: 1 is Italian
  // TODO: grab current cuisine from nathan
  const [currentCuisine, setCurrentCuisine] = useState({});

  useEffect(() => {
    // TODO: grab data for current cuisine
    axios.get('http://localhost:8080/api/v1/cuisines')
      .then(({ data }) => {
        // console.log('Cultural: grabbing cuisines', data);
        // setCurrentCuisine(data.filter((c) => c.id === tempId));
        data.forEach((cuisine) => {
          if (cuisine.id === tempId) {
            setCurrentCuisine(cuisine);
          }
        });
      })
      .catch((err) => {
        console.log('Couldn\'t grab cuisines data...', err);
      });
  }, []);

  return (
    <SafeAreaView>
      <ScrollView>
        <Text style={styles.title}>
          Cultural Insights About
          {' '}
          {currentCuisine.name}
          {' '}
          Food
        </Text>

        <Image style={styles.image} source={{ uri: currentCuisine.photo }} />

      </ScrollView>
    </SafeAreaView>

  );
}

export default CulturalInsights;
