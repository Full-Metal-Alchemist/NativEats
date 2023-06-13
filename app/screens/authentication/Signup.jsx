import React from 'react';
import {
  View, Text, StyleSheet, TextInput, Button, Alert,
} from 'react-native';

function Signup() {
  return (
    <View>
      <TextInput
        placeholder="Email"
        keyboardType="email-address"
        textContentType="emailAddress"
      />
      <TextInput
        placeholder="Password"
        autoCorrect={false}
        secureTextEntry
        textContentType="password"
      />
      <Button title="Sign up" onPress={() => Alert.alert('Signed up!')} />
    </View>
  );
}

const styles = StyleSheet.create({
  textStyle: {
    marginVertical: 50,
  },
});

export default Signup;
