import * as React from 'react';
// import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import Login from './screens/authentication/Login';
import Signup from './screens/authentication/Signup';
import ForgotPassword from './screens/authentication/ForgotPass';
import RecipesMain from './screens/recipes/RecipesMainScreen';
import RecipesSingle from './screens/recipes/RecipesSingleScreen';
import MoodPage from './screens/landing/moodpage/MoodPage';
import FoodieTour from './screens/tour/FoodieTour';
import CulturalInsights from './screens/cultural/Cultural';

const Stack = createStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator
        initialRouteName="CulturalInsights"
        screenOptions={{
          headerStyle: { elevation: 0 },
          cardStyle: { backgroundColor: '#ffdf7a' },
        }}
      >
        <Stack.Screen name="Login" component={Login} />
        <Stack.Screen name="Signup" component={Signup} />
        <Stack.Screen name="ForgotPassword" component={ForgotPassword} />
        <Stack.Screen name="MoodPage" component={MoodPage} />
        <Stack.Screen name="RecipesMain" component={RecipesMain} />
        <Stack.Screen name="RecipesSingle" component={RecipesSingle} />
        <Stack.Screen name="FoodieTour" component={FoodieTour} />
        <Stack.Screen name="CulturalInsights" component={CulturalInsights} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
