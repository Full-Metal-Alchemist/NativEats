import React, { useState, useEffect, useContext } from 'react';
import axios from 'axios';
import {
  Text, StyleSheet, View, SafeAreaView, ScrollView, Image, Dimensions,
} from 'react-native';
import AuthUserContext from '../../contexts';
import BottomNav from '../recipes/BottomNav2';

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
  divider: {
    flex: 1,
    height: StyleSheet.hairlineWidth,
    backgroundColor: 'gray',
  },
  list: {
    height: Dimensions.get('window').height - 60,
    alignItems: 'center',
  },
});

function CulturalInsights({ navigation }) {
  // Temporary state to hold placeholder cuisine chosen
  const tempId = 1;
  // id: 1 is Italian
  // TODO: grab current cuisine from nathan
  const { user } = useContext(AuthUserContext);
  const [currentCuisine, setCurrentCuisine] = useState({});

  useEffect(() => {
    // TODO: grab data for current cuisine
    console.log('Access token >>>', user.accessToken);
    axios.get('http://localhost:8080/api/v1/cuisines', {
      headers: { Authorization: `Bearer ${user.accessToken}` },
    })
      .then(({ data }) => {
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
    <SafeAreaView style={styles.list}>
      <SafeAreaView style={styles.culturalcontainer}>
        <ScrollView>
          <Text style={styles.title}>
            Cultural Insights:
            {' '}
            {currentCuisine.name}
            {' '}
            Cuisine
          </Text>

          <Image style={styles.image} source={{ uri: currentCuisine.photo }} />
          <View style={styles.divider} />
          <Text style={styles.subheading}>History</Text>
          <Text style={styles.info}>{currentCuisine.history}</Text>
          <View style={styles.divider} />
          <Text style={styles.subheading}>Customs</Text>
          <Text style={styles.info}>{currentCuisine.customs}</Text>

        </ScrollView>
      </SafeAreaView>
      <BottomNav navigation={navigation} />
    </SafeAreaView>

  );
}

export default CulturalInsights;
