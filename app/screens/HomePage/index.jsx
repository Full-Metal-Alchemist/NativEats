import { React, useState, useEffect } from 'react';
import {
  View, Text, StyleSheet, FlatList, Image, Button,
} from 'react-native';
import axios from 'axios';
import { Avatar } from '@rneui/themed';
import Filter from './Filter';
import Search from './Search';
import List from './List';

function HomePage({ navigation, route }) {
  const [arr, setArr] = useState([]);
  const [filter, setFilter] = useState(0);
  const [search, setSearch] = useState('');
  const cuisine = 2;
  const styles = StyleSheet.create({
    img: {
      width: 50,
      height: 50,
    },
    imgContainer: {
      flex: 1,
      justifyContent: 'space-between',
      flexDirection: 'row',
    },
  });
  useEffect(() => {
    let params = {};
    switch (filter) {
      case 0:
        params = {
          category: 'created_at', order: 'DESC', search, cuisine,
        };
        break;
      case 1:
        params = {
          category: 'price', order: 'ASC', search, cuisine,
        };
        break;
      case 2:
        params = {
          category: 'price', order: 'DESC', search, cuisine,
        };
        break;
      case 3:
        params = {
          category: 'reviewCount', order: 'DESC', search, cuisine,
        };
        break;
      case 4:
        params = {
          category: 'rating', order: 'DESC', search, cuisine,
        };
        break;
      default:
        // params = {
        //   category: 'created_at', order: 'DESC', search, cuisine,
        // };
        // break;
    }
    const help_function = async () => {
      try {
        const res = await axios.get('http://localhost:8080/api/v1/restaurants', { params });
        await setArr(res.data);
      } catch (err) {
        console.log(err);
      }
    };
    help_function();
  }, [filter, search]);
  return (
    <View style={{ paddingBottom: 200 }}>
      <View style={styles.imgContainer}>
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
