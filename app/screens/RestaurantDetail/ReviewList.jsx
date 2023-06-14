import { React, useState, useEffect } from 'react';
import axios from 'axios';
import { Text, View, Card } from 'react-native';
import ReviewEntry from './ReviewEntry';

function ReviewList({reviews}) {
  // const [reviews, setReviews] = useState([]);

  // useEffect(() => {
  //   axios.get('http://localhost:8080/api/v1/reviews')
  //     .then((res) => {
  //       setReviews(res.data);
  //     });
  // }, []);

  return (
    <View>
      {reviews.map((review) => (
        <ReviewEntry review={review} />
      ))}
    </View>
  );
}

export default ReviewList;
