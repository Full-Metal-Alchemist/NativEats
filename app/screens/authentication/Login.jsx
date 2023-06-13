import React, { useState } from 'react';
import {
  StyleSheet, View, Button,
} from 'react-native';

import { LoginButton, LoginInput, LoginError } from './components';
import { auth } from '../../firebaseConfig';

// console.log('Firebase Auth from login', auth);

export default function Login({ navigation }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [passwordVis, setPasswordVis] = useState(true);
  const [rightIcon, setRightIcon] = useState('eye');
  const [loginError, setLoginError] = useState('');

  const handlePasswordVis = () => {
    if (rightIcon === 'eye') {
      setRightIcon('eye-off');
      setPasswordVis(!passwordVis);
    } else if (rightIcon === 'eye-off') {
      setRightIcon('eye');
      setPasswordVis(!passwordVis);
    }
  };

  const onLogin = async () => {
    try {
      if (email !== '' && password !== '') {
        await auth.signInWithEmailAndPassword(email, password);
      }
    } catch (err) {
      setLoginError(err.message);
    }
  };

  return (
    <View>
      <LoginInput
        placeholder="Enter email"
        keyboardType="email-address"
        textContentType="emailAddress"
        leftIcon="email"
        value={email}
        onChangeText={(text) => setEmail(text)}
      />
      <LoginInput
        placeholder="Enter password"
        autoCorrect={false}
        secureTextEntry={passwordVis}
        textContentType="password"
        leftIcon="lock"
        rightIcon={rightIcon}
        value={password}
        onChangeText={(text) => setPassword(text)}
        handlePasswordVis={handlePasswordVis}
      />
      {loginError ? <LoginError error={loginError} visible /> : null}
      <LoginButton title="Sign In" onPress={onLogin} />
      <Button title="Sign Up" onPress={() => navigation.navigate('Signup')} />
      <Button
        title="Forgot Password"
        onPress={() => navigation.navigate('ForgotPassword')}
      />
    </View>
  );
}

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
