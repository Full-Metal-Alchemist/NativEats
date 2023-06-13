import React from 'react';
import {
  View, Text, StyleSheet, TextInput, Button, Alert,
} from 'react-native';

function ForgotPassword() {
  return (
    <View>
      <TextInput
        placeholder="Enter Email"
        keyboardType="email-address"
        textContentType="emailAddress"
      />
      <Button title="Recover Password" onPress={() => Alert.alert('Password Recovered!')} />
    </View>
  );
}

const styles = StyleSheet.create({
  textStyle: {
    marginVertical: 50,
  },
});

export default ForgotPassword;
