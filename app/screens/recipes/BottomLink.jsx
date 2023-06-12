import React from 'react';
import {
  Text, StyleSheet, View, Button, TouchableOpacity,
} from 'react-native';

const styles = StyleSheet.create({
  text: {
    fontSize: 30,
    textAlign: 'center',
    alignSelf: 'center',
  },
  touchable: {
    width: 130,
    height: 40,
    paddingVertical: 10,
    borderRadius: 6,
    backgroundColor: '#61dafb',
    color: '#20232a',
    textAlign: 'center',
    alignSelf: 'center',
    fontSize: 30,
    fontWeight: 'bold',
  },
});

function RecipeButton({ navigation, title, data }) {
  console.log(data);
  return (
    <View>
      <TouchableOpacity
        style={styles.touchable}
        onPress={() => navigation.navigate(data.navName, {})}
      >
        <Text>{title}</Text>
      </TouchableOpacity>
    </View>
  );
}

export default RecipeButton;
