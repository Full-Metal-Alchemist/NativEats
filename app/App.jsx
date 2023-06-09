import React, { useState, useEffect } from 'react';
// import { StatusBar } from 'expo-status-bar';
import { ActivityIndicator, View } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { onAuthStateChanged } from 'firebase/auth';
import AuthUserContext from './contexts';
import { auth } from './firebaseConfig';
import { COLORS } from './constants/colors';

import MockHomeScreen from './screens/authentication/MockHomeScreen';
import Login from './screens/authentication/Login';
import Signup from './screens/authentication/Signup';
import ForgotPassword from './screens/authentication/ForgotPass';
import RecipesMain from './screens/recipes/RecipesMainScreen';
import RecipesSingle from './screens/recipes/RecipesSingleScreen';
import MoodPage from './screens/landing/moodpage/MoodPage';
import SettingsPage from './screens/settingsPage/SettingsPage';
import FoodieTour from './screens/tour/FoodieTour';
import HomePage from './screens/HomePage';
import BookMark from './screens/BookMark';
import RestaurantDetail from './screens/RestaurantDetail';
import CulturalInsights from './screens/cultural/Cultural';
import ProfileMainScreen from './screens/profile/ProfileMainScreen';

const Stack = createStackNavigator();

export default function App() {
  const [user, setUser] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [isSignout, setIsSignout] = useState(false);
  const [cuisine, setCuisine] = useState();

  useEffect(() => {
    const unsubAuth = onAuthStateChanged(auth, async (authUser) => {
      try {
        await (authUser ? setUser(authUser) : setUser(null));
        setIsLoading(false);
      } catch (err) {
        console.log(err);
      }
    });
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
    <AuthUserContext.Provider value={{ user, setUser, setIsSignout, cuisine, setCuisine }}>
      <NavigationContainer>
        {user
          ? (
            // screens accessible on login
            <Stack.Navigator
              initialRouteName="MoodPage"
              screenOptions={{
                headerStyle: { elevation: 0 },
                cardStyle: { backgroundColor: COLORS.JASMINE },
              }}
            >
              {/* <Stack.Screen name="MockHomeScreen" component={MockHomeScreen} /> */}
              <Stack.Screen name="MoodPage" component={MoodPage} />
              <Stack.Screen name="MockHomeScreen" component={MockHomeScreen} />
              <Stack.Screen name="Restaurants" component={HomePage} />

              <Stack.Screen name="RecipesMain" component={RecipesMain} />
              <Stack.Screen name="RecipesSingle" component={RecipesSingle} />
              <Stack.Screen name="FoodieTour" component={FoodieTour} />
              <Stack.Screen name="SettingsPage" component={SettingsPage} />
              <Stack.Screen name="UserProfile" component={ProfileMainScreen} />
              <Stack.Screen name="BookMark" component={BookMark} />
              <Stack.Screen name="NativEat" component={RestaurantDetail} />
              <Stack.Screen name="CulturalInsights" component={CulturalInsights} />
            </Stack.Navigator>
          )
          : (
            // screens accessible when not logged in
            <Stack.Navigator
              initialRouteName="Login"
              screenOptions={{
                headerStyle: { elevation: 0 },
                cardStyle: { backgroundColor: COLORS.JASMINE },
              }}
            >
              <Stack.Screen
                name="Login"
                component={Login}
                options={{
                  animationTypeForReplace: isSignout ? 'pop' : 'push',
                }}
              />
              <Stack.Screen name="Signup" component={Signup} />
              <Stack.Screen name="ForgotPassword" component={ForgotPassword} />
            </Stack.Navigator>
          )}
      </NavigationContainer>
    </AuthUserContext.Provider>
  );
}
