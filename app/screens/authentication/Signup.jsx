import React, { useState } from 'react';
import {
  View, StyleSheet,
} from 'react-native';
import { createUserWithEmailAndPassword } from 'firebase/auth';

import { LoginButton, LoginInput, LoginError } from './components';
import { auth } from '../../firebaseConfig';

function Signup({ navigation }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [passwordVis, setPasswordVis] = useState(true);
  const [rightIcon, setRightIcon] = useState('eye');
  const [signupError, setSignupError] = useState('');

  const handlePasswordVis = () => {
    if (rightIcon === 'eye') {
      setRightIcon('eye-off');
      setPasswordVis(!passwordVis);
    } else if (rightIcon === 'eye-off') {
      setRightIcon('eye');
      setPasswordVis(!passwordVis);
    }
  };

  const handleSignup = async () => {
    try {
      if (email !== '' && password !== '') {
        await createUserWithEmailAndPassword(auth, email, password);
      }
    } catch (err) {
      setSignupError(err.message);
      console.log(err);
    }
  };
  return (
    <View>
      <LoginInput
        placeholder="Email"
        keyboardType="email-address"
        textContentType="emailAddress"
        leftIcon="email"
        value={email}
        onChangeText={(text) => setEmail(text)}
        autoCapitalize="none"
      />
      <LoginInput
        placeholder="Password"
        autoCorrect={false}
        secureTextEntry={passwordVis}
        textContentType="password"
        leftIcon="lock"
        rightIcon={rightIcon}
        value={password}
        onChangeText={(text) => setPassword(text)}
        handlePasswordVis={handlePasswordVis}
        autoCapitalize="none"
      />
      {signupError ? <LoginError error={signupError} visible /> : null}
      <LoginButton title="Sign up" onPress={handleSignup} />
    </View>
  );
}

const styles = StyleSheet.create({
  textStyle: {
    marginVertical: 50,
  },
});

export default Signup;
