import React, { useContext } from 'react';
import {
  Text, StyleSheet, View, Button,
} from 'react-native';
import axios from 'axios';

// import { signOut } from 'firebase/auth';
import { IconButton } from './components';
import AuthUserContext from '../../contexts';
import { auth } from '../../firebaseConfig';

export default function MockHomeScreen({ navigation }) {
  const { user, setIsSignout } = useContext(AuthUserContext);

  console.log('access token', user.accessToken);

  const handleSignOut = async () => {
    try {
      setIsSignout(true);
      await auth.signOut();
    } catch (err) {
      console.log(err);
    }
  };

  const sendTestRequest = async () => {
    const url = 'http://localhost:8080/api/v1/restaurants?category=created_at&order=desc&cuisine=2';
    const reqConfig = {
      headers: {
        Authorization: `Bearer ${await user.getIdToken()}`,
      },
    };
    try {
      const res = await axios.get(url, reqConfig);
      console.log('Test Req Response createdat:', res);
    } catch (err) {
      console.log('Test Req Error:', err);
    }
  };

  return (
    <View>
      <Text>Pay no attention to me. Just filling in!</Text>
      <Text>
        User:
        {' '}
        {/* {user.email} */}
      </Text>
      <IconButton name="logout" onPress={handleSignOut} />
      <Text>
        UID:
        {' '}
        {/* {user.uid} */}
      </Text>
      <Button title="RecipesMain" onPress={() => navigation.navigate('RecipesMain')} />
      <Button title="RecipesSingle" onPress={() => navigation.navigate('RecipesSingle')} />
      <Button title="FoodieTour" onPress={() => navigation.navigate('FoodieTour')} />
      <Button title="MoodPage" onPress={() => navigation.navigate('MoodPage')} />
      <Button title="CulturalInsights" onPress={() => navigation.navigate('CulturalInsights')} />
      <Button title="TestRequest" onPress={() => sendTestRequest()} />
      <Button title="Print puid" onPress={() => console.log('puid button', user.puid)} />
    </View>
  );
}
