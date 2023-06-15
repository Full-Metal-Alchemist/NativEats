import { React, useState } from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Card, Rating, AirbnbRating } from 'react-native-elements';
import { BookmarkIcon as BookmarkIconOutline } from 'react-native-heroicons/outline';

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
    },
    // name: {
    //   fontSize: 50,
    // },
  });

  return (
    <Card styles={styles.cardContainer}>
      <BookmarkIconOutline styles={styles.bookmarkIcon} />
      <Card.Title titleStyle={{fontSize: 36}}>{item.name}</Card.Title>
      <Card.Divider />
      <Rating imageSize={15} readonly startingValue={item.rating} />
      <Card.Image
        source={{ url: item.photo }}
        onPress={() => {
          navigation.navigate('NativEat', { item });
        }}
      />
      <Text>
        {item.reviewCount}
        {' '}
        reviews
      </Text>
    </Card>
  );
}

export default RCard;
