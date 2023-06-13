import { React } from 'react';
import { Text, View, Card } from 'react-native';
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
