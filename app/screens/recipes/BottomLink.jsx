import React from 'react';
import {
  Text, StyleSheet, View, TouchableOpacity,
} from 'react-native';
import { Feather } from '@expo/vector-icons';

const styles = StyleSheet.create({
  text: {
    fontSize: 30,
    textAlign: 'center',
    alignSelf: 'center',
  },
  icon: {
    fontSize: 30,
  },
  touchable: {
    width: 130,
    height: 40,
    paddingVertical: 10,
    borderRadius: 6,
    backgroundColor: 'white',
    color: '#20232a',
    diplay: 'flex',
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
        onPress={() => navigation.navigate(data.navName, {})}
      >
        <Feather style={styles.icon} name={data.icon} size={28} color="black" />
        <Text>{title}</Text>
      </TouchableOpacity>
    </View>
  );
}

export default RecipeButton;
