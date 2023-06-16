import React from 'react';
import { Image, View, StyleSheet } from 'react-native';

const styles = StyleSheet.create({
  container: {
    width: 100,
    height: 100,
    borderRadius: 50,
    overflow: 'hidden',
  },
  image: {
    width: '100%',
    height: '100%',
  },
});

function UserIcon({ profilePhoto }) {
  return (
  <View style={styles.container}>
    <Image source={{ uri: profilePhoto }} style={styles.image} />
  </View>
  );
}

export default UserIcon;
