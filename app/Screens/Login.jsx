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

export default function Login() {
  return (
    <View style={styles.container}>
      <Text>This is the Home Screen !</Text>
      <Button
        onPress={() => console.log('testing home screen button')}
        title="Go to Screen 1"
      />
    </View>
  );
}
