import React, { useContext } from 'react';
import {
  Text, StyleSheet, View, Button,
} from 'react-native';

// import { signOut } from 'firebase/auth';
import { IconButton } from './components';
import AuthUserContext from '../../contexts';
import { auth } from '../../firebaseConfig';

export default function MockHomeScreen({ navigation }) {
  const { user, setIsSignout } = useContext(AuthUserContext);
  const handleSignOut = async () => {
    try {
      setIsSignout(true);
      await auth.signOut();
    } catch (err) {
      console.log(err);
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
    </View>
  );
}
