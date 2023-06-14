import React from 'react';
import {
  Text, StyleSheet, FlatList, SafeAreaView,
} from 'react-native';
// import mockUser from '../../../../__mocks__/mockUser';
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

const mockQuisine = [
  {
    id: '1',
    name: 'Japanese',
    history: 'Some history about Japanese food',
    customs: 'Some customs about Japanese food',
    photo: 'https://images.unsplash.com/photo-1580822184713-fc5400e7fe10?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
    restaurants: [
      {
        id: 1,
        name: 'Olive Garden',
        description: 'Italian food for the family',
        photos: 'https://images.unsplash.com/photo-1580121676785-ea9ca33e3fb2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=435&q=80',
        rating: '4.2',
        price: '$$',
        reviewCount: 670,
        popularity: 70,
        address: '932 North Mills Avenue',
        city: 'Orlando',
        zip: '90210',
        state: 'FL',
        country: 'USA',
        latitude: '28.5578450000',
        longitude: '-81.3645470000',
        isVisible: true,
        transactions: null,
        hours: null,
        phone: null,
        createdAt: '2023-06-13T13:37:56.854Z',
        cuisine_restaurant: {
          cuisineId: 1,
          restaurantId: 1,
        },
      },
    ],
  },
  {
    id: '2',
    name: 'Korean',
    history: 'Some history about Korean food',
    customs: 'Some customs about Korean food',
    photo: 'https://images.unsplash.com/photo-1590301157890-4810ed352733?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=436&q=80',
    restaurants: [
      {
        id: 1,
        name: 'Olive Garden',
        description: 'Italian food for the family',
        photos: 'https://images.unsplash.com/photo-1580121676785-ea9ca33e3fb2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=435&q=80',
        rating: '4.2',
        price: '$$',
        reviewCount: 670,
        popularity: 70,
        address: '932 North Mills Avenue',
        city: 'Orlando',
        zip: '90210',
        state: 'FL',
        country: 'USA',
        latitude: '28.5578450000',
        longitude: '-81.3645470000',
        isVisible: true,
        transactions: null,
        hours: null,
        phone: null,
        createdAt: '2023-06-13T13:37:56.854Z',
        cuisine_restaurant: {
          cuisineId: 1,
          restaurantId: 1,
        },
      },
    ],
  },
  {
    id: '3',
    name: 'Persian',
    history: 'Some history about Persian food',
    customs: 'Some customs about Persian food',
    photo: 'https://images.unsplash.com/photo-1604741333810-0ef6017256da?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
    restaurants: [],
  },
  {
    id: '4',
    name: 'Italian',
    history: 'Some history about Italian food',
    customs: 'Some customs about Italian food',
    photo: 'https://plus.unsplash.com/premium_photo-1673439307239-f30b4f467d35?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
    restaurants: [],
  },
  {
    id: '5',
    name: 'Chinese',
    history: 'Some history about Chinese food',
    customs: 'Some customs about Chinese food',
    photo: 'https://images.unsplash.com/flagged/photo-1556742524-750f2ab99913?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
    restaurants: [],
  },
];

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
  return (
    <SafeAreaView style={styles.list}>
      <UserIcon profilePhoto={mockUser.profilePhoto} />
      <Text>What&apos;re you in the mood for?</Text>
      <FlatList
        data={mockQuisine}
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
