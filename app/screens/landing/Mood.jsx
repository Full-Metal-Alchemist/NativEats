import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const MoodPage = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.text}>Mood Page</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  text: {
    fontSize: 20,
    color: '#000',
  },
});

export default MoodPage;
