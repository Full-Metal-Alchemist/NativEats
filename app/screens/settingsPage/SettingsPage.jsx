import React from 'react';
import {
  Text, StyleSheet, FlatList, SafeAreaView,
} from 'react-native';
// import mockUser from '../../../../__mocks__/mockUser';
import ChangePassword from './ChangePassword';
import DeleteAccount from './DeleteAccount';
import LogOut from './LogOut';
import UpdateProfilePicture from './UpdateProfilePicture';
import { COLORS } from '../../constants/colors';
import UserIcon from '../shared/UserIcon';

const mockUser = {
  id: '1',
  profilePhoto: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
  firstName: 'Jane',
  lastName: 'Doe',
  username: 'jdoe',
  bookmarks: ['1'],
};

function SettingsPage({ navigation }) {
  return (
    <SafeAreaView>
      <UserIcon profilePhoto={mockUser.profilePhoto} />
      <Text>Settings</Text>
      <FlatList />
    </SafeAreaView>
  );
}

export default SettingsPage;
