import * as React from 'react';
// import { StatusBar } from 'expo-status-bar';
// import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

// import Login from './screens/authentication/Login';
// import Signup from './screens/authentication/Signup';
// import ForgotPassword from './screens/authentication/ForgotPass';
// import RecipesMain from './screens/recipes/RecipesMainScreen';
// import RecipesSingle from './screens/recipes/RecipesSingleScreen';
import Login from './screens/authentication/Login'

const Stack = createStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Login">
        {/* <Stack.Screen name="Login" component={Login} />
        <Stack.Screen name="Signup" component={Signup} />
        <Stack.Screen name="ForgotPassword" component={ForgotPassword} />
        <Stack.Screen name="RecipesMain" component={RecipesMain} />
        <Stack.Screen name="RecipesSingle" component={RecipesSingle} /> */}
        <Stack.Screen name="HomePage" component={HomePage} />
        <Stack.Screen name="BookMark" component={BookMark} />
        <Stack.Screen name="RestaurantDetail" component={RestaurantDetail} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
