import React from 'react';
import {
  View, Text, StyleSheet, FlatList,
} from 'react-native';
import { Card, Rating, AirbnbRating } from 'react-native-elements';
import { PhoneIcon as PhoneIconOutline, MapPinIcon as MapPinIconOutline, ClockIcon as ClockIconOutline, ArrowSmallRightIcon as ArrowSmallRightIconOutline, TruckIcon as TruckIconOutline, BookmarkIcon as BookmarkIconOutline } from "react-native-heroicons/outline";
import ImgCarousel from './ImgCarousel';

const styles = StyleSheet.create({
  icons: {
    width: 16,
    heigth: 16,
    color: '#55d6bf',
  },
  bookmarkIcon: {
    width: 20,
    heigth: 20,
  },
});

function RestaurantDetail({route, navigation }) {
  console.log(route.params.item);
  const item = route.params.item

  return (
    <View>
      <BookmarkIconOutline style={styles.icons} />
      <Text>{item.name}</Text>
      <Rating imageSize={15} readonly startingValue={item.rating} />
      <ImgCarousel photoarr={item.photos} />
      <Text>{item.price}</Text>
      <Card>
        <Text>
          <PhoneIconOutline style={styles.icons} />
          {item.phone}
        </Text>
        <Card.Divider/>
        <Text>
          <PhoneIconOutline style={styles.icons} />
          {item.address}, {item.city} {item.state}
        </Text>
        <Card.Divider/>
        <Text>
          <ClockIconOutline style={styles.icons} />
          See all hours
          <ArrowSmallRightIconOutline style={styles.icons} />
        </Text>
        <Card.Divider/>
        <Text>
          <TruckIconOutline style={styles.icons} />
          {item.transcation[0] ? item.transcation[0] : null}
          ,
          {item.transcation[1] ? item.transcation[1] : null}
        </Text>
      </Card>
    </View>
  );
}

export default RestaurantDetail;
