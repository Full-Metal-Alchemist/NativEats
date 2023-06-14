import { React, useState, useEffect } from 'react';
import {
  View, Text, StyleSheet, FlatList, Image, Button,
} from 'react-native';
import axios from 'axios';
import { Avatar } from '@rneui/themed';
import Filter from './Filter';
import Search from './Search';
import List from './RList';

function HomePage({ navigation, route }) {
  const [arr, setArr] = useState([]);
  const [filter, setFilter] = useState(0);
  const [search, setSearch] = useState('');
  const styles = StyleSheet.create({
    img: {
      width: 50,
      height: 50,
    },
  });
  useEffect(() => {
    let params = {};
    switch (filter) {
      case 0:
        params = {
          category: null, order: null, search, cuisine: route.params.cuisine,
        };
        break;
      case 1:
        params = {
          category: 'price', order: 'INSC', search, cuisine: route.params.cuisine,
        };
        break;
      case 2:
        params = {
          category: 'price', order: 'DESC', search, cuisine: route.params.cuisine,
        };
        break;
      case 3:
        params = {
          category: 'review count', order: 'DESC', search, cuisine: route.params.cuisine,
        };
        break;
      case 4:
        params = {
          category: 'review', order: 'DESC', search, cuisine: route.params.cuisine,
        };
        break;
      default:
    }
    axios.get('http://localhost:8080/api/v1/restaurants', { params })
      .then((res) => {
        setArr(res.data);
      });
  }, [filter, search]);
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

      <Search search={search} setSearch={setSearch} />
      <Filter filter={filter} setFilter={setFilter} />
      <List arr={arr} navigation={navigation} />
    </View>
  );
}

export default HomePage;
