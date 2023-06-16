import { React } from 'react';
import { Text, View } from 'react-native';
import { Card } from 'react-native-elements';
import ReviewList from './ReviewList';

function Reviews({reviews}) {
  return (
    <View>
      <Card>
        <Card.Title>REVIEWS</Card.Title>
        {/* {reviews.length > 0 && <ReviewList reviews={reviews}/>} */}
      </Card>
    </View>
  );
}

export default Reviews;
