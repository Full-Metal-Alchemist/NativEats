import * as React from 'react';
import { StyleSheet, Text, View, Button, TouchableOpacity } from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#67b34e',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default function ScreenOne() {
  return (
    <View style={styles.container}>
      <Text>This is Screen One !</Text>
    </View>
  );
}
