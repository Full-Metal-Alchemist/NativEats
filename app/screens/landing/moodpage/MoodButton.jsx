import React, { useContext } from 'react';
import {
  Text, StyleSheet, View, TouchableOpacity,
} from 'react-native';
import { COLORS } from '../../../constants/colors';
import AuthUserContext from '../../../contexts';

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

function MoodButton({
  navigation, title, data, userId,
}) {
  const { setCuisine } = useContext(AuthUserContext);
  const moodPressHandler = (navigation2, data2, userId2) => {
    setCuisine(data.id);
    navigation2.navigate('Restaurants', { cuisine: data2.id, userId2 });
  };
  return (
    <View>
      <TouchableOpacity
        style={styles.touchable}
        onPress={() => moodPressHandler(navigation, data, userId)}
      >
        <Text>{title}</Text>
      </TouchableOpacity>
    </View>
  );
}

export default MoodButton;
