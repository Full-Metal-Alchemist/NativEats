import React, { useState } from 'react';

import {
  Text, StyleSheet, View, SafeAreaView, ScrollView,
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

function CulturalInsights() {
  // Temporary state to hold placeholder cuisine chosen
  const [currentCuisine, setCurrentCuisine] = useState('Italian');
  return (
    <SafeAreaView>
      <ScrollView>
        <Text style={styles.title}>
          Cultural Insights About
          {' '}
          {currentCuisine}
          {' '}
          Food
        </Text>

      </ScrollView>
    </SafeAreaView>

  );
}

export default CulturalInsights;
