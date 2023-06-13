import React from 'react';
import {
  View, Text, StyleSheet, TextInput, Button, Alert,
} from 'react-native';

import { LoginButton, LoginInput } from './components';

function ForgotPassword() {
  return (
    <View>
      <LoginInput
        placeholder="Enter Email"
        keyboardType="email-address"
        textContentType="emailAddress"
      />
      <LoginButton title="Recover Password" onPress={() => Alert.alert('Password Recovered!')} />
    </View>
  );
}

const styles = StyleSheet.create({
  textStyle: {
    marginVertical: 50,
  },
});

export default ForgotPassword;
