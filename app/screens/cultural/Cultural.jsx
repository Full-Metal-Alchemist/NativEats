import React, { useState, useEffect } from 'react';
import axios from 'axios';

import {
  Text, StyleSheet, View, SafeAreaView, ScrollView, Image,
} from 'react-native';

import { COLORS } from '../../constants/colors';

const styles = StyleSheet.create({
  title: {
    fontSize: 30,
    fontWeight: 'bold',
    fontFamily: 'Arial',
    textAlign: 'center',
  },
  heading: {
    backgroundColor: COLORS.TURQUOISE,
    borderRadius: 20,
  },
  subheading: {
    fontSize: 30,
    fontWeight: 'bold',
    fontFamily: 'Arial',
    textAlign: 'center',
    textDecorationLine: 'underline',
  },
  info: {
    fontSize: 20,
    padding: 30,
  },
  imagecontainer: {
    height: 300,
  },
  image: {
    width: 300,
    height: 300,
    alignSelf: 'center',
    borderRadius: 30,
    marginTop: 20,
    marginBottom: 20,
  },
  culturalcontainer: {
    flex: 1,
    padding: 8,
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

        <Text style={styles.subheading}>History</Text>
        <Text style={styles.info}>{currentCuisine.history}</Text>

        <Text style={styles.subheading}>Customs</Text>
        <Text style={styles.info}>{currentCuisine.customs}</Text>

      </ScrollView>
    </SafeAreaView>

  );
}

export default CulturalInsights;
