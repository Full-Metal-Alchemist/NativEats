import { React, useRef } from 'react';
import {
  Dimensions, Text, View, Image, StyleSheet,
} from 'react-native';
import Carousel from 'react-native-snap-carousel';

const SLIDER_WIDTH = Dimensions.get('window').width + 80;
const ITEM_WIDTH = Math.round(SLIDER_WIDTH * 0.7);

function CarouselCardItem({ item, index }) {
  return (
    <View style={styles.container} key={index}>
      <Image
        source={{ uri: item }}
        style={styles.image}
      />
    </View>
  );
}

function ImgCarousel({ photoarr }) {
  const isCarousel = useRef(null);
  return (
    <View style={styles.carouselCon}>
      <Carousel
        layout="tinder"
        layoutCardOffset={9}
        ref={isCarousel}
        data={photoarr}
        renderItem={CarouselCardItem}
        sliderWidth={SLIDER_WIDTH}
        itemWidth={ITEM_WIDTH}
        inactiveSlideShift={0}
        useScrollView
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: 'white',
    borderRadius: 8,
    width: ITEM_WIDTH,
    paddingBottom: 40,
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 3,
    },
    shadowOpacity: 0.29,
    shadowRadius: 4.65,
    elevation: 7,
    // flex: 3,
    // justifyContent: 'center',
    // alignItem: 'center',
  },
  image: {
    width: ITEM_WIDTH,
    height: 300,
  },
//   carouselCon: {
//     flex: 1,
//     justifyContent: 'center',
//     alignItem: 'center',
//   },
});

export default ImgCarousel;
