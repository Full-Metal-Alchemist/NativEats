import { React, useState, useEffect } from 'react';
import {
  FlatList,
  SafeAreaView,
  StatusBar,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import axios from 'axios';
import RCard from './RCard';

function RList() {
  const [restaurants, setRestaurant] = useState([]);
  useEffect(() => {
    axios.get('http://localhost:8080/api/v1/restaurants')
      .then((res) => {
        setRestaurant(res.data);
        console.log(res.data.length);
      });
  }, []);

  return (
    <View>
      <FlatList
        data={restaurants}
        renderItem={({ item }) => (
          <RCard item={item} />
        )}
        keyExtractor={(item) => item.id}
      />
    </View>
  );
}
export default RList;
