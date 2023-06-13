import { React, useState, useEffect } from 'react';
import { Text, View, Card } from 'react-native';

function ReviewList() {
  const [reviews, setReviews] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:8080/api/v1/reviews')
      .then((res) => {
        setReviews(res.data);
      });
  }, []);

  return (
    {reviews?.map((review) => (
      <ReviewEntry review={review} />
    ))}
  );
}

export default ReviewList;
