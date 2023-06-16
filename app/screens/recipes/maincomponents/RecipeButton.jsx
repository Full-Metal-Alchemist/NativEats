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
    width: 300,
    marginTop: 15,
    paddingVertical: 18,
    borderRadius: 6,
    backgroundColor: '#61dafb',
    color: '#20232a',
    textAlign: 'center',
    alignItems: 'center',
    fontSize: 30,
    fontWeight: 'bold',
  },
});

function RecipeButton({ navigation, title, data }) {
  return (
    <View>
      <TouchableOpacity
        style={styles.touchable}
        onPress={() => navigation.navigate('RecipesSingle', { data })}
      >
        <Text>{title}</Text>
      </TouchableOpacity>
    </View>
  );
}

export default RecipeButton;
