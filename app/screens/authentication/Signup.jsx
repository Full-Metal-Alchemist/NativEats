import React from 'react';
import {
  View, Text, StyleSheet, TextInput, Button, Alert,
} from 'react-native';

import { LoginButton, LoginInput } from './components';

function Signup() {
  return (
    <View>
      <LoginInput
        placeholder="Email"
        keyboardType="email-address"
        textContentType="emailAddress"
      />
      <LoginInput
        placeholder="Password"
        autoCorrect={false}
        secureTextEntry
        textContentType="password"
      />
      <LoginButton title="Sign up" onPress={() => Alert.alert('Signed up!')} />
    </View>
  );
}

const styles = StyleSheet.create({
  textStyle: {
    marginVertical: 50,
  },
});

export default Signup;
