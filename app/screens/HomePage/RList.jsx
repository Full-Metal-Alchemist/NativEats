import { React, useState, useEffect } from 'react';
import {
  FlatList,
  SafeAreaView,
  StatusBar,
  StyleSheet,
  Text,
  TouchableOpacity,
  ScrollView,
  View,
} from 'react-native';
import axios from 'axios';
import List from './List';

function RList({ navigation }) {
  const [restaurants, setRestaurant] = useState([]);
  useEffect(() => {
    axios.get('http://localhost:8080/api/v1/restaurants')
      .then((res) => {
        setRestaurant(res.data);
        console.log(res.data.length);
      });
  }, []);

  return (
    <ScrollView style={{ paddingBottom: 100 }}>
      <List navigation={navigation} arr={restaurants} />
    </ScrollView>
  );
}
export default RList;
