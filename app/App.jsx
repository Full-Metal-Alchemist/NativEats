import React, { useState, createContext, useEffect } from 'react';
// import { StatusBar } from 'expo-status-bar';
import { ActivityIndicator, View } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { onAuthStateChanged } from 'firebase/auth';
import { auth } from './firebaseConfig';

import MockHomeScreen from './screens/authentication/MockHomeScreen';
import Login from './screens/authentication/Login';
import Signup from './screens/authentication/Signup';
import ForgotPassword from './screens/authentication/ForgotPass';
import RecipesMain from './screens/recipes/RecipesMainScreen';
import RecipesSingle from './screens/recipes/RecipesSingleScreen';
import FoodieTour from './screens/tour/FoodieTour';

export const AuthUserContext = createContext({});
const Stack = createStackNavigator();

export default function App() {
  const [user, setUser] = useState(null);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const unsubAuth = onAuthStateChanged(auth, async (authUser) => {
      try {
        await (authUser ? setUser(authUser) : setUser(null));
        setIsLoading(false);
      } catch (err) {
        console.log(err);
      }
    });
    console.log('Unsub Auth', unsubAuth);
    return unsubAuth;
  }, []);

  if (isLoading) {
    return (
      <View>
        <ActivityIndicator size="large" />
      </View>
    );
  }

  return (
    <AuthUserContext.Provider value={{ user, setUser }}>
      <NavigationContainer>
        {user
          ? (
            // screens accessible on login
            <Stack.Navigator
              initialRouteName="MockHomeScreen"
              screenOptions={{
                headerStyle: { elevation: 0 },
                cardStyle: { backgroundColor: '#ffdf7a' },
              }}
            >
              <Stack.Screen name="MockHomeScreen" component={MockHomeScreen} />
              <Stack.Screen name="RecipesMain" component={RecipesMain} />
              <Stack.Screen name="RecipesSingle" component={RecipesSingle} />
              <Stack.Screen name="FoodieTour" component={FoodieTour} />
            </Stack.Navigator>
          )
          : (
            // screens accessible when not logged in
            <Stack.Navigator initialRouteName="Login">
              <Stack.Screen name="Login" component={Login} />
              <Stack.Screen name="Signup" component={Signup} />
              <Stack.Screen name="ForgotPassword" component={ForgotPassword} />
            </Stack.Navigator>
          )}
      </NavigationContainer>
    </AuthUserContext.Provider>
  );
}
