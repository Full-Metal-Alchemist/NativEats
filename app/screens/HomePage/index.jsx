import { React, useState, useEffect } from 'react';
import {
  View, Text, StyleSheet, FlatList, Image,
} from 'react-native';
import Filter from './Filter';
import Search from './Search';
import RList from './RList';
import RCard from './RCard';
import axios from 'axios';

function HomePage() {
  const styles = StyleSheet.create({
    img: {
      width: 50,
      height: 50,
    },
  });

  return (
    <View>
      <View>
        <Image style={styles.img} source={require('../../assets/logo.png')}/>
        <Image style={styles.img} source={require('../../assets/profile.jpeg')} />
      </View>

      <Search />
      <Filter />
      <RList />

    </View>
  );
}

export default HomePage;
