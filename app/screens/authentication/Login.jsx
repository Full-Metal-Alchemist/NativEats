import React from 'react';
import {
  Text, StyleSheet, View, TextInput, Button, Alert,
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
      <Text>New text lets goooo!</Text>
      <TextInput
        placeholder="Enter email"
        keyboardType="email-address"
        textContentType="emailAddress"
      />
      <TextInput
        placeholder="Enter password"
        autoCorrect={false}
        secureTextEntry
        textContentType="password"
      />
      <Button title="Sign In" onPress={() => Alert.alert('Sign in pressed!')} />
      <Button title="Sign Up" onPress={() => navigation.navigate('Signup')} />
      <Button
        title="Forgot Password"
        onPress={() => navigation.navigate('ForgotPassword')}
      />
    </View>
  );
}

export default Login;
