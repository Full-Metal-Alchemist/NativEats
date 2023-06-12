import { React, useState } from 'react';
import { View, Text } from 'react-native';
import { Card } from 'react-native-elements';
import { Rating, AirbnbRating } from 'react-native-elements';

function RCard() {
  return (
    <Card>
      <Card.Title>HELLO WORLD</Card.Title>
      <Card.Divider/>
      <Rating
        showRating
        onFinishRating={3}
        style={{ paddingVertical: 10 }}
      />
      <Card.Image source={require('../../assets/profile.jpeg')} />
      <Text>
          The idea with React Native Elements is more about component structure than actual design.
      </Text>
    </Card>

  );
}

export default RCard;
