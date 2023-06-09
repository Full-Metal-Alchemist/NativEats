import React, { useState, useEffect, useContext } from 'react';
import {
  View, Text, StyleSheet, FlatList, Image, Button, Dimensions, SafeAreaView,
} from 'react-native';
import axios from 'axios';
import { Avatar } from '@rneui/themed';
import Filter from './Filter';
import Search from './Search';
import List from './List';
import AuthUserContext from '../../contexts';
import BottomNav from '../recipes/BottomNav2';

function HomePage({ navigation, route }) {
  const [arr, setArr] = useState([]);
  const [filter, setFilter] = useState(0);
  const [search, setSearch] = useState('');
  // const cuisine = 2;
  const { user } = useContext(AuthUserContext);

  const cuisine = route.params.cuisine;
  const styles = StyleSheet.create({
    outerContainer: {
      height: Dimensions.get('window').height - 60,
      alignItems: 'center',
    },
    container: {
      flex: 1,
      paddingBottom: 125,
    },
    img: {
      width: 75,
      height: 75,
      // boxShadow: 0 3.2px 6.4px rgba(0, 0, 0, 0.1);
      borderRadius: 6,
    },
    imgContainer: {
      flex: 1,
      justifyContent: 'space-between',
      flexDirection: 'row',
      marginTop: 18,
      marginHorizontal: 24,
      marginBottom: 10,
    },
    listContainer: {
      flex: 6,
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
      // const reqConfig = {
      const id = await user.puid;
      console.log('****************', id);
       const headers = {
          Authorization: `Bearer ${await user.getIdToken()}`,
      //   },
       };
      //  const id = await user.puid;
      //  console.log('async id', id);
      try {
        const res = await axios.get('http://localhost:8080/api/v1/restaurants', { params, headers });
        await setArr(res.data);
      } catch (err) {
        console.log(err);
      }
    };
    help_function();
  }, [filter, search]);
  return (
    <SafeAreaView style={styles.outerContainer}>
      <View style={styles.container}>
        <View style={styles.imgContainer}>
          <Image style={styles.img} source={require('../../assets/logo.png')} />
          {/* <Image style={styles.img} source={require('../../assets/NativEats.png')} /> */}
          <Avatar
            size={75}
            rounded
            source={require('../../assets/profile.jpeg')}
          />
        </View>
        <View style={styles.listContainer}>
          <Search search={search} setSearch={setSearch} />
          <Filter filter={filter} setFilter={setFilter} />
          <List arr={arr} navigation={navigation} />
        </View>
      </View>
      <BottomNav navigation={navigation} />
    </SafeAreaView>
  );
}

export default HomePage;
