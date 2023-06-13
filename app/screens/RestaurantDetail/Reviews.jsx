import { React } from 'react';
import { Text, View } from 'react-native';
import { Card } from 'react-native-elements';
import ReviewList from './ReviewList';

function Reviews() {
  return (
    <View>
      <Card>
        <Card.Title>REVIEWS</Card.Title>
        <ReviewList />
      </Card>
    </View>
  );
}

export default Reviews;
