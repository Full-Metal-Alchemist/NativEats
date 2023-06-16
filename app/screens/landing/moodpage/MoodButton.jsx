import React from 'react';
import {
  Text, StyleSheet, View, Button, TouchableOpacity,
} from 'react-native';
import { COLORS } from '../../../constants/colors';

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
    borderWidth: 2,
    borderColor: '#20232a',
    borderRadius: 6,
    backgroundColor: COLORS.TURQUOISE,
    color: '#20232a',
    textAlign: 'center',
    alignSelf: 'center',
    fontSize: 30,
    fontWeight: 'bold',
  },
});

function MoodButton({ navigation, title, data, userId }) {
  return (
    <View>
      <TouchableOpacity
        style={styles.touchable}
        onPress={() => navigation.navigate('Restaurants', { cuisine: data.name, userId })}
      >
        <Text>{title}</Text>
      </TouchableOpacity>
    </View>
  );
}

export default MoodButton;
