import React from 'react';
import {
  Text, StyleSheet, View, Dimensions, Image,
} from 'react-native';

const styles = StyleSheet.create({
  title: {
    fontSize: 30,
    fontWeight: 'bold',
    fontFamily: 'Arial',
    padding: 5,
  },
  text: {
    fontSize: 20,
    padding: 10,
  },
  imagecontainer: {
    height: 300,
  },
  image: {
    width: 300,
    height: 300,
    alignSelf: 'center',
    padding: 5,
  },
});

function RecipeSingle({ navigation, route }) {
  const { data } = route.params;
  console.log(data);
  const recipe = data.steps.split('.');
  console.log(recipe);
  return (
    <View>
      <Text style={styles.title}>{data.name}</Text>
      {/* <Text style={styles.text}>{data.cuisine[0]} Cuisine</Text> */}
      <View styles={styles.imagecontainer}>
        <Image style={styles.image} source={{ uri: data.photos[0] }} />
      </View>
      <Text style={styles.text}>Instructions Below:</Text>
      <Text style={styles.text}>{data.steps}</Text>
    </View>
  );
}

export default RecipeSingle;
