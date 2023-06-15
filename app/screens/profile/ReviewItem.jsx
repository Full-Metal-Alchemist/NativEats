import React from 'react';
import { View, Text } from 'react-native';

function ReviewItem({ review }) {
  return (
    <View style={{ marginBottom: 20 }}>
      <Text>Rating: {review.rating}</Text>
      <Text>{review.comment}</Text>
    </View>
  );
}

export default ReviewItem;
