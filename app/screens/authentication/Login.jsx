import React from 'react';
import {
  Text, StyleSheet, View, InputField,
} from 'react-native';

const styles = StyleSheet.create({
  text: {
    fontSize: 30,
  },
  touchable: {
    width: 300,
    marginTop: 556,
    marginLeft: 25,
    paddingVertical: 18,
    borderWidth: 2,
    borderColor: '#20232a',
    borderRadius: 6,
    backgroundColor: '#61dafb',
    color: '#20232a',
    textAlign: 'center',
    fontSize: 30,
    fontWeight: 'bold',
  },
});

function Login({ navigation }) {
  console.log(navigation);
  return (
    <View>
      <Text>Login</Text>
      <InputField
        leftIcon="email"
        placeholder="Enter email"
        keyboardType="email-address"
        textContentType="emailAddress"
      />
      <InputField
        leftIcon="lock"
        placeholder="Enter password"
        autoCorrect="false"
        secureTextEntry
        textContentType="password"
      />
    </View>
  );
}

export default Login;
