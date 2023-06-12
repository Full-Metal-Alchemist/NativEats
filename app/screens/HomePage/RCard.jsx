import { React, useState } from 'react';
import { View, Text } from 'react-native';
import { Card, Rating, AirbnbRating } from 'react-native-elements';

function RCard({ item }) {
  console.log(item.id);
  return (
    <Card>
      <Card.Title>{item.name}</Card.Title>
      <Card.Divider />
      <Rating imageSize={60} readonly startingValue={item.rating} />
      {/* <Card.Image source={{ url: item.photos[0] }} /> */}
      <Text>
        {item.address}
      </Text>
    </Card>

  );
}

export default RCard;
