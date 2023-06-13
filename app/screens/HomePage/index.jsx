import { React, useState, useEffect } from 'react';
import {
  View, Text, StyleSheet, FlatList, Image, Button,
} from 'react-native';
import axios from 'axios';
import { Avatar } from '@rneui/themed';
import Filter from './Filter';
import Search from './Search';
import List from './RList';

function HomePage({ navigation }) {
  const[arr, setArr] = useState([]);
  const styles = StyleSheet.create({
    img: {
      width: 50,
      height: 50,
    },
  });
  useEffect(() => {
    axios.get('http://localhost:8080/api/v1/restaurants')
      .then((res) => {
        setArr(res.data);
        console.log(res.data.length);
      });
  }, []);
  return (
    <View style={{ paddingBottom: 500 }}>
      <View>
        <Image style={styles.img} source={require('../../assets/logo.png')} />
        {/* <Image style={styles.img} source={require('../../assets/profile.jpeg')} /> */}
        <Avatar
          size={64}
          rounded
          source={require('../../assets/profile.jpeg')}
        />
      </View>

      <Search setArr={setArr} />
      <Filter setArr={setArr} />
      <List arr={arr} navigation={navigation} />
    </View>
  );
}

export default HomePage;
