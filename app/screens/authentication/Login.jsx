import React, { useState } from 'react';
import {
  StyleSheet, View, Button, Image,
} from 'react-native';
import { signInWithEmailAndPassword } from 'firebase/auth';
import axios from 'axios';
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
    const url = 'http://localhost:8080/api/v1/users';
    try {
      if (email !== '' && password !== '') {
        const { user } = await signInWithEmailAndPassword(auth, email, password);
        const { data } = await axios.get(url, {
          headers: {
            Authorization: `Bearer ${await user.getIdToken()}`,
          },
        });
        user.puid = data;
      }
    } catch (err) {
      setLoginError(err.message);
    }
  };

  return (
    <View style={styles.container}>
      <Image source={require('../../assets/NativEatsLogo.png')} />
      <Image source={require('../../assets/NativEats.png')} />
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
        width="80%"
      />
      {loginError ? <LoginError error={loginError} visible /> : null}
      <LoginButton
        title="Sign In"
        onPress={onLogin}
        backgroundColor={COLORS.TURQUOISE}
        titleColor={COLORS.JASMINE}
        width="100%"
        titleSize={18}
      />
      <View style={styles.buttonContainer}>
        <Button title="Sign Up" onPress={() => navigation.navigate('Signup')} />
        <Button
          title="Forgot Password"
          onPress={() => navigation.navigate('ForgotPassword')}
        />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'space-around',
    margin: 40,
  },
  buttonContainer: {
    // flex: 1,
    flexDirection: 'row',
    justifyContent: 'space-between',
    width: '100%',
  },
  text: {
    fontSize: 30,
  },
});
