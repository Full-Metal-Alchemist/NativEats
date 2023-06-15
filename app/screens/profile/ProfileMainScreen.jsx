import React from 'react';
import {
  Text, StyleSheet, FlatList, SafeAreaView,
} from 'react-native';
import SettingsButton from './SettingsButton';
import { COLORS } from '../../constants/colors';
import UserIcon from '../shared/UserIcon';
import ReviewItem from './ReviewItem';

const mockUser = {
  id: '1',
  profilePhoto: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
  firstName: 'Jane',
  lastName: 'Doe',
  username: 'jdoe',
  bookmarks: ['1'],
};

const mockReviews = [
  {
    id: '1',
    rating: 3.46,
    comment: 'good flavor! these came securely packed... they were fresh and delicious! i love these Twizzlers!',
    photos: ['https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80'],
    createdAt: '2020-02-11 15:44:17',
    updatedAt: '2021-02-16 20:38:40',

  },
  {
    id: '2',
    rating: 2.19,
    comment: 'I love this candy. After weight watchers I had to cut back but still have a craving for it.',
    photos: ['https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=480&q=80'],
    createdAt: '2001-02-16 20:38:40',
    updatedAt: '2020-02-11 15:44:17',
  },
];

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'space-between',
  }
});

function ProfileMainScreen({ navigation }) {
  return (
    <SafeAreaView style={styles.container}>
      <View>
        <UserIcon profilePhoto={mockUser.profilePhoto} />
        <Text>Hello {mockUser.username}</Text>
        <FlatList
          style={styles.list}
          data={mockReviews}
          renderItem={({ item }) => <ReviewItem review={item} />}
          keyExtractor={(item) => item.id}
        />
      </View>
      <SettingsButton navigation={navigation} />
    </SafeAreaView>
  );
}

export default ProfileMainScreen;
