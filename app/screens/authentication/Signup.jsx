import React, { useState } from 'react';
import {
  View, StyleSheet,
} from 'react-native';
import { createUserWithEmailAndPassword, updateProfile } from 'firebase/auth';
import axios from 'axios';
import { LoginButton, LoginInput, LoginError } from './components';
import { auth } from '../../firebaseConfig';
import { COLORS } from '../../constants/colors';
// import { authAxiosPost } from '../../requests';

function Signup({ navigation }) {
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [showPassword, setshowPassword] = useState(true);
  const [rightIcon, setRightIcon] = useState('eye');
  const [signupError, setSignupError] = useState('');

  const handleShowPassword = () => {
    if (rightIcon === 'eye') {
      setRightIcon('eye-off');
      setshowPassword(!showPassword);
    } else if (rightIcon === 'eye-off') {
      setRightIcon('eye');
      setshowPassword(!showPassword);
    }
  };

  const handleSignup = async () => {
    const url = 'http://localhost:8080/api/v1/users'; // to do --> add base url to .env
    try {
      if (email !== '' && password !== '') {
        const { user } = await createUserWithEmailAndPassword(auth, email, password);
        await updateProfile(user, { displayName: `${firstName} ${lastName}` });
        const { puid } = await axios.post(url, {}, {
          headers: {
            Authorization: `Bearer ${await user.getIdToken()}`,
          },
        });
        user.puid = puid;
      }
    } catch (err) {
      setSignupError(err.message);
      console.log('Handle Signup Error', err);
    }
  };
  return (
    <View>
      <LoginInput
        placeholder="First Name"
        textContentType="givenName"
        value={firstName}
        onChangeText={(text) => setFirstName(text)}
        placeholderTextColor={COLORS.SCARLET}
        leftIcon="identifier"
        iconColor={COLORS.SCARLET}
      />
      <LoginInput
        placeholder="Last Name"
        textContentType="familyName"
        value={lastName}
        onChangeText={(text) => setLastName(text)}
        placeholderTextColor={COLORS.SCARLET}
        leftIcon="identifier"
        iconColor={COLORS.SCARLET}
      />
      {/* <LoginInput
        placeholder="Username"
        textContentType="username"
        value={username}
        onChangeText={(text) => setUsername(text)}
        placeholderTextColor={COLORS.SCARLET}
        leftIcon="account"
        iconColor={COLORS.SCARLET}
      /> */}
      <LoginInput
        placeholder="Email"
        keyboardType="email-address"
        textContentType="emailAddress"
        leftIcon="email"
        value={email}
        onChangeText={(text) => setEmail(text)}
        autoCapitalize="none"
        iconColor={COLORS.SCARLET}
        placeholderTextColor={COLORS.SCARLET}
      />
      <LoginInput
        placeholder="Password"
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
        placeholderTextColor={COLORS.SCARLET}
      />
      {signupError ? <LoginError error={signupError} visible /> : null}
      <LoginButton title="Sign up" onPress={handleSignup} backgroundColor={COLORS.TURQUOISE} titleColor={COLORS.JASMINE} titleSize={18} />
    </View>
  );
}

const styles = StyleSheet.create({
  textStyle: {
    marginVertical: 50,
  },
});

export default Signup;
