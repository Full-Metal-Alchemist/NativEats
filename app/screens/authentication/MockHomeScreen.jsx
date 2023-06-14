import React, { useContext } from 'react';
import {
  Text, StyleSheet, View,
} from 'react-native';

// import { signOut } from 'firebase/auth';
import { IconButton } from './components';
import { AuthUserContext } from '../../App';
import { auth } from '../../firebaseConfig';

export default function MockHomeScreen({ navigation }) {
  const { user } = useContext(AuthUserContext);
  const handleSignOut = async () => {
    try {
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
        {user.email}
      </Text>
      <IconButton name="logout" onPress={handleSignOut} />
      <Text>
        UID:
        {' '}
        {user.uid}
      </Text>
    </View>
  );
}
