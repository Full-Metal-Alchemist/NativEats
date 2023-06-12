import { React } from 'react';
import { Dimensions, Text, View } from 'react-native';
import Carousel from 'react-native-reanimated-carousel';

function ImgCarousel({ photoarr }) {
  const { width } = Dimensions.get('window');
  return (
    <View>
      <Carousel
        loop
        width={width}
        height={width / 2}
        autoPlay
        data={photoarr}
        scrollAnimationDuration={1000}
        onSnapToItem={(index) => console.log('current index:', index)}
        renderItem={({ index }) => (
          <View
            style={{
              borderWidth: 1,
            }}
          >
            <Text style={{ textAlign: 'center', fontSize: 30 }}>
              {index}
            </Text>
          </View>
        )}
      />
    </View>
  );
}

export default ImgCarousel;
