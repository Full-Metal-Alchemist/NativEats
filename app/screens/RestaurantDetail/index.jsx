import React from 'react';
import {
  View, Text, StyleSheet, FlatList,
} from 'react-native';
import { Card, Rating, AirbnbRating } from 'react-native-elements';

function RestaurantDetail({route, navigation }) {
  console.log(route.params.item);
  const item = route.params.item

  return (
    <View>
      <Text>{item.name}</Text>
      <Text>{item.phone}</Text>
      <Rating imageSize={15} readonly startingValue={item.rating} />
      <Text>{item.price}</Text>
      <Card>
        <Text>{item.address}, {item.city} {item.state}</Text>
        <Card.Divider/>
        <Text></Text>
      </Card>
    </View>
  );
}

export default RestaurantDetail;
