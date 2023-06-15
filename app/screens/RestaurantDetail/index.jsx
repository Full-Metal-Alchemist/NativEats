import { React, useEffect, useState } from 'react';
import {
  ScrollView, Text, StyleSheet, FlatList,
} from 'react-native';
import axios from 'axios';
import { Card, Rating, AirbnbRating } from 'react-native-elements';
import {
  PhoneIcon as PhoneIconOutline, MapPinIcon as MapPinIconOutline, ClockIcon as ClockIconOutline, ArrowSmallRightIcon as ArrowSmallRightIconOutline, TruckIcon as TruckIconOutline, BookmarkIcon as BookmarkIconOutline,
} from 'react-native-heroicons/outline';
import ImgCarousel from './ImgCarousel';
import Reviews from './Reviews';

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

function RestaurantDetail({ route, navigation }) {
  const item = route.params.item;
  console.log('yelp', item.yelpId);
  const [detail, setDetail] = useState({});

  useEffect(() => {
    axios.get(`http://localhost:8080/api/v1/restaurants/${item.yelpId}`)
      .then((res) => {
        setDetail(res.data);
        console.log(res.data);
      });
  }, []);

  return (
    <ScrollView>
      <BookmarkIconOutline style={styles.icons} />
      <Text>{item.name}</Text>
      <Rating imageSize={15} readonly startingValue={item.rating} />
      <ImgCarousel photoarr={detail.photos} />
      <Text>{detail.price}</Text>
      <Card>
        <Text>
          <PhoneIconOutline style={styles.icons} />
          {item.phone}
        </Text>
        <Card.Divider />
        <Text>
          <PhoneIconOutline style={styles.icons} />
          {item.address}
          ,
          {' '}
          {item.city}
          {' '}
          {item.state}
        </Text>
        <Card.Divider />
        <Text>
          <ClockIconOutline style={styles.icons} />
          See all hours
          <ArrowSmallRightIconOutline style={styles.icons} />
        </Text>
        <Card.Divider />
        {/* <Text>
          <TruckIconOutline style={styles.icons} />
          {item.transactions[0] ? item.transactions[0] : null}
          ,
          {item.transactions[1] ? item.transactions[1] : null}
        </Text> */}
      </Card>
      {/* <Reviews reviews={item.reviews} /> */}
    </ScrollView>
  );
}

export default RestaurantDetail;
