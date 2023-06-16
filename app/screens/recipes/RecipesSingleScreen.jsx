import React from 'react';
import {
  Text, StyleSheet, View, Button, TouchableOpacity, Image, ScrollView, Dimensions, SafeAreaView,
} from 'react-native';
import BottomNav from './BottomNav2';

const styles = StyleSheet.create({
  text: {
    fontSize: 20,
    padding: 15,
  },
  list: {
    height: Dimensions.get('window').height - 155,
    alignItems: 'center',
  },
  touchable: {
    width: 300,
    marginTop: 556,
    marginLeft: 25,
    paddingVertical: 18,
    borderWidth: 2,
    borderColor: '#20232a',
    borderRadius: 6,
    backgroundColor: '#61dafb',
    color: '#20232a',
    textAlign: 'center',
    fontSize: 30,
    fontWeight: 'bold',
    fontFamily: 'Arial',
    padding: 5,
  },
  title: {
    fontSize: 30,
    padding: 10,
    alignSelf: 'center',
    fontWeight: 'bold',
  },
  imagecontainer: {
    height: 200,
  },
  image: {
    width: 300,
    height: 300,
    alignSelf: 'center',
    padding: 5,
  },
});

function RecipeSingle({ navigation, route }) {
  const { data } = route.params
  return (
    <SafeAreaView style={styles.list}>
      <View>
        <Text style={styles.title}>{data.name}</Text>
        {/* <Text style={styles.text}>{data.cuisine[0]} Cuisine</Text> */}
        <View styles={styles.imagecontainer}>
          <Image style={styles.image} source={{ uri: data.photos[0] }} />
        </View>
        <Text style={styles.text}>Instructions Below:</Text>
        <ScrollView>
          <Text style={styles.text}>{data.steps}</Text>
        </ScrollView>
      </View>
      <BottomNav navigation={navigation} />
    </SafeAreaView>
  );
}

export default RecipeSingle;
