import React, { useState, useEffect } from 'react';
import {
  Text, StyleSheet, FlatList, SafeAreaView,
} from 'react-native';
import axios from 'axios';
import MoodButton from './MoodButton';
import { COLORS } from '../../../constants/colors';
import UserIcon from '../../shared/UserIcon';

const mockUser = {
  id: '1',
  profilePhoto: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
  firstName: 'Jane',
  lastName: 'Doe',
  username: 'jdoe',
  bookmarks: ['1'],
};

const styles = StyleSheet.create({
  text: {
    fontSize: 30,
  },
  touchable: {
    width: 300,
    borderWidth: 2,
    borderColor: '#20232a',
    borderRadius: 6,
    backgroundColor: COLORS.TURQUOISE,
    color: '#20232a',
    textAlign: 'center',
    fontSize: 30,
    fontWeight: 'bold',
    justifyContent: 'center',
  },
  list: {
    alignItems: 'center',
    padding: 0,
    margin: 0,
  },
});

function MoodPage({ navigation }) {
  const [cuisines, setCuisines] = useState([]);

  useEffect(() => {
    const helpFunction = async () => {
      try {
        const response = await axios.get('http://192.168.1.39:8080/api/v1/cuisines');
        console.log('API response: ', response.data);
        setCuisines(response.data);
      } catch (error) {
        console.log('THIS IS THE ERROR => ', error);
      }
    };
    helpFunction();
  }, []);

  return (
    <SafeAreaView style={styles.list}>
      <UserIcon profilePhoto={mockUser.profilePhoto} />
      <Text>What&apos;re you in the mood for?</Text>
      <FlatList
        data={cuisines}
        renderItem={({ item }) => (
          <MoodButton
            navigation={navigation}
            title={item.name}
            data={item}
            userId={mockUser.id}
          />
        )}
        keyExtractor={(item) => item.id}
      />
    </SafeAreaView>
  );
}

export default MoodPage;
