import { React, useState } from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Card, Rating, AirbnbRating } from 'react-native-elements';
import { BookmarkIcon as BookmarkIconOutline } from 'react-native-heroicons/outline';
import {COLORS} from '../../constants/colors';

function RCard({ navigation, item }) {
  console.log('in the card', item.id);

  const styles = StyleSheet.create({
    cardContainer: {
      position: 'relative',
    },
    bookmarkIcon: {
      position: 'absolute',
      top: 0,
      right: 0,
      color: COLORS.TURQUOISE,
    },
    name: {
      fontSize: 20,
      textAlign: 'center',
      color: COLORS.SCARLET,
    },
    // titleContainer: {
    //   flex: 1,
    //   justifyContent: 'center',
    //   alignItems: 'center',
    // },
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
    // detailContainer: {
    //   marginBottom: 12,
    //   flex: 1,
    //   // alignItems: 'space-between',
    //   flexDirection: 'row',
    //   gap: 12,
    // },
  });

  return (
    <Card style={styles.cardContainer}>
      <BookmarkIconOutline style={styles.bookmarkIcon} />
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
