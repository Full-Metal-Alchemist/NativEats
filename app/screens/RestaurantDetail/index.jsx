import { React, useEffect, useState } from 'react';
import {
  ScrollView, Text, View, StyleSheet, FlatList, Dimensions, SafeAreaView, Button
} from 'react-native';
import axios from 'axios';
import { Card, Rating, AirbnbRating } from 'react-native-elements';
import {
  PhoneIcon as PhoneIconOutline, MapPinIcon as MapPinIconOutline, ClockIcon as ClockIconOutline, ArrowSmallRightIcon as ArrowSmallRightIconOutline, TruckIcon as TruckIconOutline, BookmarkIcon as BookmarkIconOutline, CreditCardIcon as CreditCardIconOutline,
} from 'react-native-heroicons/outline';
import ImgCarousel from './ImgCarousel';
import Reviews from './Reviews';
import { COLORS } from '../../constants/colors';
import BottomNav from '../recipes/BottomNav2';

const styles = StyleSheet.create({
  outerContainer: {
    height: Dimensions.get('window').height - 60,
    alignItems: 'center',
    marginBottom: -50,
  },
  container: {
    position: 'relative',
    width: Dimensions.get('window').width,
  },
  icons: {
    width: 16,
    heigth: 16,
    color: COLORS.TURQUOISE,
    // marginRight: 2,
  },
  bookmarkIcon: {
    width: 28,
    heigth: 28,
    color: COLORS.TURQUOISE,
    position: 'absolute',
    top: 0,
    right: 0,
    // transform: [{ translateX: -20 }, { translateY: 20 }],
  },
  name: {
    fontSize: 28,
    fontWeight: 700,
    textAlign: 'center',
    marginTop: 24,
    color: COLORS.SCARLET,
  },
  rating: {
    flex: 1,
    flexDirection: 'row',
    justifyContent: 'start',

    marginLeft: 16,
    marginTop: 16,
    marginBottom: 16,
  },
  price: {
    fontSize: 16,
    color: COLORS.SCARLET,
    marginRight: 24,
  },
  // text: {
  //   fontSize: 24,
  // },
});

function RestaurantDetail({ route, navigation }) {
  const item = route.params.item;
  // const [fill, setFill] = useState(route.params.filled);
  const [detail, setDetail] = useState({});
  // const [fillIcon, setFillIcon] = useState(route.params.filled);
  // console.log('filled', route.params.filled);
  // console.log('item', item);

  useEffect(() => {
    axios.get(`http://localhost:8080/api/v1/yelp/${item.yelpId}`)
      .then((res) => {
        setDetail(res.data);
        // console.log(res.data);
      });
  }, []);

  return (
    <SafeAreaView style={styles.outerContainer}>
      <ScrollView style={styles.container}>
        {/* <BookmarkIconOutline style={styles.bookmarkIcon} height={28} width={28} /> */}
        {/* <Button
          title=""
          icon={<BookmarkIconOutline fill={fillIcon ? COLORS.TURQUOISE : '#fff'} style={styles.bookmarkIcon} />}
          type="clear"
          onPress={() => {
            const help = async () => {
              if (fillIcon) {
              // delete req
                await axios({
                  url: 'http://localhost:8080/api/v1/bookmarks',
                  method: 'DELETE',
                  data: {
                    userId: 1,
                    restaurantId: item.id,
                  },
                });
                await setFillIcon(!fillIcon);
              } else {
              // post req
                await axios.post('http://localhost:8080/api/v1/bookmarks', {
                  userId: 1,
                  restaurantId: item.id,
                });
                await setFillIcon(!fillIcon);
              }
            };
            help();
          }}
        /> */}
        <Text style={styles.name}>{item.name}</Text>
        <Rating style={styles.rating} imageSize={18} readonly startingValue={item.rating} />
        <ImgCarousel photoarr={detail.photos} />
        <Card>
          <Text>
            <CreditCardIconOutline style={styles.icons} />
            {detail.price}
          </Text>
          <Card.Divider />
          <Text>
            <PhoneIconOutline style={styles.icons} />
            {item.phone}
          </Text>
          <Card.Divider />
          <Text>
            <MapPinIconOutline style={styles.icons} />
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
            {/* <ArrowSmallRightIconOutline style={styles.icons} /> */}
          </Text>
          <Card.Divider />
          {/* <Text>
          <TruckIconOutline style={styles.icons} />
          {item.transactions[0] ? item.transactions[0] : null}
          ,
          {item.transactions[1] ? item.transactions[1] : null}
        </Text> */}
        </Card>
        <Reviews reviews={item.reviews} />
      </ScrollView>
      <BottomNav navigation={navigation} />
    </SafeAreaView>
  );
}

export default RestaurantDetail;
