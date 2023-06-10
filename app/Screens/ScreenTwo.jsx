import * as React from 'react';
import { StyleSheet, Text, View, Button, TouchableOpacity } from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#a32a2a',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default function ScreenTwo() {
  return (
    <View style={styles.container}>
      <Text>This is Screen Two!</Text>
    </View>
  );
}
