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
import RCard from './RCard';


const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: StatusBar.currentHeight,
  },
  scrollView: {
    backgroundColor: 'pink',
    marginHorizontal: 20,
  },
  text: {
    fontSize: 42,
  },
});

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
    // <View>
    //   {restaurants.map((restaurant) => (
    //     <RCard item={restaurant} key={restaurant.id} />
    //   ))}
    // </View>

      <SafeAreaView style={styles.container}>
        <ScrollView style={styles.scrollView}>
          <Text style={styles.text}>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
            eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
            minim veniam, quis nostrud exercitation ullamco laboris nisi ut
            aliquip ex ea commodo consequat. Duis aute irure dolor in
            reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
            pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
            culpa qui officia deserunt mollit anim id est laborum.
          </Text>
        </ScrollView>
      </SafeAreaView>
    );
}
export default RList;
