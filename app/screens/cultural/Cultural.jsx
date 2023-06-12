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

function CulturalInsights() {
  return (
    <View>
      <Text style={styles.title}>Cultural Insights</Text>
    </View>
  );
}

export default CulturalInsights;
