import React from 'react';
import {
  Text, StyleSheet, View, TouchableOpacity, Image
} from 'react-native';

const styles = StyleSheet.create({
  title: {
    fontSize: 30,
    fontWeight: 'bold',
  },
  text: {
    fontSize: 20,
  },
  image: {
    width: 100,
    height: 100,
    borderWidth: 2,
    borderColor: 'black',
  },
});

function RecipeSingle({ navigation, route }) {
  const { data } = route.params;
  console.log(data);
  return (
    <View>
      <Text style={styles.title}>{data.name}</Text>
      <Text style={styles.text}>{data.cuisine[0]} Cuisine</Text>
      <Image style={styles.image} source={{ uri: data.photos[0] }} />
      <Text style={styles.text}>{data.steps}</Text>
    </View>
  );
}

export default RecipeSingle;
