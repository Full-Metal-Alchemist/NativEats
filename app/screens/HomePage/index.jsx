import { React, useState, useEffect } from 'react';
import {
  View, Text, StyleSheet, FlatList, Image, Button,
} from 'react-native';
import axios from 'axios';
import Filter from './Filter';
import Search from './Search';
import RList from './RList';
import RCard from './RCard';

function HomePage({ navigation }) {
  const styles = StyleSheet.create({
    img: {
      width: 50,
      height: 50,
    },
  });

  return (
    <View style={{ paddingBottom: 500 }}>
      <View>
        <Image style={styles.img} source={require('../../assets/logo.png')} />
        <Image style={styles.img} source={require('../../assets/profile.jpeg')} />
      </View>

      <Search />
      <Filter />
      <RList navigation={navigation} />
    </View>
  );
}

export default HomePage;
