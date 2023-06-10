import * as React from 'react';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import { createAppContainer } from 'react-navigation';
import { createStackNavigator } from 'react-navigation-stack';

import Login from './screens/authentication/Login';
import Signup from './screens/authentication/Signup';
import ForgotPassword from './screens/authentication/ForgotPass';

const navigator = createStackNavigator(
  {
    HomeScreen: Login,
    SignupScreen: Signup,
    ForgotPasswordScreen: ForgotPassword,
  },
  {
    initialRouteName: 'HomeScreen',
    defaultNavigationOptions: {
      title: 'App',
    },
  },
);

export default createAppContainer(navigator);
