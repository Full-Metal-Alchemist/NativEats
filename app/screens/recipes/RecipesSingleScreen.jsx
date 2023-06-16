import React from 'react';
import {
  Text, StyleSheet, View, Button, TouchableOpacity,
} from 'react-native';

const styles = StyleSheet.create({
  text: {
    fontSize: 30,
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
  },
});

function RecipeSingle({ navigation }) {
  return (
    <View>
      <Text style={styles.text}>This is the Signle Recipe screen!</Text>
      <Button title="homepage" onPress={() => navigation.navigate('Restaurants')} />
    </View>
  );
}

export default RecipeSingle;
