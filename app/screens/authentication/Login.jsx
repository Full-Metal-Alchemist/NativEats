import React, { useState } from 'react';
import {
  StyleSheet, View, Button,
} from 'react-native';
import { signInWithEmailAndPassword } from 'firebase/auth';
import { LoginButton, LoginInput, LoginError } from './components';
import { auth } from '../../firebaseConfig';
import { COLORS } from '../../constants/colors';

// console.log('Firebase Auth from login', auth);

export default function Login({ navigation }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [showPassword, setshowPassword] = useState(true);
  const [rightIcon, setRightIcon] = useState('eye');
  const [loginError, setLoginError] = useState('');

  const handleShowPassword = () => {
    if (rightIcon === 'eye') {
      setRightIcon('eye-off');
      setshowPassword(!showPassword);
    } else if (rightIcon === 'eye-off') {
      setRightIcon('eye');
      setshowPassword(!showPassword);
    }
  };

  const onLogin = async () => {
    try {
      if (email !== '' && password !== '') {
        await signInWithEmailAndPassword(auth, email, password);
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
        autoCapitalize="none"
        iconColor={COLORS.SCARLET}
      />
      <LoginInput
        placeholder="Enter password"
        autoCorrect={false}
        secureTextEntry={showPassword}
        textContentType="password"
        leftIcon="lock"
        rightIcon={rightIcon}
        value={password}
        onChangeText={(text) => setPassword(text)}
        handleShowPassword={handleShowPassword}
        autoCapitalize="none"
        iconColor={COLORS.SCARLET}
      />
      {loginError ? <LoginError error={loginError} visible /> : null}
      <LoginButton
        title="Sign In"
        onPress={onLogin}
        backgroundColor={COLORS.TURQUOISE}
        titleColor={COLORS.JASMINE}
        // width="60%"
        titleSize={18}
      />
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
});
