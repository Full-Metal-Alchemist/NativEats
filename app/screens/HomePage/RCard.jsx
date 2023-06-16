import { React, useState, useContext } from 'react';
import { View, Text, StyleSheet } from 'react-native';
import {
  Card, Rating, AirbnbRating, Button,
} from 'react-native-elements';
import { BookmarkIcon as BookmarkIconOutline } from 'react-native-heroicons/outline';
import axios from 'axios';
import { COLORS } from '../../constants/colors';
import AuthUserContext from '../../contexts';

function RCard({ navigation, item, isBooked }) {
  // console.log('in the card', item.id);
  const { user } = useContext(AuthUserContext);
  console.log('user', user.puid);
  const [filled, setFill] = useState(isBooked);
  // console.log(item, 'item from rcard');

  const styles = StyleSheet.create({
    cardContainer: {
      position: 'relative',
    },
    bookmarkIcon: {
      position: 'absolute',
      top: 0,
      right: 0,
      color: COLORS.TURQUOISE,
      zIndex: 100,
      transform: [{ translateX: 0 }, { translateY: -2.5 }],
    },
    name: {
      fontSize: 20,
      textAlign: 'center',
      color: COLORS.SCARLET,
      marginTop: 8,
    },
    reviewCount: {
      fontSize: 16,
      textAlign: 'right',
      color: COLORS.SCARLET,
      marginTop: 12,
    },
    ratingContainer: {
      marginBottom: 12,
      flex: 1,
      alignItems: 'space-between',
      flexDirection: 'row',
    },
    ratingText: {
      color: COLORS.SCARLET,
      marginLeft: 12,
      fontSize: 16,
    },
  });

  return (
    <Card style={styles.cardContainer}>
      <Button
        title=""
        icon={<BookmarkIconOutline fill={filled ? COLORS.TURQUOISE : '#fff'} style={styles.bookmarkIcon} />}
        type="clear"
        onPress={() => {
          const help = async () => {
            // const reqConfig = {
            //   headers: {
            //     Authorization: `Bearer ${user.accessToken}`, // this may cause bug for extended login
            //   },
            // };

            // const headers = {
            //     Authorization: `Bearer ${user.accessToken}`, // this may cause bug for extended login
            //   },
            // };

            const headers = {Authorization: `Bearer ${await user.getIdToken()}`,};
            const id = await user.puid;
            if (filled) {
              // delete req
              await axios({
                url: 'http://localhost:8080/api/v1/bookmarks',
                method: 'DELETE',
                data: {
                  userId: id,
                  restaurantId: item.id,
                },
                headers,
              });
              await setFill(!filled);
            } else {
              // post req
              await axios({
                url: 'http://localhost:8080/api/v1/bookmarks',
                method: 'POST',
                data: {
                  userId: id,
                  restaurantId: item.id,
                },
                headers,
              });
              await setFill(!filled);
            }
          };
          help();
        }}
      />
      <Card.Title style={styles.name}>{item.name}</Card.Title>
      <Card.Divider />
      <View style={styles.ratingContainer}>
        <Rating imageSize={15} readonly startingValue={item.rating} />
        <Text style={styles.ratingText}>{item.rating}</Text>
      </View>
      <Card.Image
        source={{ url: item.photo }}
        onPress={() => {
          navigation.navigate('NativEat', { item });
        }}
      />
      <Text style={styles.reviewCount}>
        {item.reviewCount}
        {' '}
        reviews
      </Text>
    </Card>
  );
}

export default RCard;
