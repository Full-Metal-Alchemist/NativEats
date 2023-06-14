import { React, useState } from 'react';
import { View, Text } from 'react-native';
import { Card, Rating, AirbnbRating } from 'react-native-elements';
import { BookmarkIcon as BookmarkIconOutline } from 'react-native-heroicons/outline';

function RCard({ navigation, item }) {
  console.log(item.id, item.rating);
  return (
    <Card>
      <Card.Title>{item.name}</Card.Title>
      <Card.Divider />
      <BookmarkIconOutline />
      <Card.Image
        source={{ url: item.photos }}
        onPress={() => {
          navigation.navigate('NativEat', { item });
        }}
      />
      <Rating imageSize={15} readonly startingValue={item.rating} />
      <Text>
        {item.reviewCount}
        {' '}
        reviews
      </Text>
    </Card>
  );
}

export default RCard;
