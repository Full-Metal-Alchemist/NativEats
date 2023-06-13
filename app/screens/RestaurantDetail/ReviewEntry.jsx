import { React, useState, useEffect } from 'react';
import { Text, View } from 'react-native';
import { Card, Rating, AirbnbRating } from 'react-native-elements';

function ReviewEntry({ review }) {

  return (
    <Card.Divider />
    <Rating imageSize={15} readonly startingValue={review.rating} />
    <Text>{review.comment}</Text>
    <Text>{review.comment}</Text>
  );
}

export default ReviewEntry;
